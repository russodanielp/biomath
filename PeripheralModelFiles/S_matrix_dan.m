%{
d(Statin_pl)/dt = 1/compartment*(ReactionFlux6 - ReactionFlux7 - ReactionFlux57 - ReactionFlux58 + ReactionFlux59)
d(Time_Sim)/dt = 1/compartment*(ReactionFlux1)
d(PCSK9_pl)/dt = 1/compartment*(-ReactionFlux2 + ReactionFlux4 - ReactionFlux16 + ReactionFlux20 - ReactionFlux29 - ReactionFlux52 + ReactionFlux53 - ReactionFlux56)
d(MAb_PCSK9_pl)/dt = 1/compartment*(ReactionFlux2 - ReactionFlux3 - ReactionFlux4 - ReactionFlux52 + ReactionFlux53)
d(MAb_pl)/dt = 1/compartment*(-ReactionFlux2 + ReactionFlux4 - ReactionFlux5 + ReactionFlux31)
d(Statin_gi)/dt = 1/compartment*(-ReactionFlux6 - ReactionFlux30 + ReactionFlux55)
d(VLDL_pl)/dt = 1/compartment*(-ReactionFlux39 - ReactionFlux45 + ReactionFlux48)
d(HDL_pl)/dt = 1/compartment*(-ReactionFlux41 + ReactionFlux44 - ReactionFlux47)
d(ApoA1_pl)/dt = 1/compartment*(-ReactionFlux28)
d(Chol_ic_P)/dt = 1/compartment*(ReactionFlux34 - ReactionFlux35 + ReactionFlux38 - ReactionFlux43 + ReactionFlux46 + ReactionFlux50)
d(ApoB_pl)/dt = 1/compartment*(-ReactionFlux27)
d(LDLR_cs_P)/dt = 1/compartment*(ReactionFlux9 - ReactionFlux13 + ReactionFlux14 - ReactionFlux15 - ReactionFlux16 + ReactionFlux19 + ReactionFlux20)
d(LDL_LDLR_cs_P)/dt = 1/compartment*(ReactionFlux15 - ReactionFlux19 - ReactionFlux25)
d(LDL_LDLR_en_P)/dt = 1/compartment*(ReactionFlux17 - ReactionFlux21 + ReactionFlux25)
d(LDLR_en_P)/dt = 1/compartment*(ReactionFlux13 - ReactionFlux14 - ReactionFlux17 - ReactionFlux18 + ReactionFlux21 + ReactionFlux22 - ReactionFlux23)
d(LDLR_ic_P)/dt = 1/compartment*(ReactionFlux8 - ReactionFlux9)
d(PC9_LDLR_cs_P)/dt = 1/compartment*(ReactionFlux16 - ReactionFlux20 - ReactionFlux26)
d(PC9_LDLR_en_P)/dt = 1/compartment*(ReactionFlux18 - ReactionFlux22 + ReactionFlux26 - ReactionFlux33)
d(PCSK9_en_P)/dt = 1/compartment*(-ReactionFlux18 + ReactionFlux22 - ReactionFlux24 + ReactionFlux56)
d(LDL_en_P)/dt = 1/compartment*(-ReactionFlux17 + ReactionFlux21 - ReactionFlux37)
d(SREBP_ic_P)/dt = 1/compartment*(ReactionFlux10 - ReactionFlux11 - ReactionFlux12)
d(SREBP_nu_P)/dt = 1/compartment*(ReactionFlux12 - ReactionFlux36)
d(MAb_sc)/dt = 1/compartment*(-ReactionFlux31 - ReactionFlux32 + ReactionFlux54)
d(MAb_PC9_2_pl)/dt = 1/compartment*(-ReactionFlux51 + ReactionFlux52 - ReactionFlux53)
d(LDL_pl)/dt = 1/compartment*(-ReactionFlux15 + ReactionFlux19 + ReactionFlux40 + ReactionFlux42 - ReactionFlux49)
d(StatinM_pl)/dt = 1/compartment*(ReactionFlux57 - ReactionFlux60)
d(Statin_pc)/dt = 1/compartment*(ReactionFlux58 - ReactionFlux59)
%}

