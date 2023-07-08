#!/bin/bash

# three score_to_threeclass class based review
# ======================================== bard vs claude ========================================
python eval_vicuna_review.py \
    --model-id vicuna-13b \
    --model-path ~/hf_vicuna/13B \
    -q ../data/vicuna80/prompts/vicuna_questions.jsonl \
    -a ../data/vicuna80/generations/answer_bard.jsonl ../data/vicuna80/generations/answer_claude.jsonl \
    -p ../data/vicuna80/prompts/vicuna_prompt_score_to_three.jsonl \
    -r ../data/vicuna80/prompts/reviewer.jsonl \
    -o ../data/vicuna80/ratings-vicuna-13b \
    --num-gpus 2

python eval_vicuna_review.py \
    --model-id vicuna-13b \
    --model-path ~/hf_vicuna/13B \
    -q ../data/vicuna80/prompts/vicuna_questions.jsonl \
    -a ../data/vicuna80/generations/answer_claude.jsonl ../data/vicuna80/generations/answer_bard.jsonl \
    -p ../data/vicuna80/prompts/vicuna_prompt_score_to_three.jsonl \
    -r ../data/vicuna80/prompts/reviewer.jsonl \
    -o ../data/vicuna80/ratings-vicuna-13b \
    --num-gpus 2

# ======================================== bard vs gpt4 ========================================
python eval_vicuna_review.py \
    --model-id vicuna-13b \
    --model-path ~/hf_vicuna/13B \
    -q ../data/vicuna80/prompts/vicuna_questions.jsonl \
    -a ../data/vicuna80/generations/answer_bard.jsonl ../data/vicuna80/generations/answer_gpt4.jsonl \
    -p ../data/vicuna80/prompts/vicuna_prompt_score_to_three.jsonl \
    -r ../data/vicuna80/prompts/reviewer.jsonl \
    -o ../data/vicuna80/ratings-vicuna-13b \
    --num-gpus 2

python eval_vicuna_review.py \
    --model-id vicuna-13b \
    --model-path ~/hf_vicuna/13B \
    -q ../data/vicuna80/prompts/vicuna_questions.jsonl \
    -a ../data/vicuna80/generations/answer_gpt4.jsonl ../data/vicuna80/generations/answer_bard.jsonl \
    -p ../data/vicuna80/prompts/vicuna_prompt_score_to_three.jsonl \
    -r ../data/vicuna80/prompts/reviewer.jsonl \
    -o ../data/vicuna80/ratings-vicuna-13b \
    --num-gpus 2

# ======================================== bard vs gpt35 ========================================
python eval_vicuna_review.py \
    --model-id vicuna-13b \
    --model-path ~/hf_vicuna/13B \
    -q ../data/vicuna80/prompts/vicuna_questions.jsonl \
    -a ../data/vicuna80/generations/answer_bard.jsonl ../data/vicuna80/generations/answer_gpt35.jsonl \
    -p ../data/vicuna80/prompts/vicuna_prompt_score_to_three.jsonl \
    -r ../data/vicuna80/prompts/reviewer.jsonl \
    -o ../data/vicuna80/ratings-vicuna-13b \
    --num-gpus 2

python eval_vicuna_review.py \
    --model-id vicuna-13b \
    --model-path ~/hf_vicuna/13B \
    -q ../data/vicuna80/prompts/vicuna_questions.jsonl \
    -a ../data/vicuna80/generations/answer_gpt35.jsonl ../data/vicuna80/generations/answer_bard.jsonl \
    -p ../data/vicuna80/prompts/vicuna_prompt_score_to_three.jsonl \
    -r ../data/vicuna80/prompts/reviewer.jsonl \
    -o ../data/vicuna80/ratings-vicuna-13b \
    --num-gpus 2

# ======================================== bard vs vicuna-13b ========================================
python eval_vicuna_review.py \
    --model-id vicuna-13b \
    --model-path ~/hf_vicuna/13B \
    -q ../data/vicuna80/prompts/vicuna_questions.jsonl \
    -a ../data/vicuna80/generations/answer_bard.jsonl ../data/vicuna80/generations/answer_vicuna-13b.jsonl \
    -p ../data/vicuna80/prompts/vicuna_prompt_score_to_three.jsonl \
    -r ../data/vicuna80/prompts/reviewer.jsonl \
    -o ../data/vicuna80/ratings-vicuna-13b \
    --num-gpus 2

