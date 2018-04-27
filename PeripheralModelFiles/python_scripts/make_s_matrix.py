import pandas as pd
import numpy as np

S = pd.read_csv('../text_files/s_matrix.csv', header=None)

reactions = pd.read_csv('../text_files/reactions.txt', index_col=0, delimiter='\t', header=None)
species = pd.read_csv('../text_files/species.csv', index_col=0, header=None)

S.index = species.index
S.columns = reactions.index

new_S = pd.DataFrame(index=S.index, columns=S.columns)

for i, rxn in enumerate(S.columns):
    reactants = '*'.join(S.iloc[:, i].index[S.iloc[:, i] == -1])

    reactants_mask = S.iloc[:, i] == -1
    products_mask = S.iloc[:, i] == 1

    print(np.where(reactants_mask.values))
    new_S.iloc[np.where(reactants_mask.values)[0], i] = '-' + reactants
    new_S.iloc[np.where(products_mask.values)[0], i] = reactants


print(reactions.head())


new_S.fillna(0).to_csv('../text_files/s_matrix_python.csv')