%{
ReactionFlux1 = Time_Sim_production_rate_k
ReactionFlux2 = MAb_PCSK9_association_rate_k*(MAb_pl/MAb_Vd)*(PCSK9_pl/volume_pl)*volume_pl
ReactionFlux3 = MAb_PCSK9_kel*MAb_PCSK9_pl
ReactionFlux4 = MAb_PCSK9_association_rate_k*MAb_PCSK9_Kd*MAb_PCSK9_pl
ReactionFlux5 = MAb_kel*MAb_pl
ReactionFlux6 = Statin_Ka*Statin_F*Statin_gi
ReactionFlux7 = Statin_kel*Statin_pl
ReactionFlux8 = LDLR_ic_P_production_rate_k*power(SREBP_nu_P,SREBP_LDLR_nh)/(power(SREBP_LDLR_EC50,SREBP_LDLR_nh)+power(SREBP_nu_P,SREBP_LDLR_nh))
ReactionFlux9 = LDLR_ic_to_cs_P_trafficking_rate_k*LDLR_ic_P
ReactionFlux10 = SREBP_ic_P_production_rate_k
ReactionFlux11 = SREBP_ic_P_degradation_rate_k*SREBP_ic_P
ReactionFlux12 = SREBP_ic_to_nu_P_activation_rate_k*SREBP_ic_P*(1-Chol_SREBP_Imax*power(Chol_er_P,Chol_SREBP_nh)/(power(Chol_er_P_base,Chol_SREBP_nh)+power(Chol_er_P,Chol_SREBP_nh)))
ReactionFlux13 = LDLR_P_internalization_rate_k*LDLR_internalization_fraction_P*LDLR_cs_P
ReactionFlux14 = LDLR_P_recycling_rate_k*LDLR_en_P
ReactionFlux15 = LDL_LDLR_pl_association_rate_k*(LDL_pl/volume_pl)*(LDLR_cs_P/volume_P)*volume_P
ReactionFlux16 = PCSK9_LDLR_pl_association_rate_k*(PCSK9_pl/volume_pl)*(LDLR_cs_P/volume_P)*volume_P
ReactionFlux17 = LDL_LDLR_en_association_rate_k*(LDL_en_P/volume_en_P)*(LDLR_en_P/volume_en_P)*volume_en_P
ReactionFlux18 = PCSK9_LDLR_en_association_rate_k*(PCSK9_en_P/volume_en_P)*(LDLR_en_P/volume_en_P)*volume_en_P
ReactionFlux19 = LDL_LDLR_pl_association_rate_k*LDL_LDLR_pl_Kd*LDL_LDLR_cs_P
ReactionFlux20 = PCSK9_LDLR_pl_association_rate_k*PCSK9_LDLR_pl_Kd*PC9_LDLR_cs_P
ReactionFlux21 = LDL_LDLR_en_association_rate_k*LDL_LDLR_en_Kd*LDL_LDLR_en_P
ReactionFlux22 = PCSK9_LDLR_en_association_rate_k*PCSK9_LDLR_en_Kd*PC9_LDLR_en_P
ReactionFlux23 = LDLR_en_P_degradation_rate_k*LDLR_en_P
ReactionFlux24 = PCSK9_en_P_degradation_rate_k*PCSK9_en_P
ReactionFlux25 = LDL_LDLR_P_internalization_rate_k*LDLR_internalization_fraction_P*LDL_LDLR_cs_P
ReactionFlux26 = PC9_LDLR_P_internalization_rate_k*LDLR_internalization_fraction_P*PC9_LDLR_cs_P
ReactionFlux27 = ApoB_pl_clearance_rate_k*ApoB_pl
ReactionFlux28 = ApoA1_pl_clearance_rate_k*ApoA1_pl
ReactionFlux29 = PCSK9_pl_clearance_rate_k*PCSK9_pl
ReactionFlux30 = Statin_Ka*(1-Statin_F)*Statin_gi
ReactionFlux31 = MAb_Ka*MAb_F*MAb_sc
ReactionFlux32 = MAb_Ka*(1-MAb_F)*MAb_sc
ReactionFlux33 = PC9_LDLR_en_P_degradation_rate_k*PC9_LDLR_en_P
ReactionFlux34 = Chol_ic_P_production_rate_k*power(SREBP_nu_P,SREBP_Chol_nh)/(power(SREBP_Chol_EC50,SREBP_Chol_nh)+power(SREBP_nu_P,SREBP_Chol_nh))*(1-Statin_Chol_Imax*power(abs(Conc_Statin),Statin_Chol_nh)/(power(Statin_Chol_P_IC50,Statin_Chol_nh)+power(abs(Conc_Statin),Statin_Chol_nh)))
ReactionFlux35 = Chol_ic_P_elimination_rate_k*Chol_ic_P
ReactionFlux36 = SREBP_nu_P_degradation_rate_k*SREBP_nu_P
ReactionFlux37 = LDL_en_to_Chol_ic_P_rate_k*LDL_en_P
ReactionFlux38 = LDL_en_to_Chol_ic_P_rate_k*LDL_en_P*chol_per_LDL_particle
ReactionFlux39 = VLDL_to_LDL_conversion_rate_k*VLDL_pl*(1+Fibrate_LPL_Emax*power(Conc_Fibrate,Fibrate_LPL_nh)/(power(Fibrate_LPL_EC50,Fibrate_LPL_nh)+power(Conc_Fibrate,Fibrate_LPL_nh)))
ReactionFlux40 = VLDL_to_LDL_conversion_rate_k*VLDL_pl*chol_per_VLDL_particle/chol_per_LDL_particle
ReactionFlux41 = HDL_to_LDL_exchange_rate_k*HDL_pl*(weight_ApoB_HDL_LDL*power(ApoB_pl,ApoB_HDL_LDL_nh)/(power(ApoB_HDL_LDL_EC50,ApoB_HDL_LDL_nh)+power(ApoB_pl,ApoB_HDL_LDL_nh)))*(weight_CETP_HDL_LDL*power(CETP_pl,CETP_HDL_LDL_nh)/(power(CETP_HDL_LDL_EC50,CETP_HDL_LDL_nh)+power(CETP_pl,CETP_HDL_LDL_nh)))
ReactionFlux42 = HDL_to_LDL_exchange_rate_k*HDL_pl*chol_per_HDL_particle/chol_per_LDL_particle*(weight_ApoB_HDL_LDL*power(ApoB_pl,ApoB_HDL_LDL_nh)/(power(ApoB_HDL_LDL_EC50,ApoB_HDL_LDL_nh)+power(ApoB_pl,ApoB_HDL_LDL_nh)))*(weight_CETP_HDL_LDL*power(CETP_pl,CETP_HDL_LDL_nh)/(power(CETP_HDL_LDL_EC50,CETP_HDL_LDL_nh)+power(CETP_pl,CETP_HDL_LDL_nh)))
ReactionFlux43 = Chol_ic_P_to_HDL_pl_rate_k*Chol_ic_P*power(ApoA1_pl,ApoA1_RCT_nh)/(power(ApoA1_RCT_EC50,ApoA1_RCT_nh)+power(ApoA1_pl,ApoA1_RCT_nh))
ReactionFlux44 = Chol_ic_P_to_HDL_pl_rate_k*Chol_ic_P/chol_per_HDL_particle*power(ApoA1_pl,ApoA1_RCT_nh)/(power(ApoA1_RCT_EC50,ApoA1_RCT_nh)+power(ApoA1_pl,ApoA1_RCT_nh))
ReactionFlux45 = VLDL_pl_P_uptake_rate_k*VLDL_pl+VLDL_pl_P_LDLRuptake_rate_k*LDLR_internalization_fraction_P*VLDL_pl*LDLR_cs_P
ReactionFlux46 = (VLDL_pl_P_uptake_rate_k*VLDL_pl+VLDL_pl_P_LDLRuptake_rate_k*LDLR_internalization_fraction_P*VLDL_pl*LDLR_cs_P)*chol_per_VLDL_particle
ReactionFlux47 = HDL_to_VLDL_exchange_rate_k*HDL_pl*(weight_ApoB_HDL_VLDL*power(ApoB_pl,ApoB_HDL_VLDL_nh)/(power(ApoB_HDL_VLDL_EC50,ApoB_HDL_VLDL_nh)+power(ApoB_pl,ApoB_HDL_VLDL_nh)))*(weight_CETP_HDL_VLDL*power(CETP_pl,CETP_HDL_VLDL_nh)/(power(CETP_HDL_VLDL_EC50,CETP_HDL_VLDL_nh)+power(CETP_pl,CETP_HDL_VLDL_nh)))
ReactionFlux48 = HDL_to_VLDL_exchange_rate_k*HDL_pl*chol_per_HDL_particle/chol_per_VLDL_particle*(weight_ApoB_HDL_VLDL*power(ApoB_pl,ApoB_HDL_VLDL_nh)/(power(ApoB_HDL_VLDL_EC50,ApoB_HDL_VLDL_nh)+power(ApoB_pl,ApoB_HDL_VLDL_nh)))*(weight_CETP_HDL_VLDL*power(CETP_pl,CETP_HDL_VLDL_nh)/(power(CETP_HDL_VLDL_EC50,CETP_HDL_VLDL_nh)+power(CETP_pl,CETP_HDL_VLDL_nh)))
ReactionFlux49 = LDL_pl_LDLRind_P_uptake_rate_k*LDL_pl
ReactionFlux50 = LDL_pl_LDLRind_P_uptake_rate_k*LDL_pl*chol_per_LDL_particle
ReactionFlux51 = MAb_PC9_2_kel*MAb_PC9_2_pl
ReactionFlux52 = MAb_PC9_2_association_rate_k*(MAb_PCSK9_pl/MAb_Vd)*(PCSK9_pl/volume_pl)*volume_pl
ReactionFlux53 = MAb_PC9_2_association_rate_k*MAb_PC9_2_Kd*MAb_PC9_2_pl
ReactionFlux54 = piecewise(0,or(eq(MAb_dose_amount,0),ge(floor((Time_Sim-MAb_dose_start)/MAb_dose_interval),MAb_dose_cycles)),MAb_dose_amount/MAb_MW/convert_nmol_to_mmol/MAb_dose_duration,and(ge(Time_Sim,MAb_dose_start+ge(Time_Sim,MAb_dose_start)*floor((Time_Sim-MAb_dose_start)/MAb_dose_interval)*MAb_dose_interval),lt(Time_Sim,MAb_dose_start+MAb_dose_duration+ge(Time_Sim,MAb_dose_start)*floor((Time_Sim-MAb_dose_start)/MAb_dose_interval)*MAb_dose_interval)),0)+piecewise(0,or(eq(MAb_doseX_amount,0),ge(floor((Time_Sim-MAb_doseX_start)/MAb_doseX_interval),MAb_doseX_cycles)),MAb_doseX_amount/MAb_MW/convert_nmol_to_mmol/MAb_doseX_duration,and(ge(Time_Sim,MAb_doseX_start+ge(Time_Sim,MAb_doseX_start)*floor((Time_Sim-MAb_doseX_start)/MAb_doseX_interval)*MAb_doseX_interval),lt(Time_Sim,MAb_doseX_start+MAb_doseX_duration+ge(Time_Sim,MAb_doseX_start)*floor((Time_Sim-MAb_doseX_start)/MAb_doseX_interval)*MAb_doseX_interval)),0)
ReactionFlux55 = piecewise(0,or(eq(Statin_dose_amount,0),ge(floor((Time_Sim-Statin_dose_start)/Statin_dose_interval),Statin_dose_cycles)),Statin_dose_amount/Statin_MW/convert_nmol_to_mmol/Statin_dose_duration,and(ge(Time_Sim,Statin_dose_start+ge(Time_Sim,Statin_dose_start)*floor((Time_Sim-Statin_dose_start)/Statin_dose_interval)*Statin_dose_interval),lt(Time_Sim,Statin_dose_start+Statin_dose_duration+ge(Time_Sim,Statin_dose_start)*floor((Time_Sim-Statin_dose_start)/Statin_dose_interval)*Statin_dose_interval)),0)+piecewise(0,or(eq(Statin_doseX_amount,0),ge(floor((Time_Sim-Statin_doseX_start)/Statin_doseX_interval),Statin_doseX_cycles)),Statin_doseX_amount/Statin_MW/convert_nmol_to_mmol/Statin_doseX_duration,and(ge(Time_Sim,Statin_doseX_start+ge(Time_Sim,Statin_doseX_start)*floor((Time_Sim-Statin_doseX_start)/Statin_doseX_interval)*Statin_doseX_interval),lt(Time_Sim,Statin_doseX_start+Statin_doseX_duration+ge(Time_Sim,Statin_doseX_start)*floor((Time_Sim-Statin_doseX_start)/Statin_doseX_interval)*Statin_doseX_interval)),0)
ReactionFlux56 = PCSK9_pl_P_uptake_rate_k*PCSK9_pl
ReactionFlux57 = Statin_kmet*Statin_pl
ReactionFlux58 = Statin_pl_to_pc_rate_k*Statin_pl
ReactionFlux59 = Statin_pc_to_pl_rate_k*Statin_pc
ReactionFlux60 = StatinM_kel*StatinM_pl
%}


