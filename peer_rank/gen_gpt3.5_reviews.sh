#!/bin/bash
# how to run this script 

# ./gen_gpt3.5_reviews.sh ../data/vicuna80/generations/answer_[Model 1].jsonl ../data/vicuna80/generations/answer_[Model 2].jsonl
# gpt35 vs {gpt4, claude, bard, vicuna}

python eval_gpt_review.py \
    -q ../data/vicuna80/prompts/vicuna_questions.jsonl \
    -p ../data/vicuna80/prompts/vicuna_prompt_threeclass.jsonl \
    -r ../data/vicuna80/prompts/reviewer.jsonl \
    -o ../data/vicuna80/ratings-gpt35/pairwise_no_fix \
    -m 'gpt-3.5-turbo-0301' \
    -a $1 $2

python eval_gpt_review.py \
    -q ../data/vicuna80/prompts/vicuna_questions.jsonl \
    -p ../data/vicuna80/prompts/vicuna_prompt_threeclass.jsonl \
    -r ../data/vicuna80/prompts/reviewer.jsonl \
    -o ../data/vicuna80/ratings-gpt35/pairwise_no_fix \
    -m 'gpt-3.5-turbo-0301' \
    -a $2 $1

