tic

%%%%%%%%%%%%%%%%%%%%%%%%%Sim parameters%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
max_iterations = 1e+02;
h = 1e-04;


%%%%%%%%%%%%%% Cost parameters %%%%%%%%%%%%%%%%%%%
alpha = 1;%1e+02; %penalty coeff
beta = 1;%1e+01; %line search coeff
max_penalty = 1e+01; %maximum value of penalty function

%%%%%%%%%%%%%%%%%%%%%%% group flux according to a_i %%%%%%%%%%%%%%%%%%%%%%%
num_flux = 14;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% preallocate %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


v_step = 1e+02; %stepsize we use to find cost associated with flux
a_log = zeros(max_iterations,v_step+1);

mu = zeros(max_iterations,1);
sig = zeros(max_iterations,1);
V = zeros(max_iterations,1);
extrema_count = zeros(max_iterations,1);
extrema_ratio = zeros(max_iterations,1);
p_epsilon = 1e-2;
possible_extrema = num_flux*(v_step+1);
%---------------------- Initial Mean and Variance ----------------------
M =  0.2;      % a  
NewVariance = 1e-2*M;
VP = 4;

%%%%%%%%%%%%%%%% Calculate metabolites and coefficients  %%%%%%%%%%%%%%%%%%
k1 = 75  ;            %(*Chol_per_HDL  
k2 = 1750 ;           %(*Chol_per_VLDL 
k3 =  1750 ;          %(*Chol_per_LDL  
%-----------------------------------------------------------
v1 =  2.75 ;         %(*volume_pl  *)
v2 = 2.75  ;         %(*volume_P   *)
v3 = 0.02  ;         %(*volume_en_P   *)
v4 = 0.2   ;         %(*volume_H  *)
v5 = 0.03  ;         %(*volume_en_H*)  *)
%-----------------------------------------------------------
x38 = 0;   %Drug injected sc %for all VPs
x39 = 0;   % MAb_pl
x40 = 0;    %MAb_PCSK9_pl
x41 = 0;    %MAb_PC92_pl

%(*(*  ******************VP0*********************  *)
if VP == 0
x1 = 9.08749677867213;    %(*PCSK9 (nmol) *)
x2 = 5881.37374883247;    %(* LDL (nmol) *)
x3 = 961.852613751769;    %(*VLDL (nmol)  *)
x4 = 52150.9791771793;    %(* HDL_pl  (nmol *)
x5 = 1.707e+08;           %(*Chol_ic_P       (nmol)  *)
x6 = 5.824;               %(*LDLR_cs_H     (nmol)  *)
x7 = 6.157;               %(*LDL_LDLR_cs_H (nmol)  *)
x8 = 0.6478;              %(*LDL_LDLR_en_H (nmol)  *)
x9 =  11.9328;            %(*LDLR_en_H  (nmol)    *)
x10 = 0.0515;             %(*PC9_LDLR_cs_H  (nmol)  *)
x11 = 2.088;              %(*PC9_LDLR_en_H  (nmol)  *)
x12 = 6.157;              %(*LDL_en_H       (nmol)  *)
x13 = 0.05244;            %(*PCSK9_en_H     (nmol)  *)
x14 = 1.8025e+08;         %(*Chol_ic_H       (nmol)  *)
x15 = 2.332e+04;          %(*Food_gi      (nmol)  *)
x16 = 2.33996e+05;        %(*Chyl_gi       (nmol)  *)
x17 = 2.33996e+05;        %(*Chyl_ly        (nmol)  *)
x18 = 9.357e+06;          %(*Chol_gi        (nmol)  *)
x19 = 1.6995;             %(*LDLR_cs_P       (nmol)  *)
x20 = 1.797;              %(*LDL_LDLR_cs_P   (nmol)  *)
x21 = 0.0886;             %(*LDL_LDLR_en_P   (nmol)  *)
x22 = 3.482;              %(*LDLR_en_P        (nmol)  *)
x23 = 0.015;              %(*PC9_LDLR_cs_P    (nmol)   *)
x24 = 0.5909;             %(*PC9_LDLR_en_P    (nmol)  *)
x25 = 0.0338;             %(*PCSK9_en_P       (nmol)  *)
x26 = 1.797;              %(*LDL_en_P         (nmol)  *)     
x27 = 4.176942045;        %(* LDLR_ic_H  (nmol)  *)  
x28 = 7.309648578;        %(*  PCSK9_ic_H     (nmol)   *)  
x29 = 1.200341591;        %(*  LDLR_ic_P     (nmol)   *)  
x30 = 626262.62626;       %(*   = ApoA1_ic_H     *)  
x31 = 156302.5210084;     %(*  = ApoA1_pl    *)  
x32 = 120143.684766561;   %(*  = ApoB_ic_H   *)    
x33 = 6115.3092338795;    %(*  = ApoB_pl  *)    
x34 = 10.489509011826;    %(*  = SREBP_ic_H   *)   
x35 = 0.506161983844957;  %(*  = SREBP_nu_H    *)   
x36 = 10.5281801936823;   %(*SREBP_ic_P     *)  
x37 =  0.467490801988707; %(*  = SREBP_nu_P    *)

%(*   a values varied *)
a9 = 0.1;            %(* f51  PCSK9_pl _clearance _rate _k   *)
average_a9 = 0.1;
a22= 0.0017;       % (*f34  HDL_to _LDL _exchange _rate _k  *) 
average_a22 = 0.0017;
a23= 0.0158;        %(* f33  HDL_to _VLDL _exchange _rate _k  *)
average_a23 = 0.0158;
a30= 70000;         %        (*  f10  Chol_ic _H _production _rate _k   *)
average_a30 = 70000;
a32= 0.015;        %(*  f8 (biliary_chol _secretion _rate _k+bileacid_chol _secretion _rate _k)  *)
average_a32 = 0.015;
end

% %(*  ******************VP1*********************  *)
if VP == 1
x1 = 8.20283783395434;
x2 = 6884.50885344507;
x3 = 1037.59636520797;
x4 = 43883.606578938;
x5 = 171134193.170325;
x6 = 5.07645579968265;
x7 = 6.28192965582854;
x8 = 0.628370912877131;
x9 = 11.3117325554634;
x10 = 0.0405899512100759;
x11 = 1.64102516070753;
x12 = 6.28192965591555;
x13 = 0.0434578212296766;
x14 = 181536095.722874;
x15 = 23325.3821770568;
x16 = 210823.573147691;
x17 = 210823.573144545;
x18 = 8200185.61649497;
x19 = 1.85713497588686;
x20 = 2.29813707441798;
x21 = 0.132131805363625;
x22 = 4.13850331009455;
x23 = 0.0148491429919081;
x24 = 0.587904076382101;
x25 = 0.0283353592266741;
x26 = 2.29813707434334;
x27 = 3.62057830427057;
x28 = 6.40214132664274;
x29 = 1.31214215135387;   % (*  LDLR_ic_P     (nmol)   *)  
x30 = 626262.62626;        %(*   = ApoA1_ic_H     *)  
x31 = 156302.5210084;       %(*  = ApoA1_pl    *)  
x32 = 145210.96;   %(*  = ApoB_ic_H   *)    
x33 = 6662.5848;      %(*  = ApoB_pl  *)    
x34 = 10.5779;                   %(*  = SREBP_ic_H   *)   
x35 = 0.4177;     %(*  = SREBP_nu_H    *)   
x36 = 10.5551;      %(*SREBP_ic_P     *)  
x37 =  0.4405;     %(*  = SREBP_nu_P    *)  

a9  = 0.1;                 %(* f51  PCSK9_pl _clearance _rate _k   *)
average_a9 = 0.1;
a22 = 0.0026;              %     (*f34  HDL_to _LDL _exchange _rate _k  *) 
average_a22 = 0.0026;
a23 = 0.0238;       %(* f33  HDL_to _VLDL _exchange _rate _k  *)
average_a23 = 0.0238;
a30 = 100000;              %  (*  f10  Chol_ic _H _production _rate _k   *)
average_a30 = 100000;
a32 = 0.0131;       %(*  f8 (biliary_chol _secretion _rate _k+bileacid_chol _secretion _rate _k)  *) 
average_a32 = 0.0131;
end


% %(*  ******************VP2*********************  *)
if VP == 2
x1 = 12.4488374;
x2 = 6833.8959172;
x3 = 1021.6941913;
x4 = 43764.8666186;
x5 = 170698847.728947;
x6 = 5.5255679;
x7 = 6.7874208;
x8 = 0.7327328;
x9 = 12.2628768;
x10 = 0.0670501;
x11 = 2.71622;
x12 = 6.7874208;
x13 = 0.0663596;
x14 = 179172015.359576;
x15 = 23325.3821771;
x16 = 222949.8364415;
x17 = 222949.8364309;
x18 = 8805626.3885186;
x19 = 1.3513635;
x20 = 1.6599692;
x21 = 0.0718106;
x22 = 2.9997048;
x23 = 0.0163981;
x24 = 0.6381337;
x25 = 0.0423894;
x26 = 1.6599692;
x27 = 4.8622234;
x28 = 9.6875214;
x29 = 1.163082;
x30 = 626262.62626;   %        (*   = ApoA1_ic_H     *)  
x31 = 156302.5210084;   %     (*  = ApoA1_pl    *)  
x32 = 146486.4430;  %(*  = ApoB_ic_H   *)    
x33 = 6680.4237;      %(*  = ApoB_pl  *)    
x34 = 10.4153;                   %(*  = SREBP_ic_H   *)   
x35 = 0.5804;     %(*  = SREBP_nu_H    *)   
x36 = 10.5234;      %(*SREBP_ic_P     *)  
x37 =  0.4723;    %(*  = SREBP_nu_P    *)

a9  = 0.1;                 %(* f51  PCSK9_pl _clearance _rate _k   *)
average_a9 = 0.1;
a22 = 0.0026;              %     (*f34  HDL_to _LDL _exchange _rate _k  *) 
average_a22 = 0.0026;
a23 = 0.0238;       %(* f33  HDL_to _VLDL _exchange _rate _k  *)
average_a23 = 0.0238;
a30 = 40000;              %  (*  f10  Chol_ic _H _production _rate _k   *)
average_a30 = 40000;
a32 = 0.0142;       %(*  f8 (biliary_chol _secretion _rate _k+bileacid_chol _secretion _rate _k)  *) 
average_a32 = 0.0142;
end

% %(*  ******************VP3*********************  *)
if VP == 3
x1 =4.95532474238085;
x2 = 6913.1739837515;
x3 = 1038.78754519753;
x4 = 43887.9858846241;
x5 = 171191975.576653;
x6 =4.99629077930363;
x7 = 6.20847147158043;
x8 = 0.614126164350997;
x9 = 11.178427294165;
x10 = 0.0454569302303394;
x11 = 1.86152061005012;
x12 =6.20847147169624;
x13 = 0.0249420051753117;
x14 = 181547785.842033;
x15 = 23325.3821770568;
x16 = 193866.111742424;
x17 = 193866.111738414;
x18 = 7353532.50752687;
x19 = 1.91499709100653;
x20 = 2.37960625848976;
x21 = 0.141163784655561;
x22 = 4.28467518553233;
x23 = 0.017422902909731;
x24 = 0.706601755502251;
x25 = 0.0164487175738123;
x26 = 2.37960625837334;
x27 = 2.97936328893223;
x28 = 3.84834424820413;
x29 = 1.13506927831381;  % (*  LDLR_ic_P     (nmol)   *)  
x30 = 626262.62626;        %(*   = ApoA1_ic_H     *)  
x31 = 156302.5210084;       %(*  = ApoA1_pl    *)  
x32 = 145323.7547;      %(*  = ApoB_ic_H   *)    
x33 = 6688.8017;     %(*  = ApoB_pl  *)    
x34 = 10.5787;                  %(*  = SREBP_ic_H   *)   
x35 = 0.4170;     %(*  = SREBP_nu_H    *)   
x36 = 10.5593;      %(*SREBP_ic_P     *)  
x37 =  0.4364;    %(*  = SREBP_nu_P    *)

a9  = 0.05;                 %(* f51  PCSK9_pl _clearance _rate _k   *)
average_a9 = 0.05;
a22 = 0.0026;              %     (*f34  HDL_to _LDL _exchange _rate _k  *) 
average_a22 = 0.0026;
a23 = 0.0238;       %(* f33  HDL_to _VLDL _exchange _rate _k  *)
average_a23 = 0.0238;
a30 = 70000;              %  (*  f10  Chol_ic _H _production _rate _k   *)
average_a30 = 70000;
a32 = 0.0117;       %(*  f8 (biliary_chol _secretion _rate _k+bileacid_chol _secretion _rate _k)  *) 
average_a32 = 0.0117;
end

%(*  ******************VP4*********************  *)

if VP == 4
x1 =12.8996132290725;
x2 = 6859.72751900507;
x3 = 998.306529486441;
x4 =43611.1543787873;
x5 = 170339526.815823;
x6 = 5.77838026044992;
x7 = 7.12479676040017;
x8 = 0.799955894098995;
x9 = 12.7816590313543;
x10 = 0.0374868066387105;
x11 = 1.48603545402699;
x12 = 7.12479676092812;
x13 = 0.0696670246917286;
x14 = 174310556.027749;
x15 = 23325.3821770568;
x16 = 260402.04571674;
x17 = 260402.045671634;
x18 = 10675542.4504564;
x19 = 0.908352522902854;
x20 = 1.12000713362053;
x21 = 0.0345952179119534;
x22 = 2.00996014356731;
x23 = 0.0058928685636794;
x24 = 0.204149774781664;
x25 = 0.0404042706182727;
x26 = 1.12000713363632;
x27 = 6.5986990188023;
x28 = 21.149676342315;
x29 = 1.00813383393921;
x30 = 626262.62626;        %(*   = ApoA1_ic_H     *)  
x31 = 156302.5210084;       %(*  = ApoA1_pl    *)  
x32 = 149853.2386;          %(*  = ApoB_ic_H   *)    
x33 = 6839.4456;     %(*  = ApoB_pl  *)    
x34 = 10.1537;                  % (*  = SREBP_ic_H   *)   
x35 = 0.842;     %(*  = SREBP_nu_H    *)   
x36 = 10.497;      %(*SREBP_ic_P     *)  
x37 =  0.4987;    %(*  = SREBP_nu_P    *)

a9  = 0.3;                 %(* f51  PCSK9_pl _clearance _rate _k   *)
average_a9 = 0.3;
a22 = 0.0026;              %     (*f34  HDL_to _LDL _exchange _rate _k  *) 
average_a22 = 0.0026;
a23 = 0.0238;       %(* f33  HDL_to _VLDL _exchange _rate _k  *)
average_a23 = 0.0238;
a30 = 40000;              %  (*  f10  Chol_ic _H _production _rate _k   *)
average_a30 = 40000;
a32 = 0.0177;       %(*  f8 (biliary_chol _secretion _rate _k+bileacid_chol _secretion _rate _k)  *) 
average_a32 = 0.0117;
end

%common average a's for all VPs

a1  = 0.693 ; %(* f69  SREBP_nu _P _degradation _rate _k *)
a2  = 0.693 ; %(*f67 SREBP_ic _P _degradation _rate _k *)
a3 =  0.693 ; %(*f65  SREBP_nu _H _degradation _rate _k  *)
a4  = 0.693 ; %(*f63   SREBP_ic _H _degradation _rate _k *)
a5   = 0  ; %(*f61  ApoB_pl _clearance _rate _k *)
a6 =  0.00238 ; %    (*f58 ApoA1_pl _clearance _rate _k  *)
a7 = 0.2        ;%   (*f55 =  LDLR_ic _to _cs _P _trafficking _rate _k*)
a8 = 0.2        ;% (*f53 =  LDLR_ic _to _cs _H _trafficking _rate _k  *)
a10  = 0.2      ;%    (*f50  =   PCSK9_ic _H _to _pl _release _rate _k  *)
a11 = 8.3       ;%  (*f48 = PC9_LDLR _P _internalization _rate _k*LDLR_internalization _fraction _P*)
a12 = 8.3       ; %  (*f47 =  LDLR_P _recycling _rate _k *)
a13 =  8.3      ; %    (*f46 =  LDLR_P _internalization _rate _k*LDLR_internalization _fraction _P  *)
a14 = 0.2       ; %   (*f44  =  PC9_LDLR _en _P _degradation _rate _k  *)
a15 = 0.2       ; %   (*   f43 = PCSK9_en _P _degradation _rate _k  *)
a16 = 0.00034   ; %   (* f39 =  LDL_pl _LDLRind _P _uptake _rate _k  *)
a17 = 0         ; %   (* f38b = VLDL_pl _P _LDLRuptake _rate _k*LDLR_internalization _fraction _P  *)
a18 = 0         ; %   (* f38a =      VLDL_pl _P _uptake _rate _k  *)
a19 = 150000    ; %    (* f37  = Chol_ic _P _production _rate _k  *)
a20 = 0         ; %   (* f36  = Chol_ic_P_elimination_rate_k  *)
a21 = 0.0711    ; %   (* f35 =  VLDL_to _LDL _conversion _rate _k  *)
a24 = 0.36      ;%   (*  f31 = PCSK9_LDLR _pl _association _rate _k  *)
a25 = 0.36      ; %   (* f29 = LDL_LDLR _pl _association _rate _k  *) 
a26 = 8.3       ; %   (* f26 = LDLR_H _recycling _rate _k  *)
a27 = 0.2       ; %   (*  f23 = PC9_LDLR _en _H _degradation _rate _k  *)
a28 = 0.000899  ; %   (* f13b = VLDL_pl _H _LDLRuptake _rate _k*LDLR_internalization _fraction _H  *)
a29 =  0.00196  ;  %             (*f13a   VLDL_pl _H _uptake _rate _k   *)
a31 = 0.272     ; %   (* f9 = bileacid_chol_absorption_rate_k  *)
a33 =  0.01035  ; %   (* f5 = Chol_gi_excretion_rate_k  *)
a34 = 0.693     ; %   (* f3 = 0.693          Food_gi_excretion_rate_k   *)   


%%%%%%%%%%% Calculate expected flows using average flux values  %%%%%%%%%%%

%Bin1 {8,10,33,34,51}
%Bin1.1 {49,52,54}
        f54 = a7*(0.166375*x29 + x29 *x37^3)/x37^3;
%Bin2 {18,20,30,41}
        f41 = - (a14 *x24)/x22 + (a7 *x29)/x22 ;
%BIN3 {1  2  4  6  7 11 12 14 15 16 17 19 21 22 24 25 27 28 ... 
%     31 32 40 42 45 48 50 53 55}
        f11 = -(0.5*a22*x33)/(1000 + x33) - (0.5*a23*x33)/(1000 + x33) - ...
            (a13*k3*x19)/(k1*x4) + (a16*k3*x2)/(k1*x4) + (a12*k3*x22)/(k1*x4)...
            - (a11*k3*x23)/(k1*x4) + (a7*k3*x29)/(k1*x4) + (a18*k2*x3)/(k1*x4) + ...
            (a17*k2*x19*x3)/(k1*x4) + (a19*x37^4)/(k1*(0.0915063 + x37^4)*x4) - ...
            (a20*x5)/(k1*x4);
        
        f14 = - (a13*x19*x7)/(x12*x20) + (a12*x22*x7)/(x12*x20) -...
            ( a11*x23*x7)/(x12*x20) + (a7*x29*x7)/(x12*x20) + ...
            ( a25*x2*(x20*x6 - x19*x7))/(v1*x12*x20);

        f15 = - a16 + (a21*k2*x3)/(k3*x2) + (0.5*a22*k1*x33*x4)/( k3*x2*(1000. + x33)) +...
            (a13*x19*(x20 + x7))/(x2*x20) - ( a12*x22*(x20 + x7))/(x2*x20) + ...
            (a11*x23*(x20 + x7))/(x2*x20) - (a7*x29*(x20 + x7))/(x2*x20) - ...
            ( a25*(x20*x6 - x19*x7))/(v1*x20);

           
        f16 = - (a12*x22*(- v3*v5*x21*x7 +  v3*v5*x20*x8))/( x20*( v5*x22*x26*x8 - ...
            v3*x12*x21*x9)) + (  a25*v3*v5*x2*x21*(- x20*x6 +  x19*x7))/...
            ( v1*x20*(- v5*x22*x26*x8 +  v3*x12*x21*x9)) - (  a13*x19*(- v3*v5*x21*x7 + ...
            v3*v5*x20*x8))/( x20*(- v5*x22*x26*x8 +  v3*x12*x21*x9)) - ...
            (  a11*x23*(- v3*v5*x21*x7 +  v3*v5*x20*x8))/( x20*(- v5*x22*x26*x8 + ...
            v3*x12*x21*x9)) + (  a7*x29*(- v3*v5*x21*x7 +  v3*v5*x20*x8))/...
            ( x20*(- v5*x22*x26*x8 +  v3*x12*x21*x9));
           
           
        
        f17 =  - (a25*v5*x2*x22*x26*(-x20*x6 + x19*x7))/( v1*x20*(v5*x22*x26*x8 - ...
             v3*x12*x21*x9)) + (  a13*x19*(- v5*x22*x26*x7 + ...
            v3*x12*x20*x9))/( x20*( v5*x22*x26*x8 -  v3*x12*x21*x9)) - ...
            ( a12*x22*(- v5*x22*x26*x7 +  v3*x12*x20*x9))/( x20*( v5*x22*x26*x8 - ...
            v3*x12*x21*x9)) + ( a11*x23*(- v5*x22*x26*x7 + ...
            v3*x12*x20*x9))/(x20*( v5*x22*x26*x8 -  v3*x12*x21*x9)) - ...
            ( a7*x29*(- v5*x22*x26*x7 +  v3*x12*x20*x9))/(x20*(v5*x22*x26*x8 - ...
            v3*x12*x21*x9));

        
        f24 = - (a13*x19)/x20 + (a12*x22)/x20 - (a11*x23)/x20 +...
            (a7*x29)/x20 - (a25*x2*(-x20*x6 + x19*x7))/(v1*x20*x7);
        
        f25 = (a8*x27)/x6 + (a24*x1*(x10*x19 - x23*x6))/( v1*x23*x6) + ...
            (a13*x19*x7)/(x20*x6) - (a12*x22*x7)/(x20*x6) - ...
            (a7*x29*x7)/(x20*x6) + (a25*x2*(-x20*x6 + x19*x7))/( v1*x20*x6)...
            - (a11*(x10*x20 - x23*x7))/(x20*x6) + (a26*x9)/x6;
        
        f28 =(a13*x19)/x20 + (a25*x19*x2)/(v1*x20) - (a12*x22)/x20 + ...
            (a11*x23)/x20 - (a7*x29)/x20;
        
        f32 = -(a20*(150000 + x31))/x31 - (a13*k3*x19*(150000. + x31))/(x31*x5) + ...
            (a16*k3*x2*(150000. + x31))/(x31*x5) + (a12*k3*x22*(150000. + x31))/(x31*x5) - ...
            (a11*k3*x23*(150000. + x31))/(x31*x5) + (a7*k3*x29*(150000. +x31))/(x31*x5) + ...
            (a18*k2*x3*(150000. + x31))/(x31*x5) + (a17*k2*x19*x3*(150000. + x31))/(x31*x5) + ...
            (a19*(150000. + x31)*x37^4)/(x31*(0.0915063 + x37^4)*x5);
        
        f40 = - (a13*x19)/x26 + (a12*x22)/x26 - (a11*x23)/x26 + (a7*x29)/x26;

        
        f45 =- (a13*x19)/x20 + (a12*x22)/x20 - (a11*x23)/x20 + (a7*x29)/x20;
        
        f55=a7;
        
        f_expected = [f11,f14,f15,f16,f17,f24,f25,f28,f32,f40,f41,f45,f54,f55];   
        
%%%% calculate mu and sig (Gaussian parameters) from M and V (lognormal parameters)%%%%%
for m=1:max_iterations
    
    V(m) = NewVariance; 
    mu(m) = log((M^2)/sqrt(V(m,1)+M^2));
    sig(m) = sqrt(log(V(m,1)/(M^2)+1)); %used to generate a7

%%%%%%%%%%%%%%%%%% start 25th percentile for  a7_log, then add Delta V  %%%%%%%%%%%
%%%%%%%%%%%%%%%%%% untill we reach M + 2V      %%%%%%%%%%%%%%%%%%%%%%%%%%%%
    initial_cost_step = logninv(0.025,mu(m),sig(m));
    final_cost_step = logninv(0.975,mu(m),sig(m));
    delta_v = (final_cost_step-initial_cost_step)/v_step;
    for n = 1:v_step+1
        a_log(m,n) = initial_cost_step + (n-1)*delta_v;
%%%%%%%%%%%%%%%%%% Calculate fluxes from sampled a %%%%%%%%%%%%%%%%%%%%%%%
%%%%%Bin1 {8,10,33,34,51}
%%%%%Bin1.1 {49,52,54}
        f54 = a_log(m,n)*(0.166375*x29 + x29 *x37^3)/x37^3;
%%%%Bin2 {18,20,30,41}
        f41 = - (a14 *x24)/x22 + (a_log(m,n) *x29)/x22 ;
%%Bin3 {1,2,4,6,7,11,12,14,15,16,17,18,19,20,21,22,24,25,27,28,30,32,40,41,42,45,49,52...} 
        f11 = -(0.5*a22*x33)/(1000 + x33) - (0.5*a23*x33)/(1000 + x33) - ...
            (a13*k3*x19)/(k1*x4) + (a16*k3*x2)/(k1*x4) + (a12*k3*x22)/(k1*x4)...
            - (a11*k3*x23)/(k1*x4) + (a_log(m,n)*k3*x29)/(k1*x4) + (a18*k2*x3)/(k1*x4) + ...
            (a17*k2*x19*x3)/(k1*x4) + (a19*x37^4)/(k1*(0.0915063 + x37^4)*x4) - ...
            (a20*x5)/(k1*x4);
        f14 = - (a13*x19*x7)/(x12*x20) + (a12*x22*x7)/(x12*x20) - ...
            ( a11*x23*x7)/(x12*x20) + (a_log(m,n)*x29*x7)/(x12*x20) + ...
            ( a25*x2*(x20*x6 - x19*x7))/(v1*x12*x20);
        f15 = - a16 + (a21*k2*x3)/(k3*x2) + (0.5*a22*k1*x33*x4)/( k3*x2*(1000. + x33)) +...
            (a13*x19*(x20 + x7))/(x2*x20) - ( a12*x22*(x20 + x7))/(x2*x20) + ...
            (a11*x23*(x20 + x7))/(x2*x20) - (a_log(m,n)*x29*(x20 + x7))/(x2*x20) - ...
            ( a25*(x20*x6 - x19*x7))/(v1*x20);
        f16 = - (a12*x22*(- v3*v5*x21*x7 +  v3*v5*x20*x8))/( x20*( v5*x22*x26*x8 - ...
            v3*x12*x21*x9)) + (  a25*v3*v5*x2*x21*(- x20*x6 +  x19*x7))/...
            ( v1*x20*(- v5*x22*x26*x8 +  v3*x12*x21*x9)) - (  a13*x19*(- v3*v5*x21*x7 + ...
            v3*v5*x20*x8))/( x20*(- v5*x22*x26*x8 +  v3*x12*x21*x9)) - ...
            (  a11*x23*(- v3*v5*x21*x7 +  v3*v5*x20*x8))/( x20*(- v5*x22*x26*x8 + ...
            v3*x12*x21*x9)) + (  a_log(m,n)*x29*(- v3*v5*x21*x7 +  v3*v5*x20*x8))/...
            ( x20*(- v5*x22*x26*x8 +  v3*x12*x21*x9));
        f17 =  - (a25*v5*x2*x22*x26*(-x20*x6 + x19*x7))/( v1*x20*(v5*x22*x26*x8 - ...
             v3*x12*x21*x9)) + (  a13*x19*(- v5*x22*x26*x7 + ...
            v3*x12*x20*x9))/( x20*( v5*x22*x26*x8 -  v3*x12*x21*x9)) - ...
            ( a12*x22*(- v5*x22*x26*x7 +  v3*x12*x20*x9))/( x20*( v5*x22*x26*x8 - ...
            v3*x12*x21*x9)) + ( a11*x23*(- v5*x22*x26*x7 + ...
            v3*x12*x20*x9))/(x20*( v5*x22*x26*x8 -  v3*x12*x21*x9)) - ...
            ( a_log(m,n)*x29*(- v5*x22*x26*x7 +  v3*x12*x20*x9))/(x20*(v5*x22*x26*x8 - ...
            v3*x12*x21*x9));
        f24 = - (a13*x19)/x20 + (a12*x22)/x20 - (a11*x23)/x20 +...
            (a_log(m,n)*x29)/x20 - (a25*x2*(-x20*x6 + x19*x7))/(v1*x20*x7);
        f25 = (a8*x27)/x6 + (a24*x1*(x10*x19 - x23*x6))/( v1*x23*x6) + ...
            (a13*x19*x7)/(x20*x6) - (a12*x22*x7)/(x20*x6) - ...
            (a_log(m,n)*x29*x7)/(x20*x6) + (a25*x2*(-x20*x6 + x19*x7))/( v1*x20*x6)...
            - (a11*(x10*x20 - x23*x7))/(x20*x6) + (a26*x9)/x6;
        f28 =(a13*x19)/x20 + (a25*x19*x2)/(v1*x20) - (a12*x22)/x20 + ...
            (a11*x23)/x20 - (a_log(m,n)*x29)/x20;
        f32 = -(a20*(150000 + x31))/x31 - (a13*k3*x19*(150000. + x31))/(x31*x5) + ...
            (a16*k3*x2*(150000. + x31))/(x31*x5) + (a12*k3*x22*(150000. + x31))/(x31*x5) - ...
            (a11*k3*x23*(150000. + x31))/(x31*x5) + (a_log(m,n)*k3*x29*(150000. +x31))/(x31*x5) + ...
            (a18*k2*x3*(150000. + x31))/(x31*x5) + (a17*k2*x19*x3*(150000. + x31))/(x31*x5) + ...
            (a19*(150000. + x31)*x37^4)/(x31*(0.0915063 + x37^4)*x5);
        f40 = - (a13*x19)/x26 + (a12*x22)/x26 - (a11*x23)/x26 + (a_log(m,n)*x29)/x26;
        f45 =- (a13*x19)/x20 + (a12*x22)/x20 - (a11*x23)/x20 + (a_log(m,n)*x29)/x20;
        f55= a_log(m,n);
        
        f_log = [f11,f14,f15,f16,f17,f24,f25,f28,f32,f40,f41,f45,f54,f55];  
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% find percent Cost  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        for k = 1:num_flux
            if f_log(k) < 0.5*f_expected(k) || f_log(k) > 1.5*f_expected(k)
                extrema_count(m) = extrema_count(m) + 1;
            end
        end
    end
    
    extrema_ratio(m,1) = extrema_count(m,1)/possible_extrema;
    
    if extrema_ratio(m,1) > 0.051
        NewVariance = V(m,1)-h;
    elseif extrema_ratio(m,1) < 0.049
        NewVariance = V(m,1) + h;
    else
        break;
    end
end
        
        
 
VP
sig(m,1)
formatSpec = 'There are %d out of %d extreme flux values. Ratio is %.4f';
str = sprintf(formatSpec,extrema_count(m,1),possible_extrema,extrema_ratio(m,1)) 
  
toc
