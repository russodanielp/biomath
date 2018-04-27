from sympy import Matrix, Symbol, sympify
import pandas as pd


S = pd.read_csv('../text_files/s_matrix_python.csv')

def  convert(x):
    if type(x) == str:
        return sympify(x)
    else:
        return sympify(x)



S_sym = Matrix(S.applymap(convert).values)

null = S_sym.nullspace()


m = []
for each in null:
    new_list = [i[0] for i in each.tolist()]
    m.append(new_list)
pd.DataFrame(m).T.to_csv('../text_files/nullspace.csv')

null_sum = null[0]
for i in range(1, len(null)):
    null_sum = null_sum + null[i]

null_sum_list = []
for each in null_sum.tolist():
    null_sum_list.append(each[0])

print(null_sum_list)
pd.DataFrame(null_sum_list).T.to_csv('../text_files/nullsum.csv')