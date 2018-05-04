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

dictionary['MAb_dose'] = 0
dictionary['Statin_dose'] = 0

for key, val in dictionary.items():
    exec("{} = {}".format(key, val))

fluxes = np.array([eval(str(flux_symbols[f_i])) for f_i in range(1, len(flux_symbols)+1)])

a_dictionary = {}
for f_i in range(1, len(flux_symbols)+1):
    if len(null_sum[f_i-1].free_symbols) == 1:
        a_dictionary[str(null_sum[f_i-1])] = fluxes[f_i-1]
        exec("{} = {}".format(str(null_sum[f_i-1]), fluxes[f_i-1]))
        print(null_sum[f_i-1])

dictionary = {**dictionary, **a_dictionary}


e_fluxes = np.array([eval(str(flux)) for flux in null_sum])
print(e_fluxes)


max_iterations = 100
v_step = 100


# for now change so everything is > 0


list_of_target_coefficients = list(a_dictionary.keys())
print(list_of_target_coefficients)

good_coefficients = {}

base_dictionary = dict(dictionary)

for target_a in list_of_target_coefficients:

    new_dictionary = dict(base_dictionary)
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

            exec("{} = {}".format(free_symbol, new_dictionary[str(free_symbol)]))

        expected_fluxes = np.array([eval(expression) for expression in fluxes_dependent_on_target])



    # find which coefficients correspond to which fluxes


    #expected_fluxes = np.array([col.subs(dictionary) for col in fluxes_dependent_on_target])







    num_flux = len(fluxes_dependent_on_target)


    a_log = np.zeros((max_iterations,v_step+1))

    mu = np.zeros((max_iterations,1))
    sig = np.zeros((max_iterations,1))
    V = np.zeros((max_iterations,1))
    extrema_count = np.zeros((max_iterations,1))
    extrema_ratio = np.zeros((max_iterations,1))

    p_epsilon = 1e-2
    possible_extrema = num_flux*(v_step+1)


    M =  a_dictionary[target_a]
    if target_a in ['a16', 'a21', 'a23', 'a24', 'a25']:
        NewVariance = 0.1 * M
    else:
        NewVariance = 0.01 * M
    # take 0.1% steps
    if target_a in ['a8', 'a12']:
        h = 0.0001*M
    else:
        h = 0.001*M

    print(M)
    for m in range(max_iterations):
        V[m] = NewVariance
        #print(M, V[m])
        mu[m] = math.log((M**2)/math.sqrt(V[m]+M**2))
        sig[m] = math.sqrt(math.log(V[m]/(M**2)+1))

        initial_cost_step = lognorm(scale=np.exp(mu[m]), s=sig[m]).ppf(0.025)
        final_cost_step = lognorm(scale=np.exp(mu[m]), s=sig[m]).ppf(0.975)
        delta_v = (final_cost_step - initial_cost_step) / v_step
        if all(np.isnan(initial_cost_step)):
            break
        for n in range(v_step + 1):

            a_log[m, n] = initial_cost_step + (n - 1) * delta_v
            new_dictionary[target_a] = a_log[m, n]

            exec("{} = {}".format(target_a, new_dictionary[target_a]))


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

    if (extrema_ratio[m] < 0.051) and (extrema_ratio[m] > 0.049):
        print("Finished for coefficient {}".format(target_a))
        print("u is {}, sigma is {}".format(mu[m][0], sig[m][0]))
        print('There are {} out of {} extreme flux values. Ratio is {:.2f}%'.format(extrema_count[m][0], possible_extrema,
                                                                               extrema_ratio[m][0]*100))
        good_coefficients[target_a]= (mu[m][0], sig[m][0])
    else:
        print("could not find solution for {}".format(target_a))


f = open('../text_files/u_and_sigmas.csv', 'w')
for target_a, (u, sig) in good_coefficients.items():
    f.write(target_a + ',' + str(u) + ',' + str(sig) + '\n')
f.close()



