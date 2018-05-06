import pandas as pd
import matplotlib.pyplot as plt
from sklearn.preprocessing import scale
from sklearn.decomposition import PCA
import glob

populations = ['VP0', 'VP1', 'VP2', 'VP3', 'VP4']

population_dfs = []
for pop in populations:
    df = pd.concat([pd.read_csv(f, index_col=0, header=None, sep=' ') for f in glob.glob(r'..\text_files\populations\{}\*.txt'.format(pop))], axis=1)
    population_dfs.append(df.T)



vps = pd.concat(population_dfs)


p_components = PCA(2).fit_transform(scale(vps.values))

f, ax = plt.subplots(1)

ax.scatter(p_components[:20, 0], p_components[:20, 1], s=40,
           edgecolor=(0, 0, 0, 1), facecolor=(0, 0, 0, 0.4), label='Control')
ax.scatter(p_components[20:40, 0], p_components[20:40, 1], s=40,
           edgecolor=(0, 0, 0, 1), facecolor=(1, 0, 0, 0.4), label='Statin Responders')
ax.scatter(p_components[40:60, 0], p_components[40:60, 1], s=40,
           edgecolor=(0, 0, 0, 1), facecolor=(0, 1, 0, 0.4), label='Statin Non-Responders')
ax.scatter(p_components[60:80, 0], p_components[60:80, 1], s=40,
           edgecolor=(0, 0, 0, 1), facecolor=(0, 0, 1, 0.4), label='Alirocumab Responders')
ax.scatter(p_components[80:, 0], p_components[80:, 1], s=40,
           edgecolor=(0, 0, 0, 1), facecolor=(1, 0, 1, 0.4), label='Alirocumab Non-Responders')

ax.set_yticks([])
ax.set_xticks([])

ax.set_xlabel('PCA1', fontsize=20)
ax.set_ylabel('PCA2', fontsize=20)

plt.legend()
plt.savefig('../figures/VP_pca.png', transparent=True)
