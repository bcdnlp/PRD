#!/bin/bash

GEN_PATH=../data/vicuna80/generations

python ./generate_mturk_input.py \
    -q ../data/vicuna80/prompts/vicuna_questions.jsonl \
    -a \
       $GEN_PATH/answer_claude.jsonl \
       $GEN_PATH/answer_bard.jsonl \
       $GEN_PATH/answer_gpt4.jsonl \
       $GEN_PATH/answer_gpt35.jsonl \
       $GEN_PATH/answer_vicuna-13b.jsonl \
    -o ./mturk_inputs/mturk_input.csv \
    -m 'helpfulness' 'relevance' 'accuracy' 'level of detail'\

