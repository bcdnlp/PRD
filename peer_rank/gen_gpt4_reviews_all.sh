#!/bin/bash
# how to run this script 

# ./gen_gpt4_reviews.sh ../data/vicuna80/generations/answer_[Model 1].jsonl ../data/vicuna80/generations/answer_[Model 2].jsonl

echo "======================================== bard vs claude ========================================"
python eval_gpt_review.py \
    -q ../data/vicuna80/prompts/vicuna_questions.jsonl \
    -p ../data/vicuna80/prompts/vicuna_prompt_threeclass.jsonl \
    -r ../data/vicuna80/prompts/reviewer.jsonl \
    -o ../data/vicuna80/ratings-gpt3.5 \
    -m 'gpt-4-0613' \
    -a ../data/vicuna80/generations/answer_claude.jsonl ../data/vicuna80/generations/answer_bard.jsonl

python eval_gpt_review.py \
    -q ../data/vicuna80/prompts/vicuna_questions.jsonl \
    -p ../data/vicuna80/prompts/vicuna_prompt_threeclass.jsonl \
    -r ../data/vicuna80/prompts/reviewer.jsonl \
    -o ../data/vicuna80/ratings-gpt3.5 \
    -m 'gpt-4-0613' \
    -a ../data/vicuna80/generations/answer_bard.jsonl ../data/vicuna80/generations/answer_claude.jsonl

echo "======================================== bard vs gpt4 ========================================"
python eval_gpt_review.py \
    -q ../data/vicuna80/prompts/vicuna_questions.jsonl \
    -p ../data/vicuna80/prompts/vicuna_prompt_threeclass.jsonl \
    -r ../data/vicuna80/prompts/reviewer.jsonl \
    -o ../data/vicuna80/ratings-gpt3.5 \
    -m 'gpt-4-0613' \
    -a ../data/vicuna80/generations/answer_bard.jsonl ../data/vicuna80/generations/answer_gpt4.jsonl

python eval_gpt_review.py \
    -q ../data/vicuna80/prompts/vicuna_questions.jsonl \
    -p ../data/vicuna80/prompts/vicuna_prompt_threeclass.jsonl \
    -r ../data/vicuna80/prompts/reviewer.jsonl \
    -o ../data/vicuna80/ratings-gpt3.5 \
    -m 'gpt-4-0613' \
    -a ../data/vicuna80/generations/answer_gpt4.jsonl ../data/vicuna80/generations/answer_bard.jsonl

echo "======================================== bard vs gpt35 ========================================"
python eval_gpt_review.py \
    -q ../data/vicuna80/prompts/vicuna_questions.jsonl \
    -p ../data/vicuna80/prompts/vicuna_prompt_threeclass.jsonl \
    -r ../data/vicuna80/prompts/reviewer.jsonl \
    -o ../data/vicuna80/ratings-gpt3.5 \
    -m 'gpt-4-0613' \
    -a ../data/vicuna80/generations/answer_bard.jsonl ../data/vicuna80/generations/answer_gpt35.jsonl

python eval_gpt_review.py \
    -q ../data/vicuna80/prompts/vicuna_questions.jsonl \
    -p ../data/vicuna80/prompts/vicuna_prompt_threeclass.jsonl \
    -r ../data/vicuna80/prompts/reviewer.jsonl \
    -o ../data/vicuna80/ratings-gpt3.5 \
    -m 'gpt-4-0613' \
    -a ../data/vicuna80/generations/answer_gpt35.jsonl ../data/vicuna80/generations/answer_bard.jsonl

echo "======================================== bard vs vicuna-13b ========================================"

python eval_gpt_review.py \
    -q ../data/vicuna80/prompts/vicuna_questions.jsonl \
    -p ../data/vicuna80/prompts/vicuna_prompt_threeclass.jsonl \
    -r ../data/vicuna80/prompts/reviewer.jsonl \
    -o ../data/vicuna80/ratings-gpt3.5 \
    -m 'gpt-4-0613' \
    -a ../data/vicuna80/generations/answer_bard.jsonl ../data/vicuna80/generations/answer_vicuna-13b.jsonl

python eval_gpt_review.py \
    -q ../data/vicuna80/prompts/vicuna_questions.jsonl \
    -p ../data/vicuna80/prompts/vicuna_prompt_threeclass.jsonl \
    -r ../data/vicuna80/prompts/reviewer.jsonl \
    -o ../data/vicuna80/ratings-gpt3.5 \
    -m 'gpt-4-0613' \
    -a ../data/vicuna80/generations/answer_vicuna-13b.jsonl ../data/vicuna80/generations/answer_bard.jsonl

echo "======================================== claude vs gpt4 ========================================"
python eval_gpt_review.py \
    -q ../data/vicuna80/prompts/vicuna_questions.jsonl \
    -p ../data/vicuna80/prompts/vicuna_prompt_threeclass.jsonl \
    -r ../data/vicuna80/prompts/reviewer.jsonl \
    -o ../data/vicuna80/ratings-gpt3.5 \
    -m 'gpt-4-0613' \
    -a ../data/vicuna80/generations/answer_claude.jsonl ../data/vicuna80/generations/answer_gpt4.jsonl

python eval_gpt_review.py \
    -q ../data/vicuna80/prompts/vicuna_questions.jsonl \
    -p ../data/vicuna80/prompts/vicuna_prompt_threeclass.jsonl \
    -r ../data/vicuna80/prompts/reviewer.jsonl \
    -o ../data/vicuna80/ratings-gpt3.5 \
    -m 'gpt-4-0613' \
    -a ../data/vicuna80/generations/answer_gpt4.jsonl ../data/vicuna80/generations/answer_claude.jsonl

