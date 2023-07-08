import glob
import json
import os
import re
import shutil

file_list = glob.glob('*.jsonl')

for file_name in file_list:
    print(file_name)
    with open(file_name, 'r') as f:
        data = [json.loads(line) for line in f.readlines()]

    for d in data:
        if -1 == d['score']:
            try:
                # last line is a number
                score = d['text'].strip().split('\n')[-1].strip()
                if score in ['1', '2', '3']:
                    d['score'] = int(score)
                    continue
    
                # I (would )choose (answer )1/2/3
                extract = re.search('I (would )?choose (answer |assistant |option )?(\d)', score, re.IGNORECASE)
                if extract is not None:
                    d['score'] = int(extract.group(3))
                    continue

                # my choice is 1/2/3
                extract = re.search('my choice is(:)? (\d)', score, re.IGNORECASE)
                if extract is not None:
                    d['score'] = int(extract.group(2))
                    continue

                # Output/choice/answer: 1/2/3
                extract = re.search('(Output|Choice|Answer): (\d)', score, re.IGNORECASE)
                if extract is not None:
                    d['score'] = int(extract.group(2))
                    continue

                # output (is): 1/2/3
                extract = re.search('output (is)?: (\d)', score, re.IGNORECASE)
                if extract is not None:
                    d['score'] = int(extract.group(2))
                    continue

                # answer is: 1/2/3
                extract = re.search('answer is(:)? (\d)', score, re.IGNORECASE)
                if extract is not None:
                    d['score'] = int(extract.group(2))
                    continue

                raise Error

            except:
                print(json.dumps(d, indent=2))
                d['score'] = int(input('score:'))

    with open(os.path.join('../', file_name), 'w') as f:
        for d in data:
            f.write(json.dumps(d) + '\n')

    shutil.move(file_name, 'done/'+file_name)
    input('press Enter to continue')