Statin_pl = 0;
Time_Sim = 0;
PCSK9_pl = 12.45;
MAb_PCSK9_pl = 0;
MAb_pl = 0;
Statin_gi = 0;
VLDL_pl = 1021.7;
HDL_pl = 43765.0;
ApoA1_pl = 156302.521008403;
Chol_ic_P = 1.70764290634856E8;
ApoB_pl = 6680.42372047905;
LDLR_cs_P = 1.35;
LDL_LDLR_cs_P = 1.66;
LDL_LDLR_en_P = 0.0718;
LDLR_en_P = 3.48233416154161;
LDLR_ic_P = 1.16308201158982;
PC9_LDLR_cs_P = 0.0164;
PC9_LDLR_en_P = 0.590933112638101;
PCSK9_en_P = 0.042;
LDL_en_P = 1.66;
SREBP_ic_P = 10.5233873794404;
SREBP_nu_P = 0.472283616230589;
MAb_sc = 0.0;
MAb_PC9_2_pl = 0.0;
LDL_pl = 6833.9;
StatinM_pl = 0.0;
Statin_pc = 0.0;

x = [Statin_pl Time_Sim PCSK9_pl MAb_PCSK9_pl MAb_pl Statin_gi VLDL_pl ...
    HDL_pl ApoA1_pl Chol_ic_P ApoB_pl LDLR_cs_P LDL_LDLR_cs_P LDL_LDLR_en_P ...
    LDLR_en_P LDLR_ic_P PC9_LDLR_cs_P PC9_LDLR_en_P PCSK9_en_P LDL_en_P ...
    SREBP_ic_P SREBP_nu_P MAb_sc MAb_PC9_2_pl LDL_pl StatinM_pl Statin_pc]; 


