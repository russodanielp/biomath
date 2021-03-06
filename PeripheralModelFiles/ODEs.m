%% 'ODEs:
compartment = 1;
dxdt = sym('dxdt', [27 1]);
     dxdt(1) = 1/compartment*(ReactionFlux6 - ReactionFlux7 - ReactionFlux57 - ReactionFlux58 + ReactionFlux59);
     dxdt(2) = 1/compartment*(ReactionFlux1);
     dxdt(3) = 1/compartment*(-ReactionFlux2 + ReactionFlux4 - ReactionFlux16 + ReactionFlux20 - ReactionFlux29 - ReactionFlux52 + ReactionFlux53 - ReactionFlux56);
     dxdt(4) = 1/compartment*(ReactionFlux2 - ReactionFlux3 - ReactionFlux4 - ReactionFlux52 + ReactionFlux53);
     dxdt(5) = 1/compartment*(-ReactionFlux2 + ReactionFlux4 - ReactionFlux5 + ReactionFlux31);
     dxdt(6) = 1/compartment*(-ReactionFlux6 - ReactionFlux30 + ReactionFlux55);
     dxdt(7) = 1/compartment*(-ReactionFlux39 - ReactionFlux45 + ReactionFlux48);
     dxdt(8) = 1/compartment*(-ReactionFlux41 + ReactionFlux44 - ReactionFlux47);
     dxdt(9) = 1/compartment*(-ReactionFlux28);
     dxdt(10) = 1/compartment*(ReactionFlux34 - ReactionFlux35 + ReactionFlux38 - ReactionFlux43 + ReactionFlux46 + ReactionFlux50);
     dxdt(11) = 1/compartment*(-ReactionFlux27);
     dxdt(12) = 1/compartment*(ReactionFlux9 - ReactionFlux13 + ReactionFlux14 - ReactionFlux15 - ReactionFlux16 + ReactionFlux19 + ReactionFlux20);
     dxdt(13) = 1/compartment*(ReactionFlux15 - ReactionFlux19 - ReactionFlux25);
     dxdt(14) = 1/compartment*(ReactionFlux17 - ReactionFlux21 + ReactionFlux25);
     dxdt(15) = 1/compartment*(ReactionFlux13 - ReactionFlux14 - ReactionFlux17 - ReactionFlux18 + ReactionFlux21 + ReactionFlux22 - ReactionFlux23);
     dxdt(16) = 1/compartment*(ReactionFlux8 - ReactionFlux9);
     dxdt(17) = 1/compartment*(ReactionFlux16 - ReactionFlux20 - ReactionFlux26);
     dxdt(18) = 1/compartment*(ReactionFlux18 - ReactionFlux22 + ReactionFlux26 - ReactionFlux33);
     dxdt(19) = 1/compartment*(-ReactionFlux18 + ReactionFlux22 - ReactionFlux24 + ReactionFlux56);
     dxdt(20) = 1/compartment*(-ReactionFlux17 + ReactionFlux21 - ReactionFlux37);
     dxdt(21) = 1/compartment*(ReactionFlux10 - ReactionFlux11 - ReactionFlux12);
     dxdt(22) = 1/compartment*(ReactionFlux12 - ReactionFlux36);
     dxdt(23) = 1/compartment*(-ReactionFlux31 - ReactionFlux32 + ReactionFlux54);
     dxdt(24) = 1/compartment*(-ReactionFlux51 + ReactionFlux52 - ReactionFlux53);
     dxdt(25) = 1/compartment*(-ReactionFlux15 + ReactionFlux19 + ReactionFlux40 + ReactionFlux42 - ReactionFlux49);
     dxdt(26) = 1/compartment*(ReactionFlux57 - ReactionFlux60);
     dxdt(27) = 1/compartment*(ReactionFlux58 - ReactionFlux59);
     
