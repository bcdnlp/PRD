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
                if '' == d['text'].strip():
                    d['score'] = -1
                    continue

                # last line is a number
                score = d['text'].strip().split('\n')[-1].strip()
                if score in ['1', '2', '3']:
                    d['score'] = int(score)
                    continue
    
                # I (would )recommend (Assistant )1/2/3
                extract = re.search('I (would )?(recommend |say |rate |give |choose |chose )(choosing |using |that |selecting )?(answer |assistant |option )?(\d)', score, re.IGNORECASE)
                if extract is not None:
                    d['score'] = int(extract.group(5))
                    continue

                # I (would) choose the answer of Assistant 1/2
                extract = re.search('I (would )?choose the answer of assistant (\d)', score, re.IGNORECASE)
                if extract is not None:
                    d['score'] = int(extract.group(2))
                    continue

                # I recommend that you choose Assistant 1/2
                extract = re.search('I (would )?recommend that (you |users |the user )choose assistant (\d)', score, re.IGNORECASE)
                if extract is not None:
                    d['score'] = int(extract.group(3))
                    continue

                # I would give the edge to Assistant 1/2
                extract = re.search('I would give the edge to Assistant (\d)', score, re.IGNORECASE)
                if extract is not None:
                    d['score'] = int(extract.group(1))
                    continue

                # Assistant 1/2
                extract = re.search('^assistant (\d).$', score, re.IGNORECASE)
                if extract is not None:
                    d['score'] = int(extract.group(1))
                    continue

                # The two assistants are equivalent
                extract = re.search('The two assistants are equivalent', score, re.IGNORECASE)
                if extract is not None:
                    d['score'] = 3
                    continue

                # choose Assistant 1/2 as the better
                extract = re.search("choose Assistant (\d) as the better", score, re.IGNORECASE)
                if extract is not None:
                    d['score'] = int(extract.group(1))
                    continue

                # Assistant 1/2 is a better
                extract = re.search("Assistant (\d) is a better", score, re.IGNORECASE)
                if extract is not None:
                    d['score'] = int(extract.group(1))
                    continue

                # Assistant 1/2's answer is (\w+) better
                extract = re.search("Assistant (\d)'s answer is (the |more )better", score, re.IGNORECASE)
                if extract is not None:
                    d['score'] = int(extract.group(1))
                    continue

                # Assistant 1 answer is the better
                extract = re.search("Assistant (\d) is the better", score, re.IGNORECASE)
                if extract is not None:
                    d['score'] = int(extract.group(1))
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

