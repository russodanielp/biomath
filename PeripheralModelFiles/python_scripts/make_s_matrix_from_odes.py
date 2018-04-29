import pandas as pd
import numpy as np

odes = pd.read_csv('../text_files/odes.csv', header=None)

reaction_fluxes = pd.read_csv('../text_files/reaction_fluxes.csv', header=None, sep='\t')

zhems_fluxes = pd.read_csv('../text_files/zhems_flux.csv', header=None, sep='\t')

def clean_up_equations(equation):
    """ cleans up the right hand portion of the text from an ODE"""
    # first remove unnecessary characters
    for char in [';', '(', ')']:
        equation = equation.replace(char, '')

    new_equation = []
    old_equation = equation.strip().split(' ')

    for term in old_equation:
        if term in ['+', '-']:
            new_equation.append(' ' + term)
        else:
            new_equation.append(term)
    return [term.replace('+', '') for term in ''.join(new_equation).split(' ')]



def clean_up_reaction_fluxes(rxn_flx):
    """ cleans up reaction fluxes:  looks like each right hand of the ReactionFlux equation
    is the product, where the first term is the rate constant.  The rest needs to go into the S matrix """
    # first remove unnecessary characters
    rxn_flx = rxn_flx.strip().replace(';', '')
    if 'piecewise' in rxn_flx:
        flx, S_component = 0, rxn_flx
    elif 'Time_Sim' in rxn_flx:
        flx, S_component = rxn_flx, 1
    else:
        seperated_terms = rxn_flx.split('*')
        flx = seperated_terms[0]
        S_component = '*'.join(seperated_terms[1:])

    return flx, S_component



# there are two 'weird' ReactionFluxs, 45 and 46.
# these are in the ODEs for VLDL_pl and Chol_ic_P
# they are
# VLDL_pl_P_uptake_rate_k*VLDL_pl+VLDL_pl_P_LDLRuptake_rate_k*LDLR_internalization_fraction_P*VLDL_pl*LDLR_cs_P
# (VLDL_pl_P_uptake_rate_k*VLDL_pl+VLDL_pl_P_LDLRuptake_rate_k*LDLR_internalization_fraction_P*VLDL_pl*LDLR_cs_P)*chol_per_VLDL_particle
# will turn 45 and 46 to
# VLDL_pl_P_uptake_rate_k*VLDL_pl
# VLDL_pl_P_uptake_rate_k*chol_per_VLDL_particle
# then need to add ReactionFluxes 61 and 62
# VLDL_pl_P_LDLRuptake_rate_k*LDLR_internalization_fraction_P*VLDL_pl*LDLR_cs_P
# VLDL_pl_P_LDLRuptake_rate_k*LDLR_internalization_fraction_P*VLDL_pl*LDLR_cs_P*chol_per_VLDL_particle


reaction_fluxes.loc[45, 1] = 'VLDL_pl_P_uptake_rate_k*VLDL_pl'
reaction_fluxes.loc[46, 1] = 'VLDL_pl_P_uptake_rate_k*chol_per_VLDL_particle'

reaction_fluxes.loc[60] = ['ReactionFlux61', 'VLDL_pl_P_LDLRuptake_rate_k*LDLR_internalization_fraction_P*VLDL_pl*LDLR_cs_P']
reaction_fluxes.loc[61] = ['ReactionFlux62', 'VLDL_pl_P_LDLRuptake_rate_k*LDLR_internalization_fraction_P*VLDL_pl*LDLR_cs_P*chol_per_VLDL_particle']


# need to replect this in the ODEs


odes.loc[6, 1] = odes.loc[6, 1].replace('- ReactionFlux45', '- ReactionFlux45 - ReactionFlux61')
odes.loc[9, 1] = odes.loc[9, 1].replace('+ ReactionFlux46', '+ ReactionFlux46 + ReactionFlux62')

# create a dictionary to map the components that will go into the S matrix
# with the names ReactionFlux, as listed in the ODEs

S_component_map = {}
i = 1
for x, y in zip(reaction_fluxes[1].values, zhems_fluxes[1].values):
    f_terms = y.strip().replace(';', '').split("*")

    # there are some unique fluxes is just easier to manually fix
    # such as 44
    if f_terms == ['Chol_ic_P_to_HDL_pl_rate_k/chol_per_HDL_particle']:
        S_components = ['Chol_ic_P', 'power(ApoA1_pl,ApoA1_RCT_nh)/(power(ApoA1_RCT_EC50,ApoA1_RCT_nh)+power(ApoA1_pl,ApoA1_RCT_nh))']
    else:
        rxn_terms = x.strip().replace(';', '').split("*")
        S_components = [term for term in rxn_terms if term not in f_terms]
        if not S_components:
            S_components = ['1']

    S_component_map['ReactionFlux{}'.format(i)] = "*".join(S_components)
    i += 1
    # print("=====")
    # print("*".join(f_terms))
    # print("*".join(rxn_terms))


S_matrix = pd.DataFrame(index=odes[0].values, columns=['ReactionFlux{}'.format(i) for i in range(1, len(S_components)+1)])


for idx, ode in odes.iterrows():
    metabolite = ode[0]
    right_hand_side = clean_up_equations(ode[1])
    for rf in right_hand_side:

        if rf[0] == '-':

            S_matrix.loc[metabolite, rf.replace('-', '')] = '-' + S_component_map[rf.replace('-', '')]
        else:

            S_matrix.loc[metabolite, rf] = S_component_map[rf]

S_matrix.fillna(0, inplace=True)

S_matrix.to_csv('../text_files/S_matrix_python_27x62.csv')