%% 
% d(Statin_pl)/dt = 1/compartment*(ReactionFlux6 - ReactionFlux7 - ReactionFlux57 - ReactionFlux58 + ReactionFlux59);
%      d(Time_Sim)/dt = 1/compartment*(ReactionFlux1);
%      d(PCSK9_pl)/dt = 1/compartment*(-ReactionFlux2 + ReactionFlux4 - ReactionFlux16 + ReactionFlux20 - ReactionFlux29 - ReactionFlux52 + ReactionFlux53 - ReactionFlux56);
%      d(MAb_PCSK9_pl)/dt = 1/compartment*(ReactionFlux2 - ReactionFlux3 - ReactionFlux4 - ReactionFlux52 + ReactionFlux53);
%      d(MAb_pl)/dt = 1/compartment*(-ReactionFlux2 + ReactionFlux4 - ReactionFlux5 + ReactionFlux31);
%      d(Statin_gi)/dt = 1/compartment*(-ReactionFlux6 - ReactionFlux30 + ReactionFlux55);
%      d(VLDL_pl)/dt = 1/compartment*(-ReactionFlux39 - ReactionFlux45 + ReactionFlux48);
%      d(HDL_pl)/dt = 1/compartment*(-ReactionFlux41 + ReactionFlux44 - ReactionFlux47);
%      d(ApoA1_pl)/dt = 1/compartment*(-ReactionFlux28);
%      d(Chol_ic_P)/dt = 1/compartment*(ReactionFlux34 - ReactionFlux35 + ReactionFlux38 - ReactionFlux43 + ReactionFlux46 + ReactionFlux50);
%      d(ApoB_pl)/dt = 1/compartment*(-ReactionFlux27);
%      d(LDLR_cs_P)/dt = 1/compartment*(ReactionFlux9 - ReactionFlux13 + ReactionFlux14 - ReactionFlux15 - ReactionFlux16 + ReactionFlux19 + ReactionFlux20);
%      d(LDL_LDLR_cs_P)/dt = 1/compartment*(ReactionFlux15 - ReactionFlux19 - ReactionFlux25);
%      d(LDL_LDLR_en_P)/dt = 1/compartment*(ReactionFlux17 - ReactionFlux21 + ReactionFlux25);
%      d(LDLR_en_P)/dt = 1/compartment*(ReactionFlux13 - ReactionFlux14 - ReactionFlux17 - ReactionFlux18 + ReactionFlux21 + ReactionFlux22 - ReactionFlux23);
%      d(LDLR_ic_P)/dt = 1/compartment*(ReactionFlux8 - ReactionFlux9);
%      d(PC9_LDLR_cs_P)/dt = 1/compartment*(ReactionFlux16 - ReactionFlux20 - ReactionFlux26);
%      d(PC9_LDLR_en_P)/dt = 1/compartment*(ReactionFlux18 - ReactionFlux22 + ReactionFlux26 - ReactionFlux33);
%      d(PCSK9_en_P)/dt = 1/compartment*(-ReactionFlux18 + ReactionFlux22 - ReactionFlux24 + ReactionFlux56);
%      d(LDL_en_P)/dt = 1/compartment*(-ReactionFlux17 + ReactionFlux21 - ReactionFlux37);
%      d(SREBP_ic_P)/dt = 1/compartment*(ReactionFlux10 - ReactionFlux11 - ReactionFlux12);
%      d(SREBP_nu_P)/dt = 1/compartment*(ReactionFlux12 - ReactionFlux36);
%      d(MAb_sc)/dt = 1/compartment*(-ReactionFlux31 - ReactionFlux32 + ReactionFlux54);
%      d(MAb_PC9_2_pl)/dt = 1/compartment*(-ReactionFlux51 + ReactionFlux52 - ReactionFlux53);
%      d(LDL_pl)/dt = 1/compartment*(-ReactionFlux15 + ReactionFlux19 + ReactionFlux40 + ReactionFlux42 - ReactionFlux49);
%      d(StatinM_pl)/dt = 1/compartment*(ReactionFlux57 - ReactionFlux60);
%      d(Statin_pc)/dt = 1/compartment*(ReactionFlux58 - ReactionFlux59);