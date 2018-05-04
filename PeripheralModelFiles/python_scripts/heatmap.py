import matplotlib.pyplot as plt
import numpy as np
import matplotlib.colors as mcolors
import seaborn as sns
from sklearn.preprocessing import scale
import pandas as pd

vps = pd.read_csv('../text_files/virtual_patients.csv', index_col=0).fillna(0)

vps_scld = scale(vps)


f, ax = plt.subplots(1, 1, figsize=(13,10))

import matplotlib
# matplotlib.rcParams['text.usetex'] = True
# matplotlib.rcParams['text.latex.unicode'] = Trueplt.savefig('../figures/VP_heatmap.png', transparent=True)

norm = plt.Normalize(-1,1)
cmap = mcolors.LinearSegmentedColormap.from_list("n", sns.color_palette("RdBu_r", 7))

sns.heatmap(vps_scld, cmap=cmap, norm=norm, cbar=False, square=True,
            linecolor='black', linewidths=0.25, ax=ax,
            cbar_kws={"orientation": "horizontal"})

ax.set_yticks([x + 0.5 for x in np.arange(len(vps))])
ax.set_yticklabels(['VP{}'.format(i) for i in range(len(vps))], rotation=0, fontsize=12)

ax.set_xticks([x + 0.5 for x in np.arange(len(vps.columns))])
ax.set_xticklabels(['$f_{' + str(i) + '}$' for i in range(len(vps.columns))], fontsize=12)

ax.xaxis.tick_top()

