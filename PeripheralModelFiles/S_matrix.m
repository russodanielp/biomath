%% S = 
x = sym('x', [28 1]);
f = sym('f', [63 1]);
v = sym('v', [3 1]);
k = sym('k', [3 1]);
p = sym('p', [35 1]);
c = sym('c', [2 1]);
     S(1,54)     = x(27);
     S(1,52)     = -x(1); 
     S(1,8)      = -x(1); 
     S(1,53)     = -x(1); 
     S(1,7)      = x(6);
     S(2,1)      = 1;
     S(3,4)      = x(4); 
     S(3,30)     = -x(3); 
     S(3,51)     = -x(3); 
     S(3,48)     = x(24); 
     S(3,19)     = x(17); 
     S(3,18)     = -(x(12)*x(3))/v(1) ;
     S(3,3)      = -(x(5)*x(3))/p(34);
     S(3,47)     = -(x(4)*x(3))/p(34);
     S(4,48)     = x(24);
     S(4,4)      = -x(4); 
     S(4,2)      = -x(4);
     S(4,3)      = (x(5)*x(3))/p(34) ;
     S(4,47)     = -(x(4)*x(3))/p(34);
     S(5,33)     = x(23);
     S(5,5)      = -x(5);
     S(5,4)      = x(4);
     S(5,3)      = -(x(5)*x(3))/p(34);
     S(6,7)      = -x(6); 
     S(6,31)     = -x(6);
     S(7,44)     = (x(11)^p(6)*x(28)^p(10)*x(8)*k(1)*p(30)*p(28))/(k(2)*(x(11)^p(6) + p(5)^p(6))*(x(28)^p(10) + p(9)^p(10)));
     S(7,40)     = -x(7)*((c(2)^p(18)*p(17))/(c(2)^p(18) + p(16)^p(18)) + 1);
     S(7,56)     = -x(12)*p(19)*x(7);
     S(7,43)     = -x(7);
     S(8,42)     = (x(9)^p(2)*x(10))/(k(1)*(x(9)^p(2) + p(1)^p(2)));
     S(8,41)     = -(x(11)^p(4)*x(28)^p(8)*x(8)*p(29)*p(27))/((x(11)^p(4) + p(3)^p(4))*(x(28)^p(8) + p(7)^p(8)));
     S(8,44)     = -(x(11)^p(6)*x(28)^p(10)*x(8)*p(30)*p(28))/((x(11)^p(6) + p(5)^p(6))*(x(28)^p(10) + p(9)^p(10)));
     S(9,29)     = -x(9);
     S(10,43)    = k(2)*x(7);
     S(10,56)    = x(12)*p(19)*x(7);
     S(10,37)    = -x(10);
     S(10,39)    = x(20)*k(3);
     S(10,45)    = x(25)*k(3);
     S(10,42)    = -(x(9)^p(2)*x(10))/(x(9)^p(2) + p(1)^p(2));
     S(10,36)    = -(x(22)^p(21)*((p(24)*abs(c(1))^p(25))/(p(26)^p(25) + abs(c(1))^p(25)) - 1))/(x(22)^p(21) + p(20)^p(21));
     S(11,28)    = -x(11);
     S(12,15)    = x(15);
     S(12,10)    = x(16);
     S(12,17)    = x(13);
     S(12,14)    = -x(12)*p(19);
     S(12,19)    = x(17);
     S(12,16)    = -(x(25)*x(12))/v(1);
     S(12,18)    = -(x(12)*x(3))/v(1);
     S(13,16)    = (x(25)*x(12))/v(1);
     S(13,26)    = -x(13)*p(19);
     S(13,17)    = -x(13);
     S(14,26)    = x(13)*p(19);
     S(14,21)    = -x(14);
     S(14,20)    = (x(20)*x(15))/v(3);
     S(15,21)    =x(14);
     S(15,24)    = -x(15);
     S(15,15)    = -x(15);
     S(15,14)    = x(12)*p(19) ;
     S(15,23)    = x(18);
     S(15,20)    = -(x(20)*x(15))/v(3) ;
     S(15,22)    = -(x(15)*x(19))/v(3);
     S(16,9)     = (x(22)^p(23))/(x(22)^p(23) + p(22)^p(23));
     S(16,10)    = -x(16);
     S(17,18)    = (x(12)*x(3))/v(1);
     S(17,19)    = -x(17);
     S(17,27)    = -p(19)*x(17);
     S(18,27)    = p(19)*x(17);
     S(18,35)    = -x(18);
     S(18,23)    = -x(18);
     S(18,22)    = (x(15)*x(19))/v(3);
     S(19,51)    = x(3);
     S(19,25)    = -x(19);
     S(19,23)    = x(18);
     S(19,22)    = -(x(15)*x(19))/v(3);
     S(20,21)    = x(14) ;
     S(20,39)    = -x(20);
     S(20,20)    = -(x(20)*x(15))/v(3);
     S(21,11)    = 1;
     S(21,12)    = -x(21);
     S(21,13)    = x(21)*((p(35)^p(15)*p(14))/(p(35)^p(15) + p(12)^p(15)) - 1);
     S(22,38)    = -x(22);
     S(22,13)    = -x(21)*((p(35)^p(15)*p(14))/(p(35)^p(15) + p(12)^p(15)) - 1);
     S(23,33)    = -x(23);
     S(23,34)    = -x(23);
     S(24,47)    = (x(4)*x(3))/p(34);
     S(24,48)    = -x(24)- x(24)*f(46);
     S(25,17)    = x(13);
     S(25,45)    = -x(25);
     S(25,16)    = -(x(25)*x(12))/v(1);
     S(25,40)    = (x(7)*k(2))/k(3);
     S(25,41)    = (x(11)^p(4)*x(28)^p(8)*x(8)*k(1)*p(29)*p(27))/(k(3)*(x(11)^p(4) + p(3)^p(4))*(x(28)^p(8) + p(7)^p(8)));
     S(26,52)    = x(1);
     S(26,55)    = -x(26);
     S(27,53)    = x(1);
     S(27,54)    = -x(27);
     
     S
%% kernek

     
     
     
     
     
     
     
     
     
     
     
     