from sympy import sympify, Matrix, simplify, preview
import pandas as pd
from symbols import flux_symbols, metabolite_symbols, volume_symbols, p_symbols, k_symbols, c_symbols

# this script is the same as the other S matrix one, but will make an S matrix with symbols corresponding to actual
# names  this makes

x = [''] + [metabolite_symbols[i] for i in range(1, 27+1)]
f = [''] + [flux_symbols[i] for i in range(1, 53+1)]
v = [''] + [volume_symbols[i] for i in range(1, 3+1)]
k = [''] + [k_symbols[i] for i in range(1, 3+1)]
p = [''] + [p_symbols[i] for i in range(1, 35+1)]
c = [''] + [c_symbols[i] for i in range(1, 2+1)]


S = pd.DataFrame(index=list(range(1, 26+1)), columns=list(range(1, 53+1)))

S.loc[1, 51] = x[26]
S.loc[1, 49] = -x[1]
S.loc[1, 6] = -x[1]
S.loc[1, 50] = -x[1]
S.loc[1, 5] = x[5]
S.loc[2, 3] = x[3]
S.loc[2, 28] = -x[2]
S.loc[2, 48] = -x[2]
S.loc[2, 45] = x[23]
S.loc[2, 17] = x[16]
S.loc[2, 16] = -(x[11] * x[2]) / v[1]
S.loc[2, 2] = -(x[4] * x[2]) / p[34]
S.loc[2, 44] = -(x[3] * x[2]) / p[34]
S.loc[3, 45] = x[23]
S.loc[3, 3] = -x[3]
S.loc[3, 1] = -x[3]
S.loc[3, 2] = (x[4] * x[2]) / p[34]
S.loc[3, 44] = -(x[3] * x[2]) / p[34]
S.loc[4, 30] = x[22]
S.loc[4, 4] = -x[4]
S.loc[4, 3] = x[3]
S.loc[4, 2] = -(x[4] * x[2]) / p[34]
S.loc[5, 5] = -x[5]
S.loc[5, 29] = -x[5]
S.loc[5, 47] = 1
S.loc[6, 41] = (x[10] ** p[6] * x[27] ** p[10] * x[7] * k[1] * p[30] * p[28]) / (k[2] * (x[10] ** p[6] + p[5] ** p[6]) * (x[27] ** p[10] + p[9] ** p[10]))
S.loc[6, 37] = -x[6] * ((c[2] ** p[18] * p[17]) / (c[2] ** p[18] + p[16] ** p[18]) + 1)
S.loc[6, 53] = -x[11] * p[19] * x[6]
S.loc[6, 40] = -x[6]
S.loc[7, 39] = (x[8] ** p[2] * x[9]) / (k[1] * (x[8] ** p[2] + p[1] ** p[2]))
S.loc[7, 38] = -(x[10] ** p[4] * x[27] ** p[8] * x[7] * p[29] * p[27]) / ((x[10] ** p[4] + p[3] ** p[4]) * (x[27] ** p[8] + p[7] ** p[8]))
S.loc[7, 41] = -(x[10] ** p[6] * x[27] ** p[10] * x[7] * p[30] * p[28]) / ((x[10] ** p[6] + p[5] ** p[6]) * (x[27] ** p[10] + p[9] ** p[10]))
S.loc[8, 27] = -x[8]
S.loc[9, 40] = k[2] * x[6]
S.loc[9, 53] = x[11] * p[19] * x[6]
S.loc[9, 34] = -x[9]
S.loc[9, 36] = x[19] * k[3]
S.loc[9, 42] = x[24] * k[3]
S.loc[9, 39] = -(x[8] ** p[2] * x[9]) / (x[8] ** p[2] + p[1] ** p[2])
S.loc[9, 33] = -(x[21] ** p[21] * ((p[24] * abs(c[1]) ** p[25]) / (p[26] ** p[25] + abs(c[1]) ** p[25]) - 1)) / (x[21] ** p[21] + p[20] ** p[21])
S.loc[10, 26] = -x[10]
S.loc[11, 13] = x[14]
S.loc[11, 8] = x[15]
S.loc[11, 15] = x[12]
S.loc[11, 12] = -x[11] * p[19]
S.loc[11, 17] = x[16]
S.loc[11, 14] = -(x[24] * x[11]) / v[1]
S.loc[11, 16] = -(x[11] * x[2]) / v[1]
S.loc[12, 14] = (x[24] * x[11]) / v[1]
S.loc[12, 24] = -x[12] * p[19]
S.loc[12, 15] = -x[12]
S.loc[13, 24] = x[12] * p[19]
S.loc[13, 19] = -x[13]
S.loc[13, 18] = (x[19] * x[14]) / v[3]
S.loc[14, 19] = x[13]
S.loc[14, 22] = -x[14]
S.loc[14, 13] = -x[14]
S.loc[14, 12] = x[11] * p[19]
S.loc[14, 21] = x[17]
S.loc[14, 18] = -(x[19] * x[14]) / v[3]
S.loc[14, 20] = -(x[14] * x[18]) / v[3]
S.loc[15, 7] = (x[21] ** p[23]) / (x[21] ** p[23] + p[22] ** p[23])
S.loc[15, 8] = -x[15]
S.loc[16, 16] = (x[11] * x[2]) / v[1]
S.loc[16, 17] = -x[16]
S.loc[16, 25] = -p[19] * x[16]
S.loc[17, 25] = p[19] * x[16]
S.loc[17, 32] = -x[17]
S.loc[17, 21] = -x[17]
S.loc[17, 20] = (x[14] * x[18]) / v[3]
S.loc[18, 48] = x[2]
S.loc[18, 23] = -x[18]
S.loc[18, 21] = x[17]
S.loc[18, 20] = -(x[14] * x[18]) / v[3]
S.loc[19, 19] = x[13]
S.loc[19, 36] = -x[19]
S.loc[19, 18] = -(x[19] * x[14]) / v[3]
S.loc[20, 9] = 1
S.loc[20, 10] = -x[20]
S.loc[20, 11] = x[20] * ((p[35] ** p[15] * p[14]) / (p[35] ** p[15] + p[12] ** p[15]) - 1)
S.loc[21, 35] = -x[21]
S.loc[21, 11] = -x[20] * ((p[35] ** p[15] * p[14]) / (p[35] ** p[15] + p[12] ** p[15]) - 1)
S.loc[22, 30] = -x[22]
S.loc[22, 31] = -x[22]
S.loc[22, 46] = 1
S.loc[23, 44] = (x[3] * x[2]) / p[34]
S.loc[23, 45] = -x[23]
S.loc[23, 43] = -x[23]
S.loc[24, 15] = x[12]
S.loc[24, 42] = -x[24]
S.loc[24, 14] = -(x[24] * x[11]) / v[1]
S.loc[24, 37] = (x[6] * k[2]) / k[3]
S.loc[24, 38] = (x[10] ** p[4] * x[27] ** p[8] * x[7] * k[1] * p[29] * p[27]) / (k[3] * (x[10] ** p[4] + p[3] ** p[4]) * (x[27] ** p[8] + p[7] ** p[8]))
S.loc[25, 49] = x[1]
S.loc[25, 52] = -x[25]
S.loc[26, 50] = x[1]
S.loc[26, 51] = -x[26]

