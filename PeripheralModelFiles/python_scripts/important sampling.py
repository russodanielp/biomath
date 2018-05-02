import pandas as pd
from S_matrix_symbols import null_sum, x
from symbols import all_symbols
from maps import maps

patient_fluxes = pd.read_csv('../SNL005_VP2.txt', sep=' ', index_col=0)
initial_conc = pd.read_csv('../species.csv', sep=',', index_col=0)

all_names = []

dictionary = {**patient_fluxes.to_dict()['1'], **initial_conc.to_dict()['0']}

print(null_sum.subs(dictionary))


# for map in maps:
#     for idx, param in map.items():
#         all_names.append(param)
#
#
#
# for name in all_names:
#     if name not in patient_fluxes.index:
#         print(name)

# for i, param in enumerate(null_sum):
#     idx = i+1
#     expression = str(param)
#     flux = flux_map[idx]
#     print(flux, expression)