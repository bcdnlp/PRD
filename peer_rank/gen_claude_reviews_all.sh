#!/bin/bash

python eval_claude_review.py \
    -q ../data/vicuna80/prompts/vicuna_questions.jsonl \
    -p ../data/vicuna80/prompts/vicuna_prompt_threeclass.jsonl \
    -r ../data/vicuna80/prompts/reviewer.jsonl \
    -o ../data/vicuna80/ratings-claude \
    -m "claude-1" \
    -a ../data/vicuna80/generations/answer_bard.jsonl ../data/vicuna80/generations/answer_gpt4.jsonl

python eval_claude_review.py \
    -q ../data/vicuna80/prompts/vicuna_questions.jsonl \
    -p ../data/vicuna80/prompts/vicuna_prompt_threeclass.jsonl \
    -r ../data/vicuna80/prompts/reviewer.jsonl \
    -o ../data/vicuna80/ratings-claude \
    -m "claude-1" \
    -a ../data/vicuna80/generations/answer_gpt4.jsonl ../data/vicuna80/generations/answer_bard.jsonl

python eval_claude_review.py \
    -q ../data/vicuna80/prompts/vicuna_questions.jsonl \
    -p ../data/vicuna80/prompts/vicuna_prompt_threeclass.jsonl \
    -r ../data/vicuna80/prompts/reviewer.jsonl \
    -o ../data/vicuna80/ratings-claude \
    -m "claude-1" \
    -a ../data/vicuna80/generations/answer_bard.jsonl ../data/vicuna80/generations/answer_vicuna-13b.jsonl

python eval_claude_review.py \
    -q ../data/vicuna80/prompts/vicuna_questions.jsonl \
    -p ../data/vicuna80/prompts/vicuna_prompt_threeclass.jsonl \
    -r ../data/vicuna80/prompts/reviewer.jsonl \
    -o ../data/vicuna80/ratings-claude \
    -m "claude-1" \
    -a ../data/vicuna80/generations/answer_vicuna-13b.jsonl ../data/vicuna80/generations/answer_bard.jsonl

python eval_claude_review.py \
    -q ../data/vicuna80/prompts/vicuna_questions.jsonl \
    -p ../data/vicuna80/prompts/vicuna_prompt_threeclass.jsonl \
    -r ../data/vicuna80/prompts/reviewer.jsonl \
    -o ../data/vicuna80/ratings-claude \
    -m "claude-1" \
    -a ../data/vicuna80/generations/answer_claude.jsonl ../data/vicuna80/generations/answer_gpt35.jsonl

python eval_claude_review.py \
    -q ../data/vicuna80/prompts/vicuna_questions.jsonl \
    -p ../data/vicuna80/prompts/vicuna_prompt_threeclass.jsonl \
    -r ../data/vicuna80/prompts/reviewer.jsonl \
    -o ../data/vicuna80/ratings-claude \
    -m "claude-1" \
    -a ../data/vicuna80/generations/answer_gpt35.jsonl ../data/vicuna80/generations/answer_claude.jsonl

python eval_claude_review.py \
    -q ../data/vicuna80/prompts/vicuna_questions.jsonl \
    -p ../data/vicuna80/prompts/vicuna_prompt_threeclass.jsonl \
    -r ../data/vicuna80/prompts/reviewer.jsonl \
    -o ../data/vicuna80/ratings-claude \
    -m "claude-1" \
    -a ../data/vicuna80/generations/answer_claude.jsonl ../data/vicuna80/generations/answer_gpt4.jsonl

python eval_claude_review.py \
    -q ../data/vicuna80/prompts/vicuna_questions.jsonl \
    -p ../data/vicuna80/prompts/vicuna_prompt_threeclass.jsonl \
    -r ../data/vicuna80/prompts/reviewer.jsonl \
    -o ../data/vicuna80/ratings-claude \
    -m "claude-1" \
    -a ../data/vicuna80/generations/answer_gpt4.jsonl ../data/vicuna80/generations/answer_claude.jsonl

