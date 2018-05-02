import pandas as pd
from S_matrix import null_sum
from maps import maps

patient_fluxes = pd.read_csv('../SNL005_VP2.txt', sep=' ', index_col=0)
print(patient_fluxes)

for map in maps:
    for idx, param in map.items():
        if param not in patient_fluxes.index:
            print(param)


# for i, param in enumerate(null_sum):
#     idx = i+1
#     expression = str(param)
#     flux = flux_map[idx]
#     print(flux, expression)