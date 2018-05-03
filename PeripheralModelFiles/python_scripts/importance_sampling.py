import pandas as pd
from S_matrix_symbols import null_sum, x
from symbols import all_symbols, flux_symbols
from maps import maps, flux_map
import numpy as np

from sympy import sympify
patient_fluxes = pd.read_csv('../SNL005_VP2.txt', sep=' ', index_col=0)
initial_conc = pd.read_csv('../species.csv', sep=',', index_col=0)

all_names = []

flux_dictionary = patient_fluxes.to_dict()['1']

dictionary = {**flux_dictionary, **initial_conc.to_dict()['0']}


##### DOSING WTF???? #####
MAb_dose = 1
Statin_dose = 1
dictionary['MAb_dose'] = MAb_dose
dictionary['Statin_dose'] = Statin_dose

# find which coefficients correspond to which fluxes

a = ['a{}'.format(i) for i in range(1, 54+1)]

flux_names = [flux_map[i] for i in range(1, 54+1)]

a_dictionary = {}

for a_i in range(1, 54+1):
    flux_for_a_i = flux_symbols[a_i].subs(dictionary)
    a_dictionary['a{}'.format(a_i)] = flux_for_a_i

dictionary = {**dictionary, **a_dictionary}

target_flux = 'a1'
sigma = 1
size = 10

means = np.array(['a{}'.format(a_i) for a_i in range(1, 54+1)])

lognormal_distribution = np.random.lognormal(a_dictionary[target_flux], sigma, size)

for new_a in lognormal_distribution:
    #fill the new_a in the
    dictionary[target_flux] = new_a


    # recalculate fluxes
    results = np.nan_to_num(np.array([col if col != np.nan else 0 for col in null_sum.subs(dictionary)],  dtype=np.float64))

    good_results = (results >= 0).sum()
    print(good_results/len(results))
