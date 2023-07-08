#!/bin/bash
# how to run this script 

# ./gen_gpt4_reviews.sh ../data/vicuna80/generations/answer_claude.jsonl ../data/vicuna80/generations/answer_gpt4.jsonl
# claude vs {gpt4, gpt35, bard, vicuna-13b} 

python eval_bard_review.py \
    -q ../data/vicuna80/prompts/vicuna_questions.jsonl \
    -p ../data/vicuna80/prompts/vicuna_prompt_threeclass.jsonl \
    -r ../data/vicuna80/prompts/reviewer.jsonl \
    -o ../data/vicuna80/ratings-bard/pairwise_no_fix \
    -a $1 $2

python eval_bard_review.py \
    -q ../data/vicuna80/prompts/vicuna_questions.jsonl \
    -p ../data/vicuna80/prompts/vicuna_prompt_threeclass.jsonl \
    -r ../data/vicuna80/prompts/reviewer.jsonl \
    -o ../data/vicuna80/ratings-bard/pairwise_no_fix \
    -a $2 $1

