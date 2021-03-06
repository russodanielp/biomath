from sympy import sympify

flux_symbols = {
            1:sympify('MAb_PCSK9_kel'),
            2:sympify('MAb_PCSK9_association_rate_k'),
            3:sympify('MAb_PCSK9_association_rate_k')*sympify('MAb_PCSK9_Kd'),
            4:sympify('MAb_kel'),
            5:sympify('Statin_Ka')*sympify('Statin_F'),
            6:sympify('Statin_kel'),
            7:sympify('LDLR_ic_P_production_rate_k'), #7
            8:sympify('LDLR_ic_to_cs_P_trafficking_rate_k'),
            9:sympify('SREBP_ic_P_production_rate_k'),
            10:sympify('SREBP_ic_P_degradation_rate_k'),
            11:sympify('SREBP_ic_to_nu_P_activation_rate_k'),
            12:sympify('LDLR_P_internalization_rate_k'),
            13:sympify('LDLR_P_recycling_rate_k'),
            14:sympify('LDL_LDLR_pl_association_rate_k'),
            15:sympify('LDL_LDLR_pl_association_rate_k')*sympify('LDL_LDLR_pl_Kd'),
            16:sympify('PCSK9_LDLR_pl_association_rate_k'),
            17:sympify('PCSK9_LDLR_pl_association_rate_k')*sympify('PCSK9_LDLR_pl_Kd'), #17
            18:sympify('LDL_LDLR_en_association_rate_k'),
            19:sympify('LDL_LDLR_en_association_rate_k')*sympify('LDL_LDLR_en_Kd'),
            20:sympify('PCSK9_LDLR_en_association_rate_k'),
            21:sympify('PCSK9_LDLR_en_association_rate_k')*sympify('PCSK9_LDLR_en_Kd'), #21
            22:sympify('LDLR_en_P_degradation_rate_k'), # 22
            23:sympify('PCSK9_en_P_degradation_rate_k'),
            24:sympify('LDL_LDLR_P_internalization_rate_k'),
            25:sympify('PC9_LDLR_P_internalization_rate_k'),
            26:sympify('ApoB_pl_clearance_rate_k'),
            27:sympify('ApoA1_pl_clearance_rate_k'),
            28:sympify('PCSK9_pl_clearance_rate_k'), # 28
            29:sympify('Statin_Ka')*(1-sympify('Statin_F')),
            30:sympify('MAb_Ka')*sympify('MAb_F'),
            31:sympify('MAb_Ka')*(1-sympify('MAb_F')),
            32:sympify('PC9_LDLR_en_P_degradation_rate_k'), #32
            33:sympify('Chol_ic_P_production_rate_k'),
            34:sympify('Chol_ic_P_elimination_rate_k'),
            35:sympify('SREBP_nu_P_degradation_rate_k'),
            36:sympify('LDL_en_to_Chol_ic_P_rate_k'),
            37:sympify('VLDL_to_LDL_conversion_rate_k'),
            38:sympify('HDL_to_LDL_exchange_rate_k'), # 38
            39:sympify('Chol_ic_P_to_HDL_pl_rate_k'),
            40:sympify('VLDL_pl_P_uptake_rate_k'),
            41:sympify('HDL_to_VLDL_exchange_rate_k'), # 41
            42:sympify('LDL_pl_LDLRind_P_uptake_rate_k'),
            43:sympify('MAb_PC9_2_kel'),
            44:sympify('MAb_PC9_2_association_rate_k'),
            45:sympify('MAb_PC9_2_association_rate_k')*sympify('MAb_PC9_2_Kd'),
            46:sympify('MAb_dose'),
            47:sympify('Statin_dose'),
            48:sympify('PCSK9_pl_P_uptake_rate_k'),
            49:sympify('Statin_kmet'),
            50:sympify('Statin_pl_to_pc_rate_k'),
            51:sympify('Statin_pc_to_pl_rate_k'),
            52:sympify('StatinM_kel'),
            53:sympify('VLDL_pl_P_LDLRuptake_rate_k')}

