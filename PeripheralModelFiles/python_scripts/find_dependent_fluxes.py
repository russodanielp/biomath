from symbols import flux_symbols
from S_matrix_symbols import null_sum
import pandas as pd

mus_and_sigmas = pd.read_csv('../text_files/u_and_sigmas.csv', sep=',', index_col=0, header=None)

f = open('../text_files/kernal_vector.csv', 'w')

for i, row in enumerate(null_sum):
    f.write(str(row) + ',' + str(flux_symbols[i+1]) +'\n')

f.close()