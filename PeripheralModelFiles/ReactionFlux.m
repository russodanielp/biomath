%%     Fluxes:
     ReactionFlux1 = sym('Time_Sim_production_rate_k');
     ReactionFlux2 = sym('MAb_PCSK9_association_rate_k*(MAb_pl/MAb_Vd)*(PCSK9_pl/volume_pl)*volume_pl');
     ReactionFlux3 = sym('MAb_PCSK9_kel*MAb_PCSK9_pl');
     ReactionFlux4 = sym('MAb_PCSK9_association_rate_k*MAb_PCSK9_Kd*MAb_PCSK9_pl');
     ReactionFlux5 = sym('MAb_kel*MAb_pl');
     ReactionFlux6 = sym('Statin_Ka*Statin_F*Statin_gi');
     ReactionFlux7 = sym('Statin_kel*Statin_pl');
     ReactionFlux8 = sym('LDLR_ic_P_production_rate_k*power(SREBP_nu_P,SREBP_LDLR_nh)/(power(SREBP_LDLR_EC50,SREBP_LDLR_nh)+power(SREBP_nu_P,SREBP_LDLR_nh))');
     ReactionFlux9 = sym('LDLR_ic_to_cs_P_trafficking_rate_k*LDLR_ic_P');
     ReactionFlux10 = sym('SREBP_ic_P_production_rate_k');
     ReactionFlux11 = sym('SREBP_ic_P_degradation_rate_k*SREBP_ic_P');
     ReactionFlux12 = sym('SREBP_ic_to_nu_P_activation_rate_k*SREBP_ic_P*(1-Chol_SREBP_Imax*power(Chol_er_P,Chol_SREBP_nh)/(power(Chol_er_P_base,Chol_SREBP_nh)+power(Chol_er_P,Chol_SREBP_nh)))');
     ReactionFlux13 = sym('LDLR_P_internalization_rate_k*LDLR_internalization_fraction_P*LDLR_cs_P');
     ReactionFlux14 = sym('LDLR_P_recycling_rate_k*LDLR_en_P');
     ReactionFlux15 = sym('LDL_LDLR_pl_association_rate_k*(LDL_pl/volume_pl)*(LDLR_cs_P/volume_P)*volume_P');
     ReactionFlux16 = sym('PCSK9_LDLR_pl_association_rate_k*(PCSK9_pl/volume_pl)*(LDLR_cs_P/volume_P)*volume_P');
     ReactionFlux17 = sym('LDL_LDLR_en_association_rate_k*(LDL_en_P/volume_en_P)*(LDLR_en_P/volume_en_P)*volume_en_P');
     ReactionFlux18 = sym('PCSK9_LDLR_en_association_rate_k*(PCSK9_en_P/volume_en_P)*(LDLR_en_P/volume_en_P)*volume_en_P');
     ReactionFlux19 = sym('LDL_LDLR_pl_association_rate_k*LDL_LDLR_pl_Kd*LDL_LDLR_cs_P');
     ReactionFlux20 = sym('PCSK9_LDLR_pl_association_rate_k*PCSK9_LDLR_pl_Kd*PC9_LDLR_cs_P');
     ReactionFlux21 = sym('LDL_LDLR_en_association_rate_k*LDL_LDLR_en_Kd*LDL_LDLR_en_P');
     ReactionFlux22 = sym('PCSK9_LDLR_en_association_rate_k*PCSK9_LDLR_en_Kd*PC9_LDLR_en_P');
     ReactionFlux23 = sym('LDLR_en_P_degradation_rate_k*LDLR_en_P');
     ReactionFlux24 = sym('PCSK9_en_P_degradation_rate_k*PCSK9_en_P');
     ReactionFlux25 = sym('LDL_LDLR_P_internalization_rate_k*LDLR_internalization_fraction_P*LDL_LDLR_cs_P');
     ReactionFlux26 = sym('PC9_LDLR_P_internalization_rate_k*LDLR_internalization_fraction_P*PC9_LDLR_cs_P');
     ReactionFlux27 = sym('ApoB_pl_clearance_rate_k*ApoB_pl');
     ReactionFlux28 = sym('ApoA1_pl_clearance_rate_k*ApoA1_pl');
     ReactionFlux29 = sym('PCSK9_pl_clearance_rate_k*PCSK9_pl');
     ReactionFlux30 = sym('Statin_Ka*(1-Statin_F)*Statin_gi');
     ReactionFlux31 = sym('MAb_Ka*MAb_F*MAb_sc');
     ReactionFlux32 = sym('MAb_Ka*(1-MAb_F)*MAb_sc');
     ReactionFlux33 = sym('PC9_LDLR_en_P_degradation_rate_k*PC9_LDLR_en_P');
     ReactionFlux34 = sym('Chol_ic_P_production_rate_k*power(SREBP_nu_P,SREBP_Chol_nh)/(power(SREBP_Chol_EC50,SREBP_Chol_nh)+power(SREBP_nu_P,SREBP_Chol_nh))*(1-Statin_Chol_Imax*power(abs(Conc_Statin),Statin_Chol_nh)/(power(Statin_Chol_P_IC50,Statin_Chol_nh)+power(abs(Conc_Statin),Statin_Chol_nh)))');
     ReactionFlux35 = sym('Chol_ic_P_elimination_rate_k*Chol_ic_P');
     ReactionFlux36 = sym('SREBP_nu_P_degradation_rate_k*SREBP_nu_P');
     ReactionFlux37 = sym('LDL_en_to_Chol_ic_P_rate_k*LDL_en_P');
     ReactionFlux38 = sym('LDL_en_to_Chol_ic_P_rate_k*LDL_en_P*chol_per_LDL_particle');
     ReactionFlux39 = sym('VLDL_to_LDL_conversion_rate_k*VLDL_pl*(1+Fibrate_LPL_Emax*power(Conc_Fibrate,Fibrate_LPL_nh)/(power(Fibrate_LPL_EC50,Fibrate_LPL_nh)+power(Conc_Fibrate,Fibrate_LPL_nh)))');
     ReactionFlux40 = sym('VLDL_to_LDL_conversion_rate_k*VLDL_pl*chol_per_VLDL_particle/chol_per_LDL_particle');
     ReactionFlux41 = sym('HDL_to_LDL_exchange_rate_k*HDL_pl*(weight_ApoB_HDL_LDL*power(ApoB_pl,ApoB_HDL_LDL_nh)/(power(ApoB_HDL_LDL_EC50,ApoB_HDL_LDL_nh)+power(ApoB_pl,ApoB_HDL_LDL_nh)))*(weight_CETP_HDL_LDL*power(CETP_pl,CETP_HDL_LDL_nh)/(power(CETP_HDL_LDL_EC50,CETP_HDL_LDL_nh)+power(CETP_pl,CETP_HDL_LDL_nh)))');
     ReactionFlux42 = sym('HDL_to_LDL_exchange_rate_k*HDL_pl*chol_per_HDL_particle/chol_per_LDL_particle*(weight_ApoB_HDL_LDL*power(ApoB_pl,ApoB_HDL_LDL_nh)/(power(ApoB_HDL_LDL_EC50,ApoB_HDL_LDL_nh)+power(ApoB_pl,ApoB_HDL_LDL_nh)))*(weight_CETP_HDL_LDL*power(CETP_pl,CETP_HDL_LDL_nh)/(power(CETP_HDL_LDL_EC50,CETP_HDL_LDL_nh)+power(CETP_pl,CETP_HDL_LDL_nh)))');
     ReactionFlux43 = sym('Chol_ic_P_to_HDL_pl_rate_k*Chol_ic_P*power(ApoA1_pl,ApoA1_RCT_nh)/(power(ApoA1_RCT_EC50,ApoA1_RCT_nh)+power(ApoA1_pl,ApoA1_RCT_nh))');
     ReactionFlux44 = sym('Chol_ic_P_to_HDL_pl_rate_k*Chol_ic_P/chol_per_HDL_particle*power(ApoA1_pl,ApoA1_RCT_nh)/(power(ApoA1_RCT_EC50,ApoA1_RCT_nh)+power(ApoA1_pl,ApoA1_RCT_nh))');
     ReactionFlux45 = sym('VLDL_pl_P_uptake_rate_k*VLDL_pl+VLDL_pl_P_LDLRuptake_rate_k*LDLR_internalization_fraction_P*VLDL_pl*LDLR_cs_P');
     ReactionFlux46 = sym('(VLDL_pl_P_uptake_rate_k*VLDL_pl+VLDL_pl_P_LDLRuptake_rate_k*LDLR_internalization_fraction_P*VLDL_pl*LDLR_cs_P)*chol_per_VLDL_particle');
     ReactionFlux47 = sym('HDL_to_VLDL_exchange_rate_k*HDL_pl*(weight_ApoB_HDL_VLDL*power(ApoB_pl,ApoB_HDL_VLDL_nh)/(power(ApoB_HDL_VLDL_EC50,ApoB_HDL_VLDL_nh)+power(ApoB_pl,ApoB_HDL_VLDL_nh)))*(weight_CETP_HDL_VLDL*power(CETP_pl,CETP_HDL_VLDL_nh)/(power(CETP_HDL_VLDL_EC50,CETP_HDL_VLDL_nh)+power(CETP_pl,CETP_HDL_VLDL_nh)))');
     ReactionFlux48 = sym('HDL_to_VLDL_exchange_rate_k*HDL_pl*chol_per_HDL_particle/chol_per_VLDL_particle*(weight_ApoB_HDL_VLDL*power(ApoB_pl,ApoB_HDL_VLDL_nh)/(power(ApoB_HDL_VLDL_EC50,ApoB_HDL_VLDL_nh)+power(ApoB_pl,ApoB_HDL_VLDL_nh)))*(weight_CETP_HDL_VLDL*power(CETP_pl,CETP_HDL_VLDL_nh)/(power(CETP_HDL_VLDL_EC50,CETP_HDL_VLDL_nh)+power(CETP_pl,CETP_HDL_VLDL_nh)))');
     ReactionFlux49 = sym('LDL_pl_LDLRind_P_uptake_rate_k*LDL_pl');
     ReactionFlux50 = sym('LDL_pl_LDLRind_P_uptake_rate_k*LDL_pl*chol_per_LDL_particle');
     ReactionFlux51 = sym('MAb_PC9_2_kel*MAb_PC9_2_pl');
     ReactionFlux52 = sym('MAb_PC9_2_association_rate_k*(MAb_PCSK9_pl/MAb_Vd)*(PCSK9_pl/volume_pl)*volume_pl');
     ReactionFlux53 = sym('MAb_PC9_2_association_rate_k*MAb_PC9_2_Kd*MAb_PC9_2_pl');
