import numpy as np
import pandas as pd
from statsmodels.stats.inter_rater import aggregate_raters, fleiss_kappa

df = pd.read_csv('../data/vicuna80/vicuna_benchmark_human_annotations.csv')

print(df.columns)

data = df['answer'].to_numpy().reshape((-1, 3))

# Fleiss score
agg = aggregate_raters(data)
result = fleiss_kappa(agg[0], method='fleiss')
print(result)

# Accuracy
# three-way pairwise comparison
agree_1_2 = np.sum(data[:, 0] == data[:, 1])
agree_1_3 = np.sum(data[:, 0] == data[:, 2])
agree_2_3 = np.sum(data[:, 1] == data[:, 2])
print((agree_1_2 + agree_1_3 + agree_2_3) / (3 * len(data)))

