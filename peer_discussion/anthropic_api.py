import time

import anthropic
import yaml

with open('config.yml') as f:
    config = yaml.safe_load(f)

def prompt_formatting(history):
    prompt = f"{anthropic.HUMAN_PROMPT} {history[0]}"
    for idx, content in enumerate(history[1:]):
        if 0 == idx % 2:
            message = f"{anthropic.HUMAN_PROMPT}\n{content}"
        else:
            message = f"{anthropic.AI_PROMPT}\n{content}"
        prompt = ''.join([prompt, message])

    prompt = ''.join([prompt, f"{anthropic.AI_PROMPT}"])

    return prompt

def call(history, reviewer_no):
    with open(config['anthropic_key'], 'r') as f:
        api_key = f.read().strip()
    
    client = anthropic.Anthropic(api_key=api_key)

    prompt = prompt_formatting(history)
    while True:
        try:
            response = client.completions.create(
                           prompt=prompt,
                           stop_sequences=[anthropic.HUMAN_PROMPT],
                           max_tokens_to_sample=500,
                           model=config[f'model_reviewer{reviewer_no}'],
                           temperature=config[f'temperature_reviewer{reviewer_no}'],
                           )
            break
        except Exception as e:
            time.sleep(2)
            print('Errrrrrrrrrrrrrrrrrr', str(e))

    prediction = response.completion

    return prediction
    
if __name__ == '__main__':
    pass

