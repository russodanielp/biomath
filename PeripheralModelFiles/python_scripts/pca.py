import pandas as pd
import matplotlib.pyplot as plt
from sklearn.preprocessing import scale
from sklearn.decomposition import PCA

vps = pd.read_csv('../text_files/virtual_patients.csv', index_col=0).fillna(0)
print(vps)
p_components = PCA(2).fit_transform(scale(vps.values))

f, ax = plt.subplots(1)

ax.scatter(p_components[:, 0], p_components[:, 1], s=40,
           edgecolor=(0, 0, 0, 1), facecolor=(0, 0, 0, 0.4))

ax.set_yticks([])
ax.set_xticks([])

ax.set_xlabel('PCA1', fontsize=20)
ax.set_ylabel('PCA2', fontsize=20)

plt.savefig('../figures/VP_pca.png', transparent=True)
