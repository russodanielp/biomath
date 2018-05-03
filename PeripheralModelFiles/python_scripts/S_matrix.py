from sympy import sympify, Matrix, simplify
import pandas as pd
from maps import flux_map

x = [''] + [sympify('x{}'.format(i)) for i in range(1, 28+1)]
f = [''] + [sympify('f{}'.format(i)) for i in range(1, 54+1)]
v = [''] + [sympify('v{}'.format(i)) for i in range(1, 3+1)]
k = [''] + [sympify('k{}'.format(i)) for i in range(1, 3+1)]
p = [''] + [sympify('p{}'.format(i)) for i in range(1, 35+1)]
c = [''] + [sympify('c{}'.format(i)) for i in range(1, 2+1)]


S = pd.DataFrame(index=list(range(1, 27+1)), columns=list(range(1, 54+1)))

S.loc[1, 52] = x[27]
S.loc[1, 50] = -x[1]
S.loc[1, 7] = -x[1]
S.loc[1, 51] = -x[1]
S.loc[1, 6] = x[6]
S.loc[2, 1] = 1
S.loc[3, 4] = x[4]
S.loc[3, 29] = -x[3]
S.loc[3, 49] = -x[3]
S.loc[3, 46] = x[24]
S.loc[3, 18] = x[17]
S.loc[3, 17] = -(x[12] * x[3]) / v[1]
S.loc[3, 3] = -(x[5] * x[3]) / p[34]
S.loc[3, 45] = -(x[4] * x[3]) / p[34]
S.loc[4, 46] = x[24]
S.loc[4, 4] = -x[4]
S.loc[4, 2] = -x[4]
S.loc[4, 3] = (x[5] * x[3]) / p[34]
S.loc[4, 45] = -(x[4] * x[3]) / p[34]
S.loc[5, 31] = x[23]
S.loc[5, 5] = -x[5]
S.loc[5, 4] = x[4]
S.loc[5, 3] = -(x[5] * x[3]) / p[34]
S.loc[6, 6] = -x[6]
S.loc[6, 30] = -x[6]
S.loc[6, 48] = 1
S.loc[7, 42] = (x[11] ** p[6] * x[28] ** p[10] * x[8] * k[1] * p[30] * p[28]) / (k[2] * (x[11] ** p[6] + p[5] ** p[6]) * (x[28] ** p[10] + p[9] ** p[10]))
S.loc[7, 38] = -x[7] * ((c[2] ** p[18] * p[17]) / (c[2] ** p[18] + p[16] ** p[18]) + 1)
S.loc[7, 54] = -x[12] * p[19] * x[7]
S.loc[7, 41] = -x[7]
S.loc[8, 40] = (x[9] ** p[2] * x[10]) / (k[1] * (x[9] ** p[2] + p[1] ** p[2]))
S.loc[8, 39] = -(x[11] ** p[4] * x[28] ** p[8] * x[8] * p[29] * p[27]) / ((x[11] ** p[4] + p[3] ** p[4]) * (x[28] ** p[8] + p[7] ** p[8]))
S.loc[8, 42] = -(x[11] ** p[6] * x[28] ** p[10] * x[8] * p[30] * p[28]) / ((x[11] ** p[6] + p[5] ** p[6]) * (x[28] ** p[10] + p[9] ** p[10]))
S.loc[9, 28] = -x[9]
S.loc[10, 41] = k[2] * x[7]
S.loc[10, 54] = x[12] * p[19] * x[7]
S.loc[10, 35] = -x[10]
S.loc[10, 37] = x[20] * k[3]
S.loc[10, 43] = x[25] * k[3]
S.loc[10, 40] = -(x[9] ** p[2] * x[10]) / (x[9] ** p[2] + p[1] ** p[2])
S.loc[10, 34] = -(x[22] ** p[21] * ((p[24] * abs(c[1]) ** p[25]) / (p[26] ** p[25] + abs(c[1]) ** p[25]) - 1)) / (x[22] ** p[21] + p[20] ** p[21])
S.loc[11, 27] = -x[11]
S.loc[12, 14] = x[15]
S.loc[12, 9] = x[16]
S.loc[12, 16] = x[13]
S.loc[12, 13] = -x[12] * p[19]
S.loc[12, 18] = x[17]
S.loc[12, 15] = -(x[25] * x[12]) / v[1]
S.loc[12, 17] = -(x[12] * x[3]) / v[1]
S.loc[13, 15] = (x[25] * x[12]) / v[1]
S.loc[13, 25] = -x[13] * p[19]
S.loc[13, 16] = -x[13]
S.loc[14, 25] = x[13] * p[19]
S.loc[14, 20] = -x[14]
S.loc[14, 19] = (x[20] * x[15]) / v[3]
S.loc[15, 20] = x[14]
S.loc[15, 23] = -x[15]
S.loc[15, 14] = -x[15]
S.loc[15, 13] = x[12] * p[19]
S.loc[15, 22] = x[18]
S.loc[15, 19] = -(x[20] * x[15]) / v[3]
S.loc[15, 21] = -(x[15] * x[19]) / v[3]
S.loc[16, 8] = (x[22] ** p[23]) / (x[22] ** p[23] + p[22] ** p[23])
S.loc[16, 9] = -x[16]
S.loc[17, 17] = (x[12] * x[3]) / v[1]
S.loc[17, 18] = -x[17]
S.loc[17, 26] = -p[19] * x[17]
S.loc[18, 26] = p[19] * x[17]
S.loc[18, 33] = -x[18]
S.loc[18, 22] = -x[18]
S.loc[18, 21] = (x[15] * x[19]) / v[3]
S.loc[19, 49] = x[3]
S.loc[19, 24] = -x[19]
S.loc[19, 22] = x[18]
S.loc[19, 21] = -(x[15] * x[19]) / v[3]
S.loc[20, 20] = x[14]
S.loc[20, 37] = -x[20]
S.loc[20, 19] = -(x[20] * x[15]) / v[3]
S.loc[21, 10] = 1
S.loc[21, 11] = -x[21]
S.loc[21, 12] = x[21] * ((p[35] ** p[15] * p[14]) / (p[35] ** p[15] + p[12] ** p[15]) - 1)
S.loc[22, 36] = -x[22]
S.loc[22, 12] = -x[21] * ((p[35] ** p[15] * p[14]) / (p[35] ** p[15] + p[12] ** p[15]) - 1)
S.loc[23, 31] = -x[23]
S.loc[23, 32] = -x[23]
S.loc[23, 47] = 1
S.loc[24, 45] = (x[4] * x[3]) / p[34]
S.loc[24, 46] = -x[24]
S.loc[24, 44] = -x[24]
S.loc[25, 16] = x[13]
S.loc[25, 43] = -x[25]
S.loc[25, 15] = -(x[25] * x[12]) / v[1]
S.loc[25, 38] = (x[7] * k[2]) / k[3]
S.loc[25, 39] = (x[11] ** p[4] * x[28] ** p[8] * x[8] * k[1] * p[29] * p[27]) / (k[3] * (x[11] ** p[4] + p[3] ** p[4]) * (x[28] ** p[8] + p[7] ** p[8]))
S.loc[26, 50] = x[1]
S.loc[26, 53] = -x[26]
S.loc[27, 51] = x[1]
S.loc[27, 52] = -x[27]

S.fillna(sympify(0), inplace=True)


print(S.shape)
S = Matrix(S.values)


nullspace = S.nullspace()


m = []


for each in nullspace:
    new_list = [i[0] for i in each.tolist()]
    m.append(new_list)



null_sum = sympify('a{}'.format(1)) * nullspace[0]
for i in range(1, len(nullspace)):
    a = sympify('a{}'.format(i+1))
    null_sum = null_sum + (a * nullspace[i])


null_sum_list = []
for each in null_sum.tolist():
    null_sum_list.append(each[0])

pd.DataFrame(m).T.to_csv('../text_files/nullspace.csv')

# create a map to get function names


for each in null_sum:
    print(each)

f = open('../text_files/nullsum.txt', 'w')
for i, param in enumerate(null_sum):
    idx = i+1
    expression = str(simplify(param))
    flux = flux_map[idx]
    f.write(expression + '\t' +  flux + '\n')
f.close()

