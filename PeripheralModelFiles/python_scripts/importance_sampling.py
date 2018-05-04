import pandas as pd
from scipy.stats import lognorm
from S_matrix_symbols import null_sum, x
import sympy as sy
from symbols import all_symbols, flux_symbols
from maps import maps, flux_map
import numpy as np
import math

from sympy import sympify
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
                'a27' : 0}




target_a = 'a2'


dictionary = {**dictionary, **a_dictionary}


fluxes_dependent_on_target = []
free_symbols = []

for col in null_sum:
    if sy.Symbol(target_a) in col.free_symbols:
        fluxes_dependent_on_target.append(str(col))
        for free_symbol in col.free_symbols:
            if free_symbol not in free_symbols:
                free_symbols.append(str(free_symbol))

# first need to create python variables for all the free variables
# and set it equal to its value
for free_symbol in free_symbols:
    exec("{} = {}".format(free_symbol, dictionary[str(free_symbol)]))



# find which coefficients correspond to which fluxes

print(fluxes_dependent_on_target)

#expected_fluxes = np.array([col.subs(dictionary) for col in fluxes_dependent_on_target])




expected_fluxes = np.array([eval(expression) for expression in fluxes_dependent_on_target])


max_iterations = 1000
h = 0.0001

alpha = 1
beta = 1
max_penalty = 1e+01

num_flux = len(fluxes_dependent_on_target)

v_step = 100
a_log = np.zeros((max_iterations,v_step+1))

mu = np.zeros((max_iterations,1))
sig = np.zeros((max_iterations,1))
V = np.zeros((max_iterations,1))
extrema_count = np.zeros((max_iterations,1))
extrema_ratio = np.zeros((max_iterations,1))

p_epsilon = 1e-2
possible_extrema = num_flux*(v_step+1)


M =  a_dictionary[target_a]
NewVariance = 1e-2*M


for m in range(max_iterations):
    V[m] = NewVariance
    mu[m] = math.log((M**2)/math.sqrt(V[m]+M**2))
    sig[m] = math.sqrt(math.log(V[m]/(M**2)+1))

    initial_cost_step = lognorm(scale=np.exp(mu[m]), s=sig[m]).ppf(0.025)
    final_cost_step = lognorm(scale=np.exp(mu[m]), s=sig[m]).ppf(0.975)
    delta_v = (final_cost_step - initial_cost_step) / v_step

    for n in range(v_step + 1):

        a_log[m, n] = initial_cost_step + (n - 1) * delta_v
        dictionary[target_a] = a_log[m, n]

        exec("{} = {}".format(target_a, dictionary[target_a]))


        #new_fluxes =  np.array([col.subs(dictionary) for col in fluxes_dependent_on_target])
        new_fluxes = np.array([eval(expression) for expression in fluxes_dependent_on_target])

        extrema_count[m] = extrema_count[m] + ((new_fluxes < (0.5*expected_fluxes))| (new_fluxes > (1.5*expected_fluxes))).sum()
    extrema_ratio[m] = extrema_count[m] / possible_extrema

    if extrema_ratio[m] > 0.051:
        NewVariance = V[m] - h
    elif extrema_ratio[m] < 0.049:
        NewVariance = V[m] + h
    else:
        break

print(m)
print("u is {}, sigma is {}".format(mu[m][0], sig[m][0]))
print('There are {} out of {} extreme flux values. Ratio is {}'.format(extrema_count[m], possible_extrema, extrema_ratio[m]))