s1 = 1;
s2 = (MAb_pl/MAb_Vd)*(PCSK9_pl/volume_pl)*volume_pl;
s3 = MAb_PCSK9_pl;
s4 = MAb_PCSK9_Kd*MAb_PCSK9_pl;
s5 = MAb_pl;
s6 = Statin_gi;
s7 = Statin_pl;
s8 = power(SREBP_nu_P,SREBP_LDLR_nh)/(power(SREBP_LDLR_EC50,SREBP_LDLR_nh)+power(SREBP_nu_P,SREBP_LDLR_nh));
s9 = LDLR_ic_P;
s10 = 1;
s11 = SREBP_ic_P;
s12 = SREBP_ic_P*(1-Chol_SREBP_Imax*power(Chol_er_P,Chol_SREBP_nh)/(power(Chol_er_P_base,Chol_SREBP_nh)+power(Chol_er_P,Chol_SREBP_nh)));
s13 = LDLR_internalization_fraction_P*LDLR_cs_P;
s14 = LDLR_en_P;
s15 = (LDL_pl/volume_pl)*(LDLR_cs_P/volume_P)*volume_P;
s16 = (PCSK9_pl/volume_pl)*(LDLR_cs_P/volume_P)*volume_P;
s17 = (LDL_en_P/volume_en_P)*(LDLR_en_P/volume_en_P)*volume_en_P;
s18 = (PCSK9_en_P/volume_en_P)*(LDLR_en_P/volume_en_P)*volume_en_P;
s19 = LDL_LDLR_cs_P;
s20 = PC9_LDLR_cs_P;
s21 = LDL_LDLR_en_P;
s22 = PC9_LDLR_en_P;
s23 = LDLR_en_P;
s24 = PCSK9_en_P;
s25 = LDL_LDLR_cs_P;
s26 = PC9_LDLR_cs_P;
s27 = ApoB_pl;
s28 = ApoA1_pl;
s29 = PCSK9_pl;
s30 = Statin_gi;
s31 = MAb_sc;
s32 = MAb_sc;
s33 = PC9_LDLR_en_P;
s34 = power(SREBP_nu_P,SREBP_Chol_nh)/(power(SREBP_Chol_EC50,SREBP_Chol_nh)+power(SREBP_nu_P,SREBP_Chol_nh))*(1-Statin_Chol_Imax*power(abs(Conc_Statin),Statin_Chol_nh)/(power(Statin_Chol_P_IC50,Statin_Chol_nh)+power(abs(Conc_Statin),Statin_Chol_nh)));
s35 = Chol_ic_P;
s36 = SREBP_nu_P;
s37 = LDL_en_P;
s38 = LDL_en_P*chol_per_LDL_particle;
s39 = VLDL_pl*(1+Fibrate_LPL_Emax*power(Conc_Fibrate,Fibrate_LPL_nh)/(power(Fibrate_LPL_EC50,Fibrate_LPL_nh)+power(Conc_Fibrate,Fibrate_LPL_nh)));
s40 = VLDL_pl*chol_per_VLDL_particle/chol_per_LDL_particle;
s41 = HDL_pl*(weight_ApoB_HDL_LDL*power(ApoB_pl,ApoB_HDL_LDL_nh)/(power(ApoB_HDL_LDL_EC50,ApoB_HDL_LDL_nh)+power(ApoB_pl,ApoB_HDL_LDL_nh)))*(weight_CETP_HDL_LDL*power(CETP_pl,CETP_HDL_LDL_nh)/(power(CETP_HDL_LDL_EC50,CETP_HDL_LDL_nh)+power(CETP_pl,CETP_HDL_LDL_nh)));
s42 = HDL_pl*chol_per_HDL_particle/chol_per_LDL_particle*(weight_ApoB_HDL_LDL*power(ApoB_pl,ApoB_HDL_LDL_nh)/(power(ApoB_HDL_LDL_EC50,ApoB_HDL_LDL_nh)+power(ApoB_pl,ApoB_HDL_LDL_nh)))*(weight_CETP_HDL_LDL*power(CETP_pl,CETP_HDL_LDL_nh)/(power(CETP_HDL_LDL_EC50,CETP_HDL_LDL_nh)+power(CETP_pl,CETP_HDL_LDL_nh)));
s43 = Chol_ic_P*power(ApoA1_pl,ApoA1_RCT_nh)/(power(ApoA1_RCT_EC50,ApoA1_RCT_nh)+power(ApoA1_pl,ApoA1_RCT_nh));
s44 = Chol_ic_P/chol_per_HDL_particle*power(ApoA1_pl,ApoA1_RCT_nh)/(power(ApoA1_RCT_EC50,ApoA1_RCT_nh)+power(ApoA1_pl,ApoA1_RCT_nh));
s45 = VLDL_pl+VLDL_pl_P_LDLRuptake_rate_k*LDLR_internalization_fraction_P*VLDL_pl*LDLR_cs_P; %%%%%%%%%%%%%
s46 = (VLDL_pl_P_uptake_rate_k*VLDL_pl+VLDL_pl_P_LDLRuptake_rate_k*LDLR_internalization_fraction_P*VLDL_pl*LDLR_cs_P)*chol_per_VLDL_particle; %%%%%%%%%%%
s47 = HDL_to_VLDL_exchange_rate_k*HDL_pl*(weight_ApoB_HDL_VLDL*power(ApoB_pl,ApoB_HDL_VLDL_nh)/(power(ApoB_HDL_VLDL_EC50,ApoB_HDL_VLDL_nh)+power(ApoB_pl,ApoB_HDL_VLDL_nh)))*(weight_CETP_HDL_VLDL*power(CETP_pl,CETP_HDL_VLDL_nh)/(power(CETP_HDL_VLDL_EC50,CETP_HDL_VLDL_nh)+power(CETP_pl,CETP_HDL_VLDL_nh))); %%%%%%%
s48 = HDL_to_VLDL_exchange_rate_k*HDL_pl*chol_per_HDL_particle/chol_per_VLDL_particle*(weight_ApoB_HDL_VLDL*power(ApoB_pl,ApoB_HDL_VLDL_nh)/(power(ApoB_HDL_VLDL_EC50,ApoB_HDL_VLDL_nh)+power(ApoB_pl,ApoB_HDL_VLDL_nh)))*(weight_CETP_HDL_VLDL*power(CETP_pl,CETP_HDL_VLDL_nh)/(power(CETP_HDL_VLDL_EC50,CETP_HDL_VLDL_nh)+power(CETP_pl,CETP_HDL_VLDL_nh))); %%%%%%%%%%
s49 = LDL_pl;
s50 = LDL_pl*chol_per_LDL_particle;
s51 = MAb_PC9_2_pl;
s52 = (MAb_PCSK9_pl/MAb_Vd)*(PCSK9_pl/volume_pl)*volume_pl;
s53 = MAb_PC9_2_Kd*MAb_PC9_2_pl;
s54 = piecewise(0,or(eq(MAb_dose_amount,0),ge(floor((Time_Sim-MAb_dose_start)/MAb_dose_interval),MAb_dose_cycles)),MAb_dose_amount/MAb_MW/convert_nmol_to_mmol/MAb_dose_duration,and(ge(Time_Sim,MAb_dose_start+ge(Time_Sim,MAb_dose_start)*floor((Time_Sim-MAb_dose_start)/MAb_dose_interval)*MAb_dose_interval),lt(Time_Sim,MAb_dose_start+MAb_dose_duration+ge(Time_Sim,MAb_dose_start)*floor((Time_Sim-MAb_dose_start)/MAb_dose_interval)*MAb_dose_interval)),0)+piecewise(0,or(eq(MAb_doseX_amount,0),ge(floor((Time_Sim-MAb_doseX_start)/MAb_doseX_interval),MAb_doseX_cycles)),MAb_doseX_amount/MAb_MW/convert_nmol_to_mmol/MAb_doseX_duration,and(ge(Time_Sim,MAb_doseX_start+ge(Time_Sim,MAb_doseX_start)*floor((Time_Sim-MAb_doseX_start)/MAb_doseX_interval)*MAb_doseX_interval),lt(Time_Sim,MAb_doseX_start+MAb_doseX_duration+ge(Time_Sim,MAb_doseX_start)*floor((Time_Sim-MAb_doseX_start)/MAb_doseX_interval)*MAb_doseX_interval)),0);
s55 = piecewise(0,or(eq(Statin_dose_amount,0),ge(floor((Time_Sim-Statin_dose_start)/Statin_dose_interval),Statin_dose_cycles)),Statin_dose_amount/Statin_MW/convert_nmol_to_mmol/Statin_dose_duration,and(ge(Time_Sim,Statin_dose_start+ge(Time_Sim,Statin_dose_start)*floor((Time_Sim-Statin_dose_start)/Statin_dose_interval)*Statin_dose_interval),lt(Time_Sim,Statin_dose_start+Statin_dose_duration+ge(Time_Sim,Statin_dose_start)*floor((Time_Sim-Statin_dose_start)/Statin_dose_interval)*Statin_dose_interval)),0)+piecewise(0,or(eq(Statin_doseX_amount,0),ge(floor((Time_Sim-Statin_doseX_start)/Statin_doseX_interval),Statin_doseX_cycles)),Statin_doseX_amount/Statin_MW/convert_nmol_to_mmol/Statin_doseX_duration,and(ge(Time_Sim,Statin_doseX_start+ge(Time_Sim,Statin_doseX_start)*floor((Time_Sim-Statin_doseX_start)/Statin_doseX_interval)*Statin_doseX_interval),lt(Time_Sim,Statin_doseX_start+Statin_doseX_duration+ge(Time_Sim,Statin_doseX_start)*floor((Time_Sim-Statin_doseX_start)/Statin_doseX_interval)*Statin_doseX_interval)),0);
s56 = PCSK9_pl;
s57 = Statin_pl;
s58 = Statin_pl;
s59 = Statin_pc;
s60 = StatinM_pl;

