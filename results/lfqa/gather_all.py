import json
import os
import time

import yaml
from html2text import html2text

with open('peer_discussion/config.yml') as f:
    config = yaml.safe_load(f)

# reviews from reviewer1
reviewer1_name = config['reviewer1']
reviewer1_path = os.path.join(config['lfqa_results_folder'],
                              config['lfqa_review_file'].format(
                                 reviewer=reviewer1_name,
                                 temperature=config['temperature_reviewer1'],
                                 mode=config['mode']))
with open(reviewer1_path, 'r') as f:
    reviewer1 = json.load(f)
print(reviewer1_path)

# reviews from reviewer2
reviewer2_name = config['reviewer2']
reviewer2_path = os.path.join(config['lfqa_results_folder'],
                              config['lfqa_review_file'].format(
                                 reviewer=reviewer2_name,
                                 temperature=config['temperature_reviewer2'],
                                 mode=config['mode']))
with open(reviewer2_path, 'r') as f:
    reviewer2 = json.load(f)
print(reviewer2_path)

# original data
path = config['lfqa_path']
with open(path, 'r') as f:
    data = [json.loads(line) for line in f.readlines()]
print(path)

# gather all data
all_data = []
for r1, r2 in zip(reviewer1, reviewer2):
    assert r1['question'] == r2['question']

    # extract basic information from reviews files
    question = r1['question']
    answer_a = r1['answer_a']
    answer_b = r1['answer_b']
    answer_a_type = r1['answer_a_type']
    answer_b_type = r1['answer_b_type']
    preference_human = [r1['preference_human']]
    preference_reviewer1 = r1[f'preference_{reviewer1_name}']
    preference_reviewer2 = r2[f'preference_{reviewer2_name}']
    justification_human = [r1['justification_human']]
    justification_reviewer1 = r1[f'justification_{reviewer1_name}']
    justification_reviewer2 = r2[f'justification_{reviewer2_name}']

    # find corresponding human reviews and preference
    for d in data:
        q = html2text(d['question']).strip()
        j = d['justification']
        p = int(d['overall_preference'] / 2 + 3 / 2) # -1, 1 to 1, 2
        if q == question and j != justification_human[0]:
            justification_human.append(j)
            preference_human.append(p)

    # store data
    all_data.append({'question': question,
                      'answer_a': answer_a,
                      'answer_b': answer_b,
                      'answer_a_type': answer_a_type,
                      'answer_b_type': answer_b_type,
                      f'initial_justification_{reviewer1_name}': {
                          'justification': justification_reviewer1,
                          'preference': preference_reviewer1
                      },
                      f'initial_justification_{reviewer2_name}': {
                          'justification': justification_reviewer2,
                          'preference': preference_reviewer2
                      },
                      'justification_human': [{
                              'justification': just,
                              'preference': pref
                          } for just, pref in zip(justification_human,
                                                  preference_human)] + [{
                         'majority_vote': max(preference_human,
                                              key=preference_human.count)
                      }],
                      })

print(len(all_data))

# save to file
save_path = os.path.join(config['lfqa_results_folder'],
                         config['lfqa_all_data'].format(
                             reviewer1=config['reviewer1'],
                             reviewer2=config['reviewer2'],
                             multi='multi' if config['add_prompt_each_turn'] else 'single',
                             mode=config['mode']))
with open(save_path, 'w') as f:
    json.dump(all_data, f, indent=2)

