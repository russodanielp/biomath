from sympy import sympify, Matrix
import pandas as pd
from maps import flux_map

x = [''] + [sympify('x{}'.format(i)) for i in range(1, 28+1)]
f = [''] + [sympify('f{}'.format(i)) for i in range(1, 56+1)]
v = [''] + [sympify('v{}'.format(i)) for i in range(1, 3+1)]
k = [''] + [sympify('k{}'.format(i)) for i in range(1, 3+1)]
p = [''] + [sympify('p{}'.format(i)) for i in range(1, 35+1)]
c = [''] + [sympify('c{}'.format(i)) for i in range(1, 2+1)]


S = pd.DataFrame(index=list(range(1, 28+1)), columns=list(range(1, 56+1)))

S.loc[1, 54] = x[27]
S.loc[1, 52] = -x[1]
S.loc[1, 8] = -x[1]
S.loc[1, 53] = -x[1]
S.loc[1, 7] = x[6]
S.loc[2, 1] = 1
S.loc[3, 4] = x[4]
S.loc[3, 30] = -x[3]
S.loc[3, 51] = -x[3]
S.loc[3, 48] = x[24]
S.loc[3, 19] = x[17]
S.loc[3, 18] = -(x[12] * x[3]) / v[1]
S.loc[3, 3] = -(x[5] * x[3]) / p[34]
S.loc[3, 47] = -(x[4] * x[3]) / p[34]
S.loc[4, 48] = x[24]
S.loc[4, 4] = -x[4]
S.loc[4, 2] = -x[4]
S.loc[4, 3] = (x[5] * x[3]) / p[34]
S.loc[4, 47] = -(x[4] * x[3]) / p[34]
S.loc[5, 33] = x[23]
S.loc[5, 5] = -x[5]
S.loc[5, 4] = x[4]
S.loc[5, 3] = -(x[5] * x[3]) / p[34]
S.loc[6, 7] = -x[6]
S.loc[6, 31] = -x[6]
S.loc[7, 44] = (x[11] ** p[6] * x[28] ** p[10] * x[8] * k[1] * p[30] * p[28]) / (k[2] * (x[11] ** p[6] + p[5] ** p[6]) * (x[28] ** p[10] + p[9] ** p[10]))
S.loc[7, 40] = -x[7] * ((c[2] ** p[18] * p[17]) / (c[2] ** p[18] + p[16] ** p[18]) + 1)
S.loc[7, 56] = -x[12] * p[19] * x[7]
S.loc[7, 43] = -x[7]
S.loc[8, 42] = (x[9] ** p[2] * x[10]) / (k[1] * (x[9] ** p[2] + p[1] ** p[2]))
S.loc[8, 41] = -(x[11] ** p[4] * x[28] ** p[8] * x[8] * p[29] * p[27]) / ((x[11] ** p[4] + p[3] ** p[4]) * (x[28] ** p[8] + p[7] ** p[8]))
S.loc[8, 44] = -(x[11] ** p[6] * x[28] ** p[10] * x[8] * p[30] * p[28]) / ((x[11] ** p[6] + p[5] ** p[6]) * (x[28] ** p[10] + p[9] ** p[10]))
S.loc[9, 29] = -x[9]
S.loc[10, 43] = k[2] * x[7]
S.loc[10, 56] = x[12] * p[19] * x[7]
S.loc[10, 37] = -x[10]
S.loc[10, 39] = x[20] * k[3]
S.loc[10, 45] = x[25] * k[3]
S.loc[10, 42] = -(x[9] ** p[2] * x[10]) / (x[9] ** p[2] + p[1] ** p[2])
S.loc[10, 36] = -(x[22] ** p[21] * ((p[24] * abs(c[1]) ** p[25]) / (p[26] ** p[25] + abs(c[1]) ** p[25]) - 1)) / (x[22] ** p[21] + p[20] ** p[21])
S.loc[11, 28] = -x[11]
S.loc[12, 15] = x[15]
S.loc[12, 10] = x[16]
S.loc[12, 17] = x[13]
S.loc[12, 14] = -x[12] * p[19]
S.loc[12, 19] = x[17]
S.loc[12, 16] = -(x[25] * x[12]) / v[1]
S.loc[12, 18] = -(x[12] * x[3]) / v[1]
S.loc[13, 16] = (x[25] * x[12]) / v[1]
S.loc[13, 26] = -x[13] * p[19]
S.loc[13, 17] = -x[13]
S.loc[14, 26] = x[13] * p[19]
S.loc[14, 21] = -x[14]
S.loc[14, 20] = (x[20] * x[15]) / v[3]
S.loc[15, 21] = x[14]
S.loc[15, 24] = -x[15]
S.loc[15, 15] = -x[15]
S.loc[15, 14] = x[12] * p[19]
S.loc[15, 23] = x[18]
S.loc[15, 20] = -(x[20] * x[15]) / v[3]
S.loc[15, 22] = -(x[15] * x[19]) / v[3]
S.loc[16, 9] = (x[22] ** p[23]) / (x[22] ** p[23] + p[22] ** p[23])
S.loc[16, 10] = -x[16]
S.loc[17, 18] = (x[12] * x[3]) / v[1]
S.loc[17, 19] = -x[17]
S.loc[17, 27] = -p[19] * x[17]
S.loc[18, 27] = p[19] * x[17]
S.loc[18, 35] = -x[18]
S.loc[18, 23] = -x[18]
S.loc[18, 22] = (x[15] * x[19]) / v[3]
S.loc[19, 51] = x[3]
S.loc[19, 25] = -x[19]
S.loc[19, 23] = x[18]
S.loc[19, 22] = -(x[15] * x[19]) / v[3]
S.loc[20, 21] = x[14]
S.loc[20, 39] = -x[20]
S.loc[20, 20] = -(x[20] * x[15]) / v[3]
S.loc[21, 11] = 1
S.loc[21, 12] = -x[21]
S.loc[21, 13] = x[21] * ((p[35] ** p[15] * p[14]) / (p[35] ** p[15] + p[12] ** p[15]) - 1)
S.loc[22, 38] = -x[22]
S.loc[22, 13] = -x[21] * ((p[35] ** p[15] * p[14]) / (p[35] ** p[15] + p[12] ** p[15]) - 1)
S.loc[23, 33] = -x[23]
S.loc[23, 34] = -x[23]
S.loc[24, 47] = (x[4] * x[3]) / p[34]
S.loc[24, 48] = -x[24]
S.loc[24, 46] = -x[24]
S.loc[25, 17] = x[13]
S.loc[25, 45] = -x[25]
S.loc[25, 16] = -(x[25] * x[12]) / v[1]
S.loc[25, 40] = (x[7] * k[2]) / k[3]
S.loc[25, 41] = (x[11] ** p[4] * x[28] ** p[8] * x[8] * k[1] * p[29] * p[27]) / (k[3] * (x[11] ** p[4] + p[3] ** p[4]) * (x[28] ** p[8] + p[7] ** p[8]))
S.loc[26, 52] = x[1]
S.loc[26, 55] = -x[26]
S.loc[27, 53] = x[1]
S.loc[27, 54] = -x[27]

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


f = open('../text_files/nullsum.txt', 'w')
for i, param in enumerate(null_sum):
    idx = i+1
    expression = str(param)
    flux = flux_map[idx]
    f.write(expression + '\t' +  flux + '\n')
f.close()

