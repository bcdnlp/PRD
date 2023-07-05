import time

import openai
import yaml

with open('peer_discussion/config.yml') as f:
    config = yaml.safe_load(f)

def prompt_formatting(history):
    messages = [{'role': 'system', 'content': history[0]}]
    for idx, content in enumerate(history[1:]):
        if 0 == idx % 2:
            messages.append({'role': 'user', 'content': content})
        else:
            messages.append({'role': 'assistant', 'content': content})

    return messages

def call(history, reviewer_no):
    with open(config['openai_org_id'], 'r') as f:
        openai.organization = f.readline().strip()
    
    with open(config['openai_key'], 'r') as f:
        openai.api_key = f.readline().strip()
    
    messages = prompt_formatting(history)
    while True:
        try:
            response = openai.ChatCompletion.create(
                            model=config[f'model_reviewer{reviewer_no}'],
                            messages=messages,
                            temperature=config[f'temperature_reviewer{reviewer_no}'],
                            max_tokens=500,
                            frequency_penalty=0,
                            presence_penalty=0,
                            n=1,
                            )
            break
        except Exception as e:
            time.sleep(2)
            print('Errrrrrrrrrrrrrrrrrr', str(e))
    
    prediction = response['choices'][0]['message']['content']

    return prediction

if __name__ == '__main__':
    pass

