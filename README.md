# PRD: Peer Rank and Discussion Improve Large Language Model based Evaluations

| [Paper]() | [Demo](http://bcdnlp.github.io/PR_LLM_EVAL) |

## Peer Rank (PR) process:

![Peer Rank (PR) process](assets/peer_rank.png)

## Peer Discussion (PD) process:

![Peer Discussion (PD) process](assets/peer_discussion.png)

## Install Dependencies

```bash
# create an environment
conda create -n prd python=3.8
conda activate prd

# install from the requirement file by pip
pip install -r requirement.txt
```

## Datasets

For information about datasets, please refer to the [README](data/README.md) file.

## Generated Results

For information about generated results, please refer to the [README](results/README.md) file.

## Run

Please follow the bash commands to run corresponding parts.

### Peer Rank

(To Be Added)

### Peer Discussion

Please enter the `peer_discussion` folder by the following command.

```bash
cd peer_discussion/
```

Before running any python script, please make sure the file `config.yml` contains correct configurations you need.

#### Reviews Generation

```bash
python review_lfqa.py
```

There is no codes of generating reviews for Vicuna80 since they are provided in the Peer Rank related codes.

#### Discussion Generation

```bash
# discuss on LFQA
python gather_all_lfqa.py
python discuss_lfqa.py

# discuss on Vicuna80
python gather_all_vicuna80.py
python discuss_vicuna80.py
```

## Citation

Please cite the following if find our work helpful.

```bibtex
(To Be Added)
```

## Contact

Following 2 options are available for any clarification, comments or suggestions

- Create an [issue](https://github.com/bcdnlp/PRD/issues).
- Contact [Ruosen Li](mailto:ruosen.li@utdallas.edu), [Teerth Roshan Patel](mailto:teerth.patel@utdallas.edu), [Xinya Du](mailto:xinya.du@utdallas.edu) by email.

