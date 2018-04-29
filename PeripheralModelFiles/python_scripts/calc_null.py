from sympy import Matrix, Symbol, sympify
import pandas as pd


S = pd.read_csv('../text_files/S_matrix_python_27x62_for_python.csv', index_col=0)

init_params = pd.read_csv('../text_files/initial_params.csv', index_col=0, header=None)

def  convert(x):
        return sympify(x)


p_1 = 'piecewise(0,or(eq(MAb_dose_amount,0),ge(floor((Time_Sim-MAb_dose_start)/MAb_dose_interval),MAb_dose_cycles)),MAb_dose_amount/MAb_MW/convert_nmol_to_mmol/MAb_dose_duration,and(ge(Time_Sim,MAb_dose_start+ge(Time_Sim,MAb_dose_start)*floor((Time_Sim-MAb_dose_start)/MAb_dose_interval)*MAb_dose_interval),lt(Time_Sim,MAb_dose_start+MAb_dose_duration+ge(Time_Sim,MAb_dose_start)*floor((Time_Sim-MAb_dose_start)/MAb_dose_interval)*MAb_dose_interval)),0)+piecewise(0,or(eq(MAb_doseX_amount,0),ge(floor((Time_Sim-MAb_doseX_start)/MAb_doseX_interval),MAb_doseX_cycles)),MAb_doseX_amount/MAb_MW/convert_nmol_to_mmol/MAb_doseX_duration,and(ge(Time_Sim,MAb_doseX_start+ge(Time_Sim,MAb_doseX_start)*floor((Time_Sim-MAb_doseX_start)/MAb_doseX_interval)*MAb_doseX_interval),lt(Time_Sim,MAb_doseX_start+MAb_doseX_duration+ge(Time_Sim,MAb_doseX_start)*floor((Time_Sim-MAb_doseX_start)/MAb_doseX_interval)*MAb_doseX_interval)),0)'
p_2 = 'piecewise(0,or(eq(Statin_dose_amount,0),ge(floor((Time_Sim-Statin_dose_start)/Statin_dose_interval),Statin_dose_cycles)),Statin_dose_amount/Statin_MW/convert_nmol_to_mmol/Statin_dose_duration,and(ge(Time_Sim,Statin_dose_start+ge(Time_Sim,Statin_dose_start)*floor((Time_Sim-Statin_dose_start)/Statin_dose_interval)*Statin_dose_interval),lt(Time_Sim,Statin_dose_start+Statin_dose_duration+ge(Time_Sim,Statin_dose_start)*floor((Time_Sim-Statin_dose_start)/Statin_dose_interval)*Statin_dose_interval)),0)+piecewise(0,or(eq(Statin_doseX_amount,0),ge(floor((Time_Sim-Statin_doseX_start)/Statin_doseX_interval),Statin_doseX_cycles)),Statin_doseX_amount/Statin_MW/convert_nmol_to_mmol/Statin_doseX_duration,and(ge(Time_Sim,Statin_doseX_start+ge(Time_Sim,Statin_doseX_start)*floor((Time_Sim-Statin_doseX_start)/Statin_doseX_interval)*Statin_doseX_interval),lt(Time_Sim,Statin_doseX_start+Statin_doseX_duration+ge(Time_Sim,Statin_doseX_start)*floor((Time_Sim-Statin_doseX_start)/Statin_doseX_interval)*Statin_doseX_interval)),0)'

def convert_long_fx_to_var(s):
    """ converts the long piecewise functions to 0"""
    if s == p_1:
        return 0
    elif s == p_2:
        return 0
    elif type(s) != str:
        return s
    else:
        for var in init_params.index:
            if var in s:
                s = s.replace(var, str(init_params.loc[var]))
                print(str(init_params.loc[var]))
        return s

# the piecewise functions cause errors when changing them to symbolic variables in python
# will convert them to something else





S_converted = S.applymap(convert_long_fx_to_var)

S_sym = Matrix(S_converted.applymap(convert).values)

null = S_sym.nullspace()

print(len(null))



m = []
for each in null:
    new_list = [i[0] for i in each.tolist()]
    m.append(new_list)
pd.DataFrame(m).T.to_csv('../text_files/nullspace.csv')


print(pd.DataFrame(m).T)

null_sum = null[0]
for i in range(1, len(null)):
    null_sum = null_sum + null[i]

null_sum_list = []
for each in null_sum.tolist():
    null_sum_list.append(each[0])

print(null_sum_list)
pd.DataFrame(null_sum_list).T.to_csv('../text_files/nullsum.csv')