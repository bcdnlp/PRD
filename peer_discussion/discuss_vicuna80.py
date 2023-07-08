import json
import os
import re
import time

import pandas as pd
import yaml
from html2text import html2text
from tqdm import tqdm

with open('config.yml') as f:
    config = yaml.safe_load(f)

from prompt_generation import prompt_discuss_generation_vicuna, add_prompt_each_turn_vicuna
from utils import api_call, result_extraction, history_formatting

def run(reviewers):
    reviewers_name = [config[f'reviewer{reviewers[0]}'],
                      config[f'reviewer{reviewers[1]}']]
    discussion_name = '_'.join([reviewers_name[0], reviewers_name[1], 'discussion'])

    # read all questions
    path = os.path.join(config['vicuna_results_folder'],
                        config['vicuna_all_data'].format(
                            reviewer1=config['reviewer1'],
                            reviewer2=config['reviewer2'],
                            multi='multi' if config['add_prompt_each_turn'] else 'single',
                            model1=config['model1'],
                            model2=config['model2']))
    with open(path, 'r') as f:
        all_data = json.load(f)
    print(path)
    print(len(all_data))

    # log file
    log_path = os.path.join(config['vicuna_results_folder'],
                            config['vicuna_discuss_log_file'].format(
                                reviewer1=reviewers_name[0],
                                reviewer2=reviewers_name[1],
                                model1=config['model1'],
                                model2=config['model2'],
                                multi='multi' if config['add_prompt_each_turn'] else 'single'))
    f = open(log_path, 'w')
    print(log_path)

    for d in tqdm(all_data):
        # extract information
        question = d['question']
        answer_a = d['answer_a']
        answer_b = d['answer_b']
        answer_a_type = d['answer_a_type']
        answer_b_type = d['answer_b_type']

        # results from initial justifications
        initial_reviewer1 = d[f'initial_justification_{reviewers_name[0]}']
        initial_reviewer2 = d[f'initial_justification_{reviewers_name[1]}']

        # only discuss questions with different initial preferences
        if (config['only_diff'] and
                initial_reviewer1['preference'] == initial_reviewer2['preference']):
            continue

        # generate prompts for the 1st turn 
        reviewer1_history, reviewer2_history = prompt_discuss_generation_vicuna(
                                                  reviewers_name,
                                                  question,
                                                  answer_a,
                                                  answer_b,
                                                  initial_reviewer1['justification'],
                                                  initial_reviewer2['justification'],
                                                  )
        # logging
        for text in reviewer1_history:
            print('system:' + text + '\n', file=f)

        # multi-turn discussion
        for turn_no in range(config['max_turn']):
            if 0 == turn_no % 2: # reviewer1, turn 1, 3
                justification = api_call(reviewers_name[0],
                                         reviewer1_history,
                                         reviewers[0])
            else: # reviewer2, turn 2, 4
                justification = api_call(reviewers_name[1],
                                         reviewer2_history,
                                         reviewers[1])

            if config['add_prompt_each_turn']:
                justification = add_prompt_each_turn_vicuna(justification, (turn_no+1)%2)

            reviewer1_history.append(justification)
            reviewer2_history.append(justification)

            # logging
            print(reviewers_name[turn_no%2] + ':\n', file=f)
            print(justification + '\n', file=f)

            preference_reviewer = result_extraction(justification)
            print('turn:', turn_no + 1,
                  'role:', reviewers_name[turn_no%2],
                  'preference:', preference_reviewer)

        # logging
        print('--------', file=f)

        # add discussion history to d
        d[f'{discussion_name}'] = history_formatting(reviewer1_history, reviewers_name)

    f.close()

    # save to files
    with open(path, 'w') as f:
        json.dump(all_data, f, indent=2)

if __name__ == '__main__':
    # discuss in both orders
    reviewers = [1, 2]
    run(reviewers)
    reviewers = [2, 1]
    run(reviewers)