python eval_vicuna_review.py \
    --model-id vicuna-13b \
    --model-path ~/hf_vicuna/13B \
    -q ../data/vicuna80/prompts/vicuna_questions.jsonl \
    -a ../data/vicuna80/generations/answer_vicuna-13b.jsonl ../data/vicuna80/generations/answer_bard.jsonl \
    -p ../data/vicuna80/prompts/vicuna_prompt_score_to_three.jsonl \
    -r ../data/vicuna80/prompts/reviewer.jsonl \
    -o ../data/vicuna80/ratings-vicuna-13b \
    --num-gpus 2

# ======================================== claude vs gpt4 ========================================
python eval_vicuna_review.py \
    --model-id vicuna-13b \
    --model-path ~/hf_vicuna/13B \
    -q ../data/vicuna80/prompts/vicuna_questions.jsonl \
    -a ../data/vicuna80/generations/answer_claude.jsonl ../data/vicuna80/generations/answer_gpt4.jsonl \
    -p ../data/vicuna80/prompts/vicuna_prompt_score_to_three.jsonl \
    -r ../data/vicuna80/prompts/reviewer.jsonl \
    -o ../data/vicuna80/ratings-vicuna-13b \
    --num-gpus 2

python eval_vicuna_review.py \
    --model-id vicuna-13b \
    --model-path ~/hf_vicuna/13B \
    -q ../data/vicuna80/prompts/vicuna_questions.jsonl \
    -a ../data/vicuna80/generations/answer_gpt4.jsonl ../data/vicuna80/generations/answer_claude.jsonl \
    -p ../data/vicuna80/prompts/vicuna_prompt_score_to_three.jsonl \
    -r ../data/vicuna80/prompts/reviewer.jsonl \
    -o ../data/vicuna80/ratings-vicuna-13b \
    --num-gpus 2

# ======================================== claude vs gpt35 ========================================
python eval_vicuna_review.py \
    --model-id vicuna-13b \
    --model-path ~/hf_vicuna/13B \
    -q ../data/vicuna80/prompts/vicuna_questions.jsonl \
    -a ../data/vicuna80/generations/answer_claude.jsonl ../data/vicuna80/generations/answer_gpt35.jsonl \
    -p ../data/vicuna80/prompts/vicuna_prompt_score_to_three.jsonl \
    -r ../data/vicuna80/prompts/reviewer.jsonl \
    -o ../data/vicuna80/ratings-vicuna-13b \
    --num-gpus 2

python eval_vicuna_review.py \
    --model-id vicuna-13b \
    --model-path ~/hf_vicuna/13B \
    -q ../data/vicuna80/prompts/vicuna_questions.jsonl \
    -a ../data/vicuna80/generations/answer_gpt35.jsonl ../data/vicuna80/generations/answer_claude.jsonl \
    -p ../data/vicuna80/prompts/vicuna_prompt_score_to_three.jsonl \
    -r ../data/vicuna80/prompts/reviewer.jsonl \
    -o ../data/vicuna80/ratings-vicuna-13b \
    --num-gpus 2

# ======================================== claude vs vicuna-13b ========================================
python eval_vicuna_review.py \
    --model-id vicuna-13b \
    --model-path ~/hf_vicuna/13B \
    -q ../data/vicuna80/prompts/vicuna_questions.jsonl \
    -a ../data/vicuna80/generations/answer_claude.jsonl ../data/vicuna80/generations/answer_vicuna-13b.jsonl \
    -p ../data/vicuna80/prompts/vicuna_prompt_score_to_three.jsonl \
    -r ../data/vicuna80/prompts/reviewer.jsonl \
    -o ../data/vicuna80/ratings-vicuna-13b \
    --num-gpus 2

