import pandas as pd
import glob
import matplotlib.pyplot as plt

solutes = ['Conc_LDL', 'Conc_HDL', 'Conc_VLDL',
           'MAb_sc', 'Conc_MAb_Free', 'Conc_PCSK9', 'Conc_ApoA1', 'Conc_ApoB', 'SREBP_nu_P']

populations = ['VP0', 'VP1', 'VP2', 'VP3', 'VP4']
labels = ['Control', 'Statin\nResponders', 'Statin\nNon-Responders',
                    'Alirocumab\nResponders', 'Alirocumab\nNon-Responders']

population_dfs = []
for pop in populations:
    dfs = [pd.read_csv(f, index_col=0, header=None, sep=',').loc[:, [1, 3, 5, 7, 9, 11, 13, 15, 17]]
                    for f in glob.glob(r'..\text_files\VP-csv-files\{}\*.csv'.format(pop))]
    population_dfs.append(dfs)


print()


for j, pop in enumerate(population_dfs):
    f, axarr = plt.subplots(3,3, figsize=(20, 15))
    avgs = sum(pop) / len(pop)
    import numpy as np

    color_list = plt.cm.Set1(np.linspace(0, 1, 9))
    lw=5


    for color in color_list:
        color[3] = 0.8

    for df in pop:
        axarr[0, 0].plot(df.loc[:, 3].index, df.loc[:, 3].values,
                         color=[0, 0, 0, 0.2], label='Conc_LDL', lw=2, ls='--', zorder=0)
        axarr[0, 1].plot(df.loc[:, 3].index, df.loc[:, 3].values,
                         color=[0, 0, 0, 0.2], label='Conc_HDL', lw=2, ls='--', zorder=0)
        axarr[0, 2].plot(df.loc[:, 5].index, df.loc[:, 5].values,
                         color=[0, 0, 0, 0.2], label='Conc_VLDL', lw=2, ls='--', zorder=0)
        axarr[1, 0].plot(df.loc[:, 7].index, df.loc[:, 7].values,
                         color=[0, 0, 0, 0.2], label='MAb_sc', lw=2, ls='--', zorder=0)
        axarr[1, 1].plot(df.loc[:, 9].index, df.loc[:, 9].values,
                         color=[0, 0, 0, 0.2], label='Conc_MAb_Free', lw=2, ls='--', zorder=0)
        axarr[1, 2].plot(df.loc[:, 11].index, df.loc[:, 11].values,
                         color=[0, 0, 0, 0.2], label='Conc_PCSK9', lw=2, ls='--', zorder=0)
        axarr[2, 0].plot(df.loc[:, 13].index, df.loc[:, 13].values,
                         color=[0, 0, 0, 0.2], label='Conc_ApoA1', lw=2, ls='--', zorder=0)
        axarr[2, 1].plot(df.loc[:, 15].index, df.loc[:, 15].values,
                         color=[0, 0, 0, 0.2], label='Conc_ApoB', lw=2, ls='--', zorder=0)
        axarr[2, 2].plot(df.loc[:, 17].index, df.loc[:, 17].values,
                         color=[0, 0, 0, 0.2], label='SREBP_nu_P', lw=2, ls='--', zorder=0)

    axarr[0, 0].plot(avgs.loc[:, 3].index, avgs.loc[:, 3].values,
                     color=color_list[0], label='Conc_LDL', lw=lw, zorder=1)
    axarr[0, 1].plot(avgs.loc[:, 3].index, avgs.loc[:, 3].values,
                     color=color_list[1], label='Conc_HDL', lw=lw, zorder=1)
    axarr[0, 2].plot(avgs.loc[:, 5].index, avgs.loc[:, 5].values,
                     color=color_list[2], label='Conc_VLDL', lw=lw, zorder=1)
    axarr[1, 0].plot(avgs.loc[:, 7].index, avgs.loc[:, 7].values,
                     color=color_list[3], label='MAb_sc', lw=lw, zorder=1)
    axarr[1, 1].plot(avgs.loc[:, 9].index, avgs.loc[:, 9].values,
                     color=color_list[4], label='Conc_MAb_Free', lw=lw, zorder=1)
    axarr[1, 2].plot(avgs.loc[:, 11].index, avgs.loc[:, 11].values,
                     color=color_list[5], label='Conc_PCSK9', lw=lw, zorder=1)
    axarr[2, 0].plot(avgs.loc[:, 13].index, avgs.loc[:, 13].values,
                     color=color_list[6], label='Conc_ApoA1', lw=lw, zorder=1)
    axarr[2, 1].plot(avgs.loc[:, 15].index, avgs.loc[:, 15].values,
                     color=color_list[7], label='Conc_ApoB', lw=lw, zorder=1)
    axarr[2, 2].plot(avgs.loc[:, 17].index, avgs.loc[:, 17].values,
                     color=color_list[8], label='SREBP_nu_P', lw=lw, zorder=1)

    i = 0
    for ax in axarr.flatten():
        ax.set_facecolor((0, 0, 0, 0.2))
        ax.set_ylabel('[{}]'.format(solutes[i].replace('_', ' ')), fontsize=20)
        for tick in ax.yaxis.get_major_ticks():
            tick.label.set_fontsize(18)
        for tick in ax.xaxis.get_major_ticks():
            tick.label.set_fontsize(18)
        i = i + 1

    for row in [0, 1]:
        for ax in axarr[row, :]:
            ax.set_xticks([])

    axarr[2, 1].set_xlabel('Time', fontsize=22)
    plt.gcf().subplots_adjust(hspace=0.01, wspace=0.3)
    plt.suptitle(labels[j], fontsize=25)

    plt.savefig('../figures/{}_plot.png'.format(populations[j]), transparent=True)