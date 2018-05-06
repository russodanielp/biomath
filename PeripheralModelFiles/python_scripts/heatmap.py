import matplotlib.pyplot as plt
import numpy as np
import matplotlib.colors as mcolors
import seaborn as sns
from sklearn.preprocessing import scale
import pandas as pd
import glob

populations = ['VP0', 'VP1', 'VP2', 'VP3', 'VP4']

population_dfs = []
for pop in populations:
    df = pd.concat([pd.read_csv(f, index_col=0, header=None, sep=' ') for f in glob.glob(r'..\text_files\populations\{}\*.txt'.format(pop))], axis=1)
    population_dfs.append(df.T.astype(float))


vps = pd.concat(population_dfs)

print(vps)
vps = vps.loc[:, vps.var() > 0.00001].drop('compartment', axis=0)

print(vps.iloc[20:40].mean())

control = vps.iloc[:20].mean()
statin = vps.iloc[20:40].mean()
statin_no = vps.iloc[40:60].mean()
al = vps.iloc[60:80].mean()
al_no = vps.iloc[80:].mean()

means = pd.concat([control, statin, statin_no, al, al_no], axis=1).T
means_scaled = scale(means)

print(means)

f, ax = plt.subplots(1, 1, figsize=(13,10))

import matplotlib
# matplotlib.rcParams['text.usetex'] = True
# matplotlib.rcParams['text.latex.unicode'] = Trueplt.savefig('../figures/VP_heatmap.png', transparent=True)

norm = plt.Normalize(-1,1)
cmap = mcolors.LinearSegmentedColormap.from_list("n", sns.color_palette("RdBu_r", 7))

sns.heatmap(means_scaled, cmap=cmap, norm=norm, cbar=False, square=True,
            linecolor='black', linewidths=5, ax=ax,
            cbar_kws={"orientation": "horizontal"})

ax.set_yticks([x + 0.5 for x in np.arange(len(means))])
ax.set_yticklabels(['Control', 'Statin\nResponders', 'Statin\nNon-Responders',
                    'Alirocumab\nResponders', 'Alirocumab\nNon-Responders'], rotation=0, fontsize=20)



ax.set_xticks([x + 0.5 for x in np.arange(len(means.columns))])
ax.set_xticklabels([col for col in means.columns], fontsize=20, rotation=90)
ax.set_xlabel('Average scaled flux values\nby population', fontsize=20)

ax.xaxis.tick_top()
plt.gcf().subplots_adjust(left=0.2, top=0.6)
plt.savefig('../figures/VP_heatmap.png', transparent=True)