echo "======================================== claude vs gpt35 ========================================"
python eval_gpt_review.py \
    -q ../data/vicuna80/prompts/vicuna_questions.jsonl \
    -p ../data/vicuna80/prompts/vicuna_prompt_threeclass.jsonl \
    -r ../data/vicuna80/prompts/reviewer.jsonl \
    -o ../data/vicuna80/ratings-gpt3.5 \
    -m 'gpt-4-0613' \
    -a ../data/vicuna80/generations/answer_claude.jsonl ../data/vicuna80/generations/answer_gpt35.jsonl

python eval_gpt_review.py \
    -q ../data/vicuna80/prompts/vicuna_questions.jsonl \
    -p ../data/vicuna80/prompts/vicuna_prompt_threeclass.jsonl \
    -r ../data/vicuna80/prompts/reviewer.jsonl \
    -o ../data/vicuna80/ratings-gpt3.5 \
    -m 'gpt-4-0613' \
    -a ../data/vicuna80/generations/answer_gpt35.jsonl ../data/vicuna80/generations/answer_claude.jsonl

echo "======================================== claude vs vicuna-13b ========================================"
python eval_gpt_review.py \
    -q ../data/vicuna80/prompts/vicuna_questions.jsonl \
    -p ../data/vicuna80/prompts/vicuna_prompt_threeclass.jsonl \
    -r ../data/vicuna80/prompts/reviewer.jsonl \
    -o ../data/vicuna80/ratings-gpt3.5 \
    -m 'gpt-4-0613' \
    -a ../data/vicuna80/generations/answer_claude.jsonl ../data/vicuna80/generations/answer_vicuna-13b.jsonl

python eval_gpt_review.py \
    -q ../data/vicuna80/prompts/vicuna_questions.jsonl \
    -p ../data/vicuna80/prompts/vicuna_prompt_threeclass.jsonl \
    -r ../data/vicuna80/prompts/reviewer.jsonl \
    -o ../data/vicuna80/ratings-gpt3.5 \
    -m 'gpt-4-0613' \
    -a ../data/vicuna80/generations/answer_vicuna-13b.jsonl ../data/vicuna80/generations/answer_claude.jsonl

echo "======================================== gpt4 vs gpt35 ========================================"
python eval_gpt_review.py \
    -q ../data/vicuna80/prompts/vicuna_questions.jsonl \
    -p ../data/vicuna80/prompts/vicuna_prompt_threeclass.jsonl \
    -r ../data/vicuna80/prompts/reviewer.jsonl \
    -o ../data/vicuna80/ratings-gpt3.5 \
    -m 'gpt-4-0613' \
    -a ../data/vicuna80/generations/answer_gpt4.jsonl ../data/vicuna80/generations/answer_gpt35.jsonl

python eval_gpt_review.py \
    -q ../data/vicuna80/prompts/vicuna_questions.jsonl \
    -p ../data/vicuna80/prompts/vicuna_prompt_threeclass.jsonl \
    -r ../data/vicuna80/prompts/reviewer.jsonl \
    -o ../data/vicuna80/ratings-gpt3.5 \
    -m 'gpt-4-0613' \
    -a ../data/vicuna80/generations/answer_gpt35.jsonl ../data/vicuna80/generations/answer_gpt4.jsonl

echo "======================================== gpt4 vs vicuna-13b ========================================"
python eval_gpt_review.py \
    -q ../data/vicuna80/prompts/vicuna_questions.jsonl \
    -p ../data/vicuna80/prompts/vicuna_prompt_threeclass.jsonl \
    -r ../data/vicuna80/prompts/reviewer.jsonl \
    -o ../data/vicuna80/ratings-gpt3.5 \
    -m 'gpt-4-0613' \
    -a ../data/vicuna80/generations/answer_gpt4.jsonl ../data/vicuna80/generations/answer_vicuna-13b.jsonl

python eval_gpt_review.py \
    -q ../data/vicuna80/prompts/vicuna_questions.jsonl \
    -p ../data/vicuna80/prompts/vicuna_prompt_threeclass.jsonl \
    -r ../data/vicuna80/prompts/reviewer.jsonl \
    -o ../data/vicuna80/ratings-gpt3.5 \
    -m 'gpt-4-0613' \
    -a ../data/vicuna80/generations/answer_vicuna-13b.jsonl ../data/vicuna80/generations/answer_gpt4.jsonl

echo "======================================== gpt35 vs vicuna-13b ========================================"
python eval_gpt_review.py \
    -q ../data/vicuna80/prompts/vicuna_questions.jsonl \
    -p ../data/vicuna80/prompts/vicuna_prompt_threeclass.jsonl \
    -r ../data/vicuna80/prompts/reviewer.jsonl \
    -o ../data/vicuna80/ratings-gpt4 \
    -m 'gpt-4-0613' \
    -a ../data/vicuna80/generations/answer_gpt35.jsonl ../data/vicuna80/generations/answer_vicuna-13b.jsonl

python eval_gpt_review.py \
    -q ../data/vicuna80/prompts/vicuna_questions.jsonl \
    -p ../data/vicuna80/prompts/vicuna_prompt_threeclass.jsonl \
    -r ../data/vicuna80/prompts/reviewer.jsonl \
    -o ../data/vicuna80/ratings-gpt3.5 \
    -m 'gpt-4-0613' \
    -a ../data/vicuna80/generations/answer_vicuna-13b.jsonl ../data/vicuna80/generations/answer_gpt35.jsonl

