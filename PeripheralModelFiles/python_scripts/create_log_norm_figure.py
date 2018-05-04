import matplotlib.pyplot as plt
from scipy.stats import lognorm
import numpy as np


f, ax = plt.subplots(1)
s = 0.954
rv = lognorm(scale=np.exp(0), s=0.6)
x = np.linspace(0, lognorm.ppf(0.99, s), 1000)

x_25_975 = np.linspace(lognorm.ppf(0.025, s), lognorm.ppf(0.975, s), 1000)

ax.plot(x, rv.pdf(x), 'k-', lw=2, label='pdf')
ax.plot(x_25_975, rv.pdf(x_25_975), 'r-', lw=5, alpha=0.6, label='2.5%-97.5%')


ax.hist(rv.rvs(size=1000), normed=True, histtype='stepfilled',
        facecolor=(0, 0, 1, 0.2), edgecolor=(0, 0, 0, 1), bins=50)

initial_cost_step = lognorm.ppf(0.025, s)
final_cost_step = lognorm.ppf(0.975, s)

for step in np.linspace(lognorm.ppf(0.025, s), lognorm.ppf(0.975, s), 10):
    ax.plot([step, step], [-0.01, 0.01], 'k', lw=3)

ax.set_xticks([])

ax.set_yticks([0, 0.2, 0.4, 0.6, 0.8])
ax.set_yticklabels([0, 0.2, 0.4, 0.6, 0.8], fontsize=12)

ax.set_ylabel('Frequency', fontsize=20)
ax.set_xlabel('$a$', fontsize=20)

plt.suptitle('lognormal distribution')

plt.legend()
plt.savefig('../figures/lognormal_distribution.png', transparent=True)