% ODEs

S = zeros(27,60)
S(1,6) = s6; % d(Statin_pl)/dt = 1/compartment*(ReactionFlux6 - ReactionFlux7 - ReactionFlux57 - ReactionFlux58 + ReactionFlux59)
S(1,7) = -s7;
S(1,57) = -s57;
S(1,58) = -s58;
S(1,59) = s59;
S(2,1) = s1; % d(Time_Sim)/dt = 1/compartment*(ReactionFlux1)
S(3,2) = -s2; % d(PCSK9_pl)/dt = 1/compartment*(-ReactionFlux2 + ReactionFlux4 - ReactionFlux16 + ReactionFlux20 - ReactionFlux29 - ReactionFlux52 + ReactionFlux53 - ReactionFlux56)
S(3,4) = s4; 
S(3,16) = -s16;
S(3,20) = s20;
S(3,29) = -s29;
S(3,52) = -s52;
S(3,53) = s53;
S(3,53) = -s56;
S(5,2) = s2;
S(5,3) = -s3;
S(5,4) = -s4;
S(5,52) = -s52;
S(5,53) = s53;
S(6,2) = -s2; 
S(6,4) = s4;
S(6,5) = -s5;
S(6,31) = s31;
S(7,6) = -s6;
S(7,30) = -s30;
S(7,55) = s55;
S(8,39) = -s39; 
S(8,45) = -s45;
S(8,48) = s48;
S(9,48) = -s41; 
S(9,44) = s44;
S(9,47) = -s47;
S(10,28) = -s28;
S(11,34) = s34;
S(11,35) = -s35;
S(11,38) = s38;
S(11,43) = -s43;
S(11,46) = s46;
S(11,50) = s50;
S(12,27) = -s27;
S(13,9) = s9;
S(13,13) = -s13;
S(13,14) = s14;
S(13,15) = -s15;
S(13,16) = -s16;
S(13,19) = s19;
S(13,20) = s20;
S(14,15) = s15;
S(14,19) = -s19;
S(14,25) = -s25;
S(15,17) = s17;
S(15,21) = -s21;
S(15,25) = s25;
S(16,13) = s13;
S(16,14) = -s14;
S(16,17) = -s17;
S(16,18) = -s18;
S(16,21) = s21;
S(16,22) = s22;
S(16,23) = -s23;
S(17,8) = s8;
S(17,9) = -s9;
S(18,16) = s16;
S(18,20) = -s20;
S(18,26) = -s26;
S(19,18) = s18;
S(19,22) = -s22;
S(19,26) = s26;
S(19,33) = -s33;
S(20,18) = -s18;
S(20,22) = s22;
S(20,24) = -s24;
S(20,56) = s56;
S(21,17) = -s17;
S(21,21) = s21;
S(21,37) = -s37;
S(22,10) = s10;
S(22,11) = -s11;
S(22,12) = -s12;
S(23,12) = s12;
S(23,36) = s36;
S(24,31) = -s31;
S(24,32) = -s32;
S(24,54) = s54;
S(25,51) = -s51;
S(25,52) = s52;
S(25,53) = -s53;
S(26,15) = -s15;
S(26,19) = s19;
S(26,40) = s40;
S(26,42) = s42;
S(26,49) = -s49;
S(27,57) = s57;
S(27,60) = -s60;
S(28,58) = s58;
S(28,59) = -s59;













