import yaml

with open('peer_discussion/config.yml') as f:
    config = yaml.safe_load(f)

def prompt_review_generation_lfqa(question, answer_1, answer_2):
    instruction = {'explicit': "Firstly, please compare the two answers based on if they contain unsupported infomation, core information, and coherence. Please provide a comprehensive explanation of your evaluation, avoiding any potential bias and ensuring that the order in which the responses were presented does not affect your judgment.\n",
                   'implicit': "Firstly, please compare two answers and provide a comprehensive explanation of your evaluation, avoiding any potential bias and ensuring that the order in which the responses were presented does not affect your judgment.\n"}

    sys_prompt = "You are a helpful and precise assistant for checking the quality of the answer.\n"
    prompt = ("[Question]\n"
              f"{question}\n\n"
              "[The Start of Answer 1]\n"
              f"{answer_1}\n\n"
              "[The End of Answer 1]\n\n"
              "[The Start of Answer 2]\n"
              f"{answer_2}\n\n"
              "[The End of Answer 2]\n\n"
              "[System]\n"
              "We would like to request your feedback on the performance of two answers in response to the user question displayed above.\n"
              f"{instruction[config['mode']]}"
              "Once you have carefully reviewed both submissions, in a new line, choose between the two answers by outputting the number 1 or 2 respectively. Do not output anything else other than the number in this last line."
              )

    return sys_prompt, prompt

def prompt_discuss_generation_lfqa(reviewers,
                                   question,
                                   answer_1,
                                   answer_2,
                                   justification_1,
                                   justification_2,
                                   ):
    instruction = {'explicit': "Read the reviews and discussions above, and make a decision if to change your preference, and explain. Remember we focus on unsupported information, core information and coherence.\n",
                   'implicit': "Read the reviews and discussions above, and make a decision if to change your preference, and explain.\n"}

    sys_prompt_1 = f"You are reviewer 1, discussing with reviewer 2 about your reviews of the following answers.\n"
    sys_prompt_2 = f"You are reviewer 2, discussing with reviewer 1 about your reviews of the following answers.\n"
    sys_prompts = [sys_prompt_1, sys_prompt_2]

    prompt = ("[Question]\n"
              f"{question}\n\n"
              "[The Start of Answer 1]\n"
              f"{answer_1}\n\n"
              "[The End of Answer 1]\n\n"
              "[The Start of Answer 2]\n"
              f"{answer_2}\n\n"
              "[The End of Answer 2]\n\n"
              "[The Start of Reviewer 1's Evaluation]\n"
              f"{justification_1}\n\n"
              "[The End of Reviewer 1's Evaluation]\n\n"
              "[The Start of Reviewer 2's Evaluation]\n"
              f"{justification_2}\n\n"
              "[The End of Reviewer 2's Evaluation]\n\n"
              "[System]\n"
              f"{instruction[config['mode']]}"
              "In a new line, choose between answer 1 and answer 2 by outputting the number 1 or 2 respectively. Do not output anything else other than the number in this last line."
              )

    # history for reviewer1 and reviewer2
    histories = [[sys_prompt_1, prompt],
                 [''.join([sys_prompt_2, prompt])]]

    return histories

def add_prompt_each_turn_lfqa(text, reviewer_no):
    instruction = {'explicit': "Read the reviews and discussions above, and make a decision if to change your preference, and explain. Remember we focus on unsupported information, core information and coherence\n",
                   'implicit': "Read the reviews and discussions above, and make a decision if to change your preference, and explain.\n"}

    sys_prompt_1 = f"You are reviewer 1, discussing with reviewer 2 about your reviews of the following answers.\n"
    sys_prompt_2 = f"You are reviewer 2, discussing with reviewer 1 about your reviews of the following answers.\n"
    sys_prompts = [sys_prompt_1, sys_prompt_2]
    role_prompt = sys_prompts[reviewer_no] if config['add_role_prompt'] else ''

    prompt = ("[System]\n"
              f"{role_prompt}"
              f"{instruction[config['mode']]}"
              "In a new line, choose between answer 1 and answer 2 by outputting the number 1 or 2 respectively. Do not output anything else other than the number in this last line."
              )

    text = '\n\n'.join([text, prompt])

    return text

def prompt_discuss_generation_vicuna(reviewers,
                                     question,
                                     answer_1,
                                     answer_2,
                                     justification_1,
                                     justification_2,
                                     ):
    sys_prompt_1 = f"You are reviewer 1, discussing with reviewer 2 about your reviews of the answers.\n"
    sys_prompt_2 = f"You are reviewer 2, discussing with reviewer 1 about your reviews of the answers.\n"
    sys_prompts = [sys_prompt_1, sys_prompt_2]

    justification_1 = justification_1.replace('Assistant', 'Answer')
    justification_1 = justification_1.replace('assistant', 'answer')
    justification_1 = justification_1.replace("'s answer", '')
    justification_2 = justification_2.replace('Assistant', 'Answer')
    justification_2 = justification_2.replace('assistant', 'answer')
    justification_2 = justification_2.replace("'s answer", '')

    prompt = ("[Question]\n"
              f"{question}\n\n"
              "[The Start of Answer 1]\n"
              f"{answer_1}\n\n"
              "[The End of Answer 1]\n\n"
              "[The Start of Answer 2]\n"
              f"{answer_2}\n\n"
              "[The End of Answer 2]\n\n"
              "[The Start of Reviewer 1's Evaluation]\n"
              f"{justification_1}\n\n"
              "[The End of Reviewer 1's Evaluation]\n\n"
              "[The Start of Reviewer 2's Evaluation]\n"
              f"{justification_2}\n\n"
              "[The End of Reviewer 2's Evaluation]\n\n"
              "[System]\n"
              "Read the reviews and discussions above, and make a decision if to change your preference, and explain.\n"
              "In a new line, choose between the two answers by outputting the number 1 or 2, or choose 3 if the two answers are equivalent. Do not output anything else other than the number in this last line."
              )

    # history for reviewer1 and reviewer2
    histories = [[sys_prompt_1, prompt],
                 [''.join([sys_prompt_2, prompt])]]

    return histories

def add_prompt_each_turn_vicuna(text, reviewer_no):
    sys_prompt_1 = f"You are reviewer 1, discussing with reviewer 2 about your reviews of the following answers.\n"
    sys_prompt_2 = f"You are reviewer 2, discussing with reviewer 1 about your reviews of the following answers.\n"
    sys_prompts = [sys_prompt_1, sys_prompt_2]
    role_prompt = sys_prompts[reviewer_no] if config['add_role_prompt'] else ''

    prompt = ("[System]\n"
              f"{role_prompt}"
              "Read the reviews and discussions above, and make a decision if to change your preference, and explain.\n"
              "In a new line, choose between the two answers by outputting the number 1 or 2, or choose 3 if the two answers are equivalent. Do not output anything else other than the number in this last line."
              )

    text = '\n\n'.join([text, prompt])

    return text

