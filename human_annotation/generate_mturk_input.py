import argparse
import json
import csv
import glob
from pathlib import Path
import numpy as np

def get_json_list(file_path):
    file_path = Path(file_path).expanduser()
    with open(file_path, "r") as f:
        return [json.loads(line) for line in f]
    
def get_review_jsons(review_dir, answer_file_list):
    jsons = []
    review_path = Path(review_dir).expanduser()
    for fileA in answer_file_list:
        fileA = Path(fileA).expanduser()
        for fileB in answer_file_list:
            fileB = Path(fileB).expanduser()
            if fileA.name == fileB.name:
                continue
            try:
                review_filepath = glob.glob(str(review_path) + f"/{fileA.stem}-vs-{fileB.stem}-gpt-4-reviewer*.jsonl")[0]
                jsons.append(get_json_list(review_filepath))
            except Exception:
                print("Problem at: ", fileA.stem, fileB.stem)
    return jsons

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Merge Question and Answer files to create Mturk input file.")
    parser.add_argument("-q", "--question-file")
    parser.add_argument("-a", "--answer-file-list", nargs="+", default=[])
    parser.add_argument("-r", "--review-dir", default="../data/vicuna80/ratings-gpt4/")
    parser.add_argument("-m", "--metrics", nargs="*", default=[])
    parser.add_argument("-o", "--output-review-file", default='mturk_inputs/mturk_input.csv')
    parser.add_argument("-id", "--id-key", default='question_id')
    args = parser.parse_args()

    dest = args.output_review_file

    question_jsons = get_json_list(args.question_file)
    answer_jsons = list(map(get_json_list, args.answer_file_list))
    review_jsons = get_review_jsons(args.review_dir, args.answer_file_list)

    question_ids = set(question[args.id_key] for question in question_jsons)
    question_jsons = sorted(question_jsons, key=lambda x: x[args.id_key])

    def filter_and_sortby_questionid(jsons):
        return sorted(
            [obj for obj in jsons if obj[args.id_key] in question_ids],
            key=lambda x: x[args.id_key]
        )
    
    answer_jsons = list(map(filter_and_sortby_questionid, answer_jsons))
    review_jsons = list(map(filter_and_sortby_questionid, review_jsons))

    # check if # of questions, answers are the same
    assert all(len(question_jsons) == len(answer_json) for answer_json in answer_jsons)

    total_len = len(question_jsons)
    question_idx_list = list(range(total_len))

    tasks = []

    for question, answers, reviews in zip(question_jsons, zip(*answer_jsons), zip(*review_jsons)):
        assert all(
            question[args.id_key]
            == a[args.id_key]
            for a in answers
        ) and all(
            question[args.id_key]
            == r[args.id_key]
            for r in reviews
        )

        def process_answer(answer_json):
            return {
                "model_id": answer_json["model_id"],
                "response_id": answer_json["answer_id"],
                "text": answer_json["text"],
            }
        
        def process_review(review_json):
            return {
                "answer1_id": review_json["answer1_id"],
                "answer2_id": review_json["answer2_id"],
                "text": review_json["text"],
                "score": review_json["score"],
            }
        
        responses = list(map(process_answer, answers))
        trimmed_reviews = list(map(process_review, reviews))
        metrics = args.metrics

        task = {
            "question": question,
            "responses": responses,
            "metrics": metrics,
            "reviews": trimmed_reviews,
        }
        tasks.append(task)

    with open(dest, "w", newline='') as output_csv:
        writer = csv.writer(output_csv)
        writer.writerow(['data'])
        for task in tasks:
            writer.writerow([json.dumps(task)])