metabolite_symbols = {
            1 :  sympify('Statin_pl'),
            2 :  sympify('PCSK9_pl'),
            3 :  sympify('MAb_PCSK9_pl'),
            4 :  sympify('MAb_pl'),
            5 :  sympify('Statin_gi'),
            6 :  sympify('VLDL_pl'),
            7 :  sympify('HDL_pl'),
            8 :  sympify('ApoA1_pl'),
            9 : sympify('Chol_ic_P'),
            10 : sympify('ApoB_pl'),
            11 : sympify('LDLR_cs_P'),
            12 : sympify('LDL_LDLR_cs_P'),
            13 : sympify('LDL_LDLR_en_P'),
            14 : sympify('LDLR_en_P'),
            15 : sympify('LDLR_ic_P'),
            16 : sympify('PC9_LDLR_cs_P'),
            17 : sympify('PC9_LDLR_en_P'),
            18 : sympify('PCSK9_en_P'),
            19 : sympify('LDL_en_P'),
            20 : sympify('SREBP_ic_P'),
            21 : sympify('SREBP_nu_P'),
            22 : sympify('MAb_sc'),
            23 : sympify('MAb_PC9_2_pl'),
            24 : sympify('LDL_pl'),
            25 : sympify('StatinM_pl'),
            26 : sympify('Statin_pc'),
            27 : sympify('CETP_pl'),
}

volume_symbols = {
    1 : sympify('volume_pl'),
    2 : sympify('volume_P'),
    3 : sympify('volume_en_P')
}

k_symbols = {
1 : sympify('chol_per_HDL_particle'),
2 : sympify('chol_per_VLDL_particle'),
3 : sympify('chol_per_LDL_particle'),
}

p_symbols ={

    1 : sympify('ApoA1_RCT_EC50'),
    2 : sympify('ApoA1_RCT_nh'),
    3 : sympify('ApoB_HDL_LDL_EC50'),
    4 : sympify('ApoB_HDL_LDL_nh'),
    5 : sympify('ApoB_HDL_VLDL_EC50'),
    6 : sympify('ApoB_HDL_VLDL_nh'),
    7 : sympify('CETP_HDL_LDL_EC50'),
    8 : sympify('CETP_HDL_LDL_nh'),
    9 : sympify('CETP_HDL_VLDL_EC50'),
    10 :sympify('CETP_HDL_VLDL_nh'),
    11 :sympify('Chol_er_exp'),
    12 :sympify('Chol_er_P_base'),
    13 :sympify('Chol_ic_P_base'),
    14 :sympify('Chol_SREBP_Imax'),
    15 :sympify('Chol_SREBP_nh'),
    16 :sympify('Fibrate_LPL_EC50'),
    17 :sympify('Fibrate_LPL_Emax'),
    18 :sympify('Fibrate_LPL_nh'),
    19 :sympify('LDLR_internalization_fraction_P'),
    20 :sympify('SREBP_Chol_EC50'),
    21 :sympify('SREBP_Chol_nh'),
    22 :sympify('SREBP_LDLR_EC50'),
    23 :sympify('SREBP_LDLR_nh'),
    24 :sympify('Statin_Chol_Imax'),
    25 :sympify('Statin_Chol_nh'),
    26 :sympify('Statin_Chol_P_IC50'),
    27 :sympify('weight_ApoB_HDL_LDL'),
    28 :sympify('weight_ApoB_HDL_VLDL'),
    29 :sympify('weight_CETP_HDL_LDL'),
    30 :sympify('weight_CETP_HDL_VLDL'),
    31 :sympify('convert_nM_to_uM'),
    32 :sympify('Statin_Vd'),
    33 :sympify('StatinM_Vd'),
    34 :sympify('MAb_Vd'),
    35 :sympify('Chol_er_P'),
}

c_symbols = {
      1 : sympify('Conc_Statin'),
      2 : sympify('Conc_Fibrate')
}

all_symbols = [flux_symbols, metabolite_symbols, volume_symbols, p_symbols, k_symbols, c_symbols]
variable_flux_idxs = [7, 17, 21, 22, 28, 32, 38, 41]
coeff = ['a10', 'a12', 'a14', 'a23']
