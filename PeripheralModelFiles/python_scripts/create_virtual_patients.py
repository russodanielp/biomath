from S_matrix_symbols import null_sum, flux_symbols
import pandas as pd
from scipy.stats import lognorm
import numpy as np

num_patients = 20

list_of_target_coefficients = ['a2', 'a7']

mus_and_sigmas = pd.read_csv('../text_files/u_and_sigmas.csv', sep=',', index_col=0, header=None)

virtual_patients = {}
patient_fluxes = pd.read_csv('../SNL005_VP2.txt', sep=' ', index_col=0)
initial_conc = pd.read_csv('../species.csv', sep=',', index_col=0)

all_names = []


flux_dictionary = patient_fluxes.to_dict()['1']

dictionary = {**flux_dictionary, **initial_conc.to_dict()['0']}


a_dictionary = {
                'a1' : 0.36*0.6,
                'a2' : 0.693,
                'a3' : 8.3,
                'a4' : 0.36*2000,
                'a5' : 0.36*350,
                'a6' : 0.36*4000,
                'a7' : 0.36*10,
                'a8' : 0.0219,
                'a9' : 8.3,
                'a10' : 0.1,
                'a11' : 1*(1-0.14),
                'a12' : 0.025*(1-0.6),
                'a13' : 0.1,
                'a14' : 0,
                'a15' : 0.693,
                'a16' : 0.000577,
                'a17' : 0,
                'a18' : 0.0238,
                'a19' : 0.00034,
                'a20' : 0.36,
                'a21' : 0.36*0.6,
                'a22' : 0,
                'a23' : 0,
                'a24' : 0,
                'a25' : 0.333 ,
                'a26' : 0.5,
                'a27' : 0,
                'a28' : 0}


vp_profiles = {}

for vp in range(num_patients):
    # VP specific coefficients
    vp_coefficients = {}
    for a in list_of_target_coefficients:
        mu, sigma = mus_and_sigmas.loc[a, 1], mus_and_sigmas.loc[a, 2]
        vp_coefficients[a] = lognorm(scale=np.exp(mu), s=sigma).rvs(size=1)

    # supplement these values with missing a_s
    for other_a, average_a in a_dictionary.items():
        if other_a not in vp_coefficients.keys():
            vp_coefficients[other_a] = average_a

    solved_fluxes = null_sum.subs({**dictionary, **vp_coefficients})
    fluxes = {}
    for i, flux in enumerate(solved_fluxes):
        fluxes[str(flux_symbols[i+1])] = flux
    vp_profiles['VP{}'.format(vp)] = fluxes


df = pd.DataFrame.from_dict(vp_profiles).T.fillna(0)
df.to_csv('../text_files/virtual_patients.csv')