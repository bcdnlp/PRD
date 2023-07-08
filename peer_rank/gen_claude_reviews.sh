#!/bin/bash

python eval_claude_review.py \
    -q ../data/vicuna80/prompts/vicuna_questions.jsonl \
    -p ../data/vicuna80/prompts/vicuna_prompt_threeclass.jsonl \
    -r ../data/vicuna80/prompts/reviewer.jsonl \
    -o ../data/vicuna80/ratings-claude \
    -m 'claude-1' \
    -a $1 $2

python eval_claude_review.py \
    -q ../data/vicuna80/prompts/vicuna_questions.jsonl \
    -p ../data/vicuna80/prompts/vicuna_prompt_threeclass.jsonl \
    -r ../data/vicuna80/prompts/reviewer.jsonl \
    -o ../data/vicuna80/ratings-claude \
    -m 'claude-1' \
    -a $2 $1

