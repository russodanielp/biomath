import pandas as pd

for vp in ['VP0', 'VP1', 'VP2', 'VP3', 'VP4']:
    base_file =  pd.read_csv('../SNL005_{}.txt'.format(vp), sep=' ', index_col=0)

    new_profile = pd.read_csv('../text_files/population_{}.csv'.format(vp), index_col=0)
    good_columns = new_profile.columns[((new_profile.var() > 0.0001) & (new_profile >= 0).all())]

    good_columns = [col for col in good_columns if col != 'PCSK9_LDLR_en_Kd*PCSK9_LDLR_en_association_rate_k']
    print(good_columns)
    for patient, data in new_profile[good_columns].iterrows():
        new_patient = base_file.copy()
        for flux, new_value in data.iteritems():
            new_patient.loc[flux] = new_value

        new_patient.to_csv('../text_files/populations/{}/{}.txt'.format(vp, patient), sep=' ')