python eval_claude_review.py \
    -q ../data/vicuna80/prompts/vicuna_questions.jsonl \
    -p ../data/vicuna80/prompts/vicuna_prompt_threeclass.jsonl \
    -r ../data/vicuna80/prompts/reviewer.jsonl \
    -o ../data/vicuna80/ratings-claude \
    -m "claude-1" \
    -a ../data/vicuna80/generations/answer_claude.jsonl ../data/vicuna80/generations/answer_vicuna-13b.jsonl

python eval_claude_review.py \
    -q ../data/vicuna80/prompts/vicuna_questions.jsonl \
    -p ../data/vicuna80/prompts/vicuna_prompt_threeclass.jsonl \
    -r ../data/vicuna80/prompts/reviewer.jsonl \
    -o ../data/vicuna80/ratings-claude \
    -m "claude-1" \
    -a ../data/vicuna80/generations/answer_vicuna-13b.jsonl ../data/vicuna80/generations/answer_claude.jsonl

python eval_claude_review.py \
    -q ../data/vicuna80/prompts/vicuna_questions.jsonl \
    -p ../data/vicuna80/prompts/vicuna_prompt_threeclass.jsonl \
    -r ../data/vicuna80/prompts/reviewer.jsonl \
    -o ../data/vicuna80/ratings-claude \
    -m "claude-1" \
    -a ../data/vicuna80/generations/answer_gpt35.jsonl ../data/vicuna80/generations/answer_gpt4.jsonl

python eval_claude_review.py \
    -q ../data/vicuna80/prompts/vicuna_questions.jsonl \
    -p ../data/vicuna80/prompts/vicuna_prompt_threeclass.jsonl \
    -r ../data/vicuna80/prompts/reviewer.jsonl \
    -o ../data/vicuna80/ratings-claude \
    -m "claude-1" \
    -a ../data/vicuna80/generations/answer_gpt4.jsonl ../data/vicuna80/generations/answer_gpt35.jsonl

python eval_claude_review.py \
    -q ../data/vicuna80/prompts/vicuna_questions.jsonl \
    -p ../data/vicuna80/prompts/vicuna_prompt_threeclass.jsonl \
    -r ../data/vicuna80/prompts/reviewer.jsonl \
    -o ../data/vicuna80/ratings-claude \
    -m "claude-1" \
    -a ../data/vicuna80/generations/answer_gpt35.jsonl ../data/vicuna80/generations/answer_vicuna-13b.jsonl

python eval_claude_review.py \
    -q ../data/vicuna80/prompts/vicuna_questions.jsonl \
    -p ../data/vicuna80/prompts/vicuna_prompt_threeclass.jsonl \
    -r ../data/vicuna80/prompts/reviewer.jsonl \
    -o ../data/vicuna80/ratings-claude \
    -m "claude-1" \
    -a ../data/vicuna80/generations/answer_vicuna-13b.jsonl ../data/vicuna80/generations/answer_gpt35.jsonl

python eval_claude_review.py \
    -q ../data/vicuna80/prompts/vicuna_questions.jsonl \
    -p ../data/vicuna80/prompts/vicuna_prompt_threeclass.jsonl \
    -r ../data/vicuna80/prompts/reviewer.jsonl \
    -o ../data/vicuna80/ratings-claude \
    -m "claude-1" \
    -a ../data/vicuna80/generations/answer_gpt4.jsonl ../data/vicuna80/generations/answer_vicuna-13b.jsonl

python eval_claude_review.py \
    -q ../data/vicuna80/prompts/vicuna_questions.jsonl \
    -p ../data/vicuna80/prompts/vicuna_prompt_threeclass.jsonl \
    -r ../data/vicuna80/prompts/reviewer.jsonl \
    -o ../data/vicuna80/ratings-claude \
    -m "claude-1" \
    -a ../data/vicuna80/generations/answer_vicuna-13b.jsonl ../data/vicuna80/generations/answer_gpt4.jsonl

