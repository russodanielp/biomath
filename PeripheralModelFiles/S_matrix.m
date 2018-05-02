project = sbioloadproject('Peripheral_Cholesterol_Model.sbproj');
model = project.m1; 

equations = getequations(model);
species = model.Species;
reactions = model.Reactions;

S = getstoichmatrix(model);

species
reactions

size(species)


ode_conc = ["Statin_pl" "Time_Sim" "PCSK9_pl" ...
            "MAb_PCSK9_pl" "MAb_pl" "Statin_gi" ...
            "Statin_gi" "VLDL_pl" "HDL_pl" "ApoA1_pl" ...
            "Chol_ic_P" "ApoB_pl" "LDLR_cs_P" "LDL_LDLR_cs_P" ...
            "LDL_LDLR_en_P" "LDLR_en_P" "LDLR_ic_P" ...
            "PC9_LDLR_cs_P" "PC9_LDLR_en_P" "PCSK9_en_P" ...
            "LDL_en_P" "SREBP_ic_P" "SREBP_nu_P" "MAb_sc" ...
            "MAb_PC9_2_pl" "LDL_pl" "StatinM_pl" "Statin_pc"];



