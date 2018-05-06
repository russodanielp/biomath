from S_matrix_symbols import null_sum, flux_symbols
import pandas as pd
from scipy.stats import lognorm
import numpy as np

num_patients = 20



mus_and_sigmas = pd.read_csv('../text_files/u_and_sigmas.csv', sep=',', index_col=0, header=None)

virtual_patients = {}
patient_fluxes = pd.read_csv('../SNL005_VP2.txt', sep=' ', index_col=0)
initial_conc = pd.read_csv('../species.csv', sep=',', index_col=0)

all_names = []


# only vary the mus and sigmas we could find mus and sigmas for
# in importance sampling

list_of_target_coefficients = mus_and_sigmas.index

flux_dictionary = patient_fluxes.to_dict()['1']

dictionary = {**flux_dictionary, **initial_conc.to_dict()['0']}

dictionary['MAb_dose'] = 0
dictionary['Statin_dose'] = 0

for key, val in dictionary.items():
    exec("{} = {}".format(key, val))

fluxes = np.array([eval(str(flux_symbols[f_i])) for f_i in range(1, len(flux_symbols)+1)])

print(fluxes)

a_dictionary = {}
for f_i in range(1, len(flux_symbols)+1):
    if len(null_sum[f_i-1].free_symbols) == 1:
        a_dictionary[str(null_sum[f_i-1])] = fluxes[f_i-1]
        exec("{} = {}".format(str(null_sum[f_i-1]), fluxes[f_i-1]))
        print(null_sum[f_i-1])





vp_profiles = {}

for vp in range(num_patients):
    # VP specific coefficients
    vp_coefficients = {}
    for a in list_of_target_coefficients:
        mu, sigma = mus_and_sigmas.loc[a, 1], mus_and_sigmas.loc[a, 2]
        sample = lognorm(scale=np.exp(mu), s=sigma).rvs(size=1)
        vp_coefficients[a] = sample
        if sample < 0:
            print(a)

    # supplement these values with missing a_s
    for other_a, average_a in a_dictionary.items():
        if other_a not in vp_coefficients.keys():
                   vp_coefficients[other_a] = average_a

    for vp_coeff, val in vp_coefficients.items():
        exec("{} = {}".format(vp_coeff, float(val)))

    solved_fluxes = [eval(str(equation)) for equation in null_sum]
    fluxes = {}
    for i, flux in enumerate(solved_fluxes):
        if flux <0:
            print(flux)
            print(null_sum[i+1])
        fluxes[str(flux_symbols[i+1])] = flux
    vp_profiles['VP{}'.format(vp)] = fluxes


df = pd.DataFrame.from_dict(vp_profiles).T.fillna(0)
df.to_csv('../text_files/virtual_patients.csv')