python eval_vicuna_review.py \
    --model-id vicuna-13b \
    --model-path ~/hf_vicuna/13B \
    -q ../data/vicuna80/prompts/vicuna_questions.jsonl \
    -a ../data/vicuna80/generations/answer_vicuna-13b.jsonl ../data/vicuna80/generations/answer_claude.jsonl \
    -p ../data/vicuna80/prompts/vicuna_prompt_score_to_three.jsonl \
    -r ../data/vicuna80/prompts/reviewer.jsonl \
    -o ../data/vicuna80/ratings-vicuna-13b \
    --num-gpus 2

# ======================================== gpt4 vs gpt35 ========================================
python eval_vicuna_review.py \
    --model-id vicuna-13b \
    --model-path ~/hf_vicuna/13B \
    -q ../data/vicuna80/prompts/vicuna_questions.jsonl \
    -a ../data/vicuna80/generations/answer_gpt4.jsonl ../data/vicuna80/generations/answer_gpt35.jsonl \
    -p ../data/vicuna80/prompts/vicuna_prompt_score_to_three.jsonl \
    -r ../data/vicuna80/prompts/reviewer.jsonl \
    -o ../data/vicuna80/ratings-vicuna-13b \
    --num-gpus 2

python eval_vicuna_review.py \
    --model-id vicuna-13b \
    --model-path ~/hf_vicuna/13B \
    -q ../data/vicuna80/prompts/vicuna_questions.jsonl \
    -a ../data/vicuna80/generations/answer_gpt35.jsonl ../data/vicuna80/generations/answer_gpt4.jsonl \
    -p ../data/vicuna80/prompts/vicuna_prompt_score_to_three.jsonl \
    -r ../data/vicuna80/prompts/reviewer.jsonl \
    -o ../data/vicuna80/ratings-vicuna-13b \
    --num-gpus 2

# ======================================== gpt4 vs vicuna-13b ========================================
python eval_vicuna_review.py \
    --model-id vicuna-13b \
    --model-path ~/hf_vicuna/13B \
    -q ../data/vicuna80/prompts/vicuna_questions.jsonl \
    -a ../data/vicuna80/generations/answer_gpt4.jsonl ../data/vicuna80/generations/answer_vicuna-13b.jsonl \
    -p ../data/vicuna80/prompts/vicuna_prompt_score_to_three.jsonl \
    -r ../data/vicuna80/prompts/reviewer.jsonl \
    -o ../data/vicuna80/ratings-vicuna-13b \
    --num-gpus 2

python eval_vicuna_review.py \
    --model-id vicuna-13b \
    --model-path ~/hf_vicuna/13B \
    -q ../data/vicuna80/prompts/vicuna_questions.jsonl \
    -a ../data/vicuna80/generations/answer_vicuna-13b.jsonl ../data/vicuna80/generations/answer_gpt4.jsonl \
    -p ../data/vicuna80/prompts/vicuna_prompt_score_to_three.jsonl \
    -r ../data/vicuna80/prompts/reviewer.jsonl \
    -o ../data/vicuna80/ratings-vicuna-13b \
    --num-gpus 2

# ======================================== gpt35 vs vicuna-13b ========================================
python eval_vicuna_review.py \
    --model-id vicuna-13b \
    --model-path ~/hf_vicuna/13B \
    -q ../data/vicuna80/prompts/vicuna_questions.jsonl \
    -a ../data/vicuna80/generations/answer_gpt35.jsonl ../data/vicuna80/generations/answer_vicuna-13b.jsonl \
    -p ../data/vicuna80/prompts/vicuna_prompt_score_to_three.jsonl \
    -r ../data/vicuna80/prompts/reviewer.jsonl \
    -o ../data/vicuna80/ratings-vicuna-13b \
    --num-gpus 2

python eval_vicuna_review.py \
    --model-id vicuna-13b \
    --model-path ~/hf_vicuna/13B \
    -q ../data/vicuna80/prompts/vicuna_questions.jsonl \
    -a ../data/vicuna80/generations/answer_vicuna-13b.jsonl ../data/vicuna80/generations/answer_gpt35.jsonl \
    -p ../data/vicuna80/prompts/vicuna_prompt_score_to_three.jsonl \
    -r ../data/vicuna80/prompts/reviewer.jsonl \
    -o ../data/vicuna80/ratings-vicuna-13b \
    --num-gpus 2

