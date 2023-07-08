# Data

## Directory tree

This folder contains two folders `lfqa` and `vicuna80` for LFQA and Vicuna80 respectively. The directory tree for both folders are listed below.

```bash
.
|-- lfqa
|   |-- experts_pairwise_human_preferences.jsonl
|-- vicuna80
    |-- vicuna_benchmark_human_annotations.csv
    |-- clean_battle_20230522.json
    |-- generations
    |   |-- answer_bard.jsonl
    |   |-- answer_claude.jsonl
    |   |-- answer_gpt35.jsonl
    |   |-- answer_gpt4.jsonl
    |   |-- answer_vicuna-13b.jsonl
    |-- prompt
    |   |-- reviewer.jsonl
    |   |-- vicuna_prompt_threeclass.jsonl
    |   |-- vicuna_questions.jsonl
    |-- ratings-{reviewer}
    |   |-- answer_{model1}-vs-answer_{model2}-{reviewer}-reviewer_threeclass.jsonl
```

## LFQA

All data of LFQA is stored in the `experts_pairwise_human_preferences.jsonl` file.

## Vicuna80

We pulish the `Vicuna80` dataset here. For more details, please refer to the paper. Explanations for files in the `Vicuna80` folder are as follows:

1. `vicuna_benchmark_human_annotations.csv`
    - This file stores human preference for all human annotations on all questions.
2. `clean_battle_20230522.json`
    - This file is for Chatbot Arena for comparison.
3. `generations`
    - This folder stores generated answers of all models (Bard, Claude, GPT-3.5, GPT-4, and Vicuna-13b).
4. `prompt`
    - This folder stores reviewers' information, questions, and prompts to generate reviews.
5. `ratings-{reviewer}`
    - `{reviewer}` includes Bard, Claude, GPT-3.5, GPT-4, human, and Vicuna-13b.
    - Both `{model1}` and `{model2}` refer to models in the `generations` folder.