%      ReactionFlux54 = sym('piecewise(0,or(eq(MAb_dose_amount,0),ge(floor((Time_Sim-MAb_dose_start)/MAb_dose_interval),MAb_dose_cycles)),MAb_dose_amount/MAb_MW/convert_nmol_to_mmol/MAb_dose_duration,and(ge(Time_Sim,MAb_dose_start+ge(Time_Sim,MAb_dose_start)*floor((Time_Sim-MAb_dose_start)/MAb_dose_interval)*MAb_dose_interval),lt(Time_Sim,MAb_dose_start+MAb_dose_duration+ge(Time_Sim,MAb_dose_start)*floor((Time_Sim-MAb_dose_start)/MAb_dose_interval)*MAb_dose_interval)),0)+piecewise(0,or(eq(MAb_doseX_amount,0),ge(floor((Time_Sim-MAb_doseX_start)/MAb_doseX_interval),MAb_doseX_cycles)),MAb_doseX_amount/MAb_MW/convert_nmol_to_mmol/MAb_doseX_duration,and(ge(Time_Sim,MAb_doseX_start+ge(Time_Sim,MAb_doseX_start)*floor((Time_Sim-MAb_doseX_start)/MAb_doseX_interval)*MAb_doseX_interval),lt(Time_Sim,MAb_doseX_start+MAb_doseX_duration+ge(Time_Sim,MAb_doseX_start)*floor((Time_Sim-MAb_doseX_start)/MAb_doseX_interval)*MAb_doseX_interval)),0)');
%      ReactionFlux55 = sym('piecewise(0,or(eq(Statin_dose_amount,0),ge(floor((Time_Sim-Statin_dose_start)/Statin_dose_interval),Statin_dose_cycles)),Statin_dose_amount/Statin_MW/convert_nmol_to_mmol/Statin_dose_duration,and(ge(Time_Sim,Statin_dose_start+ge(Time_Sim,Statin_dose_start)*floor((Time_Sim-Statin_dose_start)/Statin_dose_interval)*Statin_dose_interval),lt(Time_Sim,Statin_dose_start+Statin_dose_duration+ge(Time_Sim,Statin_dose_start)*floor((Time_Sim-Statin_dose_start)/Statin_dose_interval)*Statin_dose_interval)),0)+piecewise(0,or(eq(Statin_doseX_amount,0),ge(floor((Time_Sim-Statin_doseX_start)/Statin_doseX_interval),Statin_doseX_cycles)),Statin_doseX_amount/Statin_MW/convert_nmol_to_mmol/Statin_doseX_duration,and(ge(Time_Sim,Statin_doseX_start+ge(Time_Sim,Statin_doseX_start)*floor((Time_Sim-Statin_doseX_start)/Statin_doseX_interval)*Statin_doseX_interval),lt(Time_Sim,Statin_doseX_start+Statin_doseX_duration+ge(Time_Sim,Statin_doseX_start)*floor((Time_Sim-Statin_doseX_start)/Statin_doseX_interval)*Statin_doseX_interval)),0)');
     ReactionFlux54 = sym('MAb_dose');
     ReactionFlux55 = sym('Statin_dose');
     ReactionFlux56 = sym('PCSK9_pl_P_uptake_rate_k*PCSK9_pl');
     ReactionFlux57 = sym('Statin_kmet*Statin_pl');
     ReactionFlux58 = sym('Statin_pl_to_pc_rate_k*Statin_pl');
     ReactionFlux59 = sym('Statin_pc_to_pl_rate_k*Statin_pc');
     ReactionFlux60 = sym('StatinM_kel*StatinM_pl');