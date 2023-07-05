import json
import os
import time
from collections import Counter

import pandas as pd
import yaml
from html2text import html2text

with open('peer_discussion/config.yml') as f:
    config = yaml.safe_load(f)

# reviews from reviewer1
reviewer1_name = config['reviewer1']
path = os.path.join(config['vicuna_results_folder'],
                    config['vicuna_review_file'].format(
                        model1=config['model1'],
                        model2=config['model2'],
                        reviewer=reviewer1_name))
with open(path, 'r') as f:
    reviewer1 = [json.loads(line) for line in f.readlines()]

# reviews from reviewer2
reviewer2_name = config['reviewer2']
path = os.path.join(config['vicuna_results_folder'],
                    config['vicuna_review_file'].format(
                        model1=config['model1'],
                        model2=config['model2'],
                        reviewer=reviewer2_name))
with open(path, 'r') as f:
    reviewer2 = [json.loads(line) for line in f.readlines()]

# original questions
path = config['vicuna_question_path']
with open(path, 'r') as f:
    questions = [json.loads(line) for line in f.readlines()]
    questions = {q['question_id']: q['text'] for q in questions}

# original answer from model1
path = config['vicuna_answer_path'].format(model=config['model1'])
with open(path, 'r') as f:
    answer_model1 = [json.loads(line) for line in f.readlines()]
    answer_model1 = {a['answer_id']: a['text'] for a in answer_model1}

# original answer from model2
path = config['vicuna_answer_path'].format(model=config['model2'])
with open(path, 'r') as f:
    answer_model2 = [json.loads(line) for line in f.readlines()]
    answer_model2 = {a['answer_id']: a['text'] for a in answer_model2}

df_human = pd.read_csv(config['vicuna_human_annotation'])

all_data = []
for idx, (r1, r2) in enumerate(zip(reviewer1, reviewer2)):
    # extract basic information from reviews files
    question = questions[r1['question_id']]
    answer_a = answer_model1[r1['answer1_id']]
    answer_b = answer_model2[r1['answer2_id']]
    answer_a_type = config['model1']
    answer_b_type = config['model2']
    preference_reviewer1 = r1['score']
    preference_reviewer2 = r2['score']
    justification_reviewer1 = r1['text']
    justification_reviewer2 = r2['text']

    # find corresponding human preference
    df_question = df_human[(df_human['prompt']==question) &
                           (((config['model1']==df_human['system_a']) &
                             (config['model2']==df_human['system_b'])) |
                            ((config['model2']==df_human['system_a']) &
                             (config['model1']==df_human['system_b'])))]
    preference_human = df_question['answer'].tolist()
    preference_human = [(3 if 'tie' == text else
                         1 if 'system_a' == text else
                         2) for text in preference_human]
    justification_human = [''] * len(preference_human)

    # human majority vote
    count = Counter(preference_human)
    major = count.most_common(1)[0]
    if 1 == major[1]:
        majority_vote = 3
    else:
        majority_vote = major[0]

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
                        'majority_vote': majority_vote
                     }],
                     })

print(len(all_data))

# save to file
path = os.path.join(config['vicuna_results_folder'],
                    config['vicuna_all_data'].format(
                        reviewer1=config['reviewer1'],
                        reviewer2=config['reviewer2'],
                        multi='multi' if config['add_prompt_each_round'] else 'single',
                        model1=config['model1'],
                        model2=config['model2']))
with open(path, 'w') as f:
    json.dump(all_data, f, indent=2)