S.fillna(0, inplace=True)

# S = Matrix(S.values)

S1 = S[~S.index.isin([1,3,4,5,22,23,25,26])]
S2 = S1.loc[:, ~S.columns.isin([1,4,5,6,29,30,31,43,46,47,49,50,51,52])]
S3 = pd.concat([S2.iloc[:, 2:35], S2.iloc[:, 37:38], S2.iloc[:, 38:39]], axis=1)
# S = Matrix(S3.values)

# nullspace = S.nullspace()
#
#
# null_sum = sympify('a{}'.format(1)) * nullspace[0]
# for i in range(1, len(nullspace)):
#     a = sympify('a{}'.format(i+1))
#     null_sum = null_sum + (a * nullspace[i])

def remove_drugs(expression):
    expression = str(expression)
    if 'statin' in expression.lower() or 'mab' in expression.lower():

        return 0
    else:
        return expression

new_S = S.applymap(remove_drugs)


S = Matrix(new_S.values)


nullspace = S.nullspace()

print(len(nullspace))
print(len(nullspace[0]))

preview(nullspace, output='png')

null_sum = sympify('a{}'.format(1)) * nullspace[0]
for i in range(1, len(nullspace)):
    a = sympify('a{}'.format(i+1))
    null_sum = null_sum + (a * nullspace[i])



# f = open('../text_files/nullsum.txt', 'w')
# for i, param in enumerate(null_sum):
#     idx = i+1
#     expression = str(simplify(param))
#     f.write(expression + ',' + str(flux_symbols[idx]) + '\n')
# f.close()
# print(len(nullspace))
# for i, each in enumerate(null_sum):
#     print(i+1, simplify(each))
#
#


# m = []
#
#
# for each in nullspace:
#     new_list = [i[0] for i in each.tolist()]
#     m.append(new_list)
#
#
#
# null_sum = sympify('a{}'.format(1)) * nullspace[0]
# for i in range(1, len(nullspace)):
#     a = sympify('a{}'.format(i+1))
#     null_sum = null_sum + (a * nullspace[i])
#
#
# null_sum_list = []
# for each in null_sum.tolist():
#     null_sum_list.append(each[0])
#
# pd.DataFrame(m).T.to_csv('../text_files/nullspace.csv')
#
# # create a map to get function names
#
#
# f = open('../text_files/nullsum.txt', 'w')
# for i, param in enumerate(null_sum):
#     idx = i+1
#     expression = str(param)
#     flux = flux_map[idx]
#     f.write(expression + '\t' +  flux + '\n')
# f.close()

