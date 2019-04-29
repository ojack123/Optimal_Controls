clc; clear all;
syms x1_0 x1_1 x1_2 x1_3 x1_4 x1_5 x2_0 x2_1 x2_2 x2_3 x2_4 x2_5 
syms p1_0 p1_1 p1_2 p1_3 p1_4 p1_5 p2_0 p2_1 p2_2 p2_3 p2_4 p2_5 
syms u0   u1   u2   u3   u4   

vars = [x1_0 ,
x1_1 ,
x1_2 ,
x1_3 ,
x1_4 ,
x1_5 ,
x2_0 ,
x2_1 ,
x2_2 ,
x2_3 ,
x2_4 ,
x2_5 ,
p1_0 ,
p1_1 ,
p1_2 ,
p1_3 ,
p1_4 ,
p1_5 ,
p2_0 ,
p2_1 ,
p2_2 ,
p2_3 ,
p2_4 ,
p2_5 ,
u0   ,
u1   ,
u2   ,
u3   ,
u4   ];



%% x1
eqns = [0 == x1_0 - 5,
0 == x1_1 - x2_0,
0 == x1_2 - x2_1,
0 == x1_3 - x2_2,
0 == x1_4 - x2_3,
0 == x1_5 - x2_4,
0 == x2_0 - 2,
0 == x2_1 - u0,
0 == x2_2 - u1,
0 == x2_3 - u2,
0 == x2_4 - u3,
0 == x2_5 - u4,
0 == p1_1 + 0.1*x1_0,
0 == p1_2 + 0.1*x1_1,
0 == p1_3 + 0.1*x1_2,
0 == p1_4 + 0.1*x1_3,
0 == p1_5 + 0.1*x1_4,
0 == p1_5 - 0.1*x1_5,
0 == p2_1 + 0.05*x2_0 + p1_0,
0 == p2_2 + 0.05*x2_1 + p1_1,
0 == p2_3 + 0.05*x2_2 + p1_2,
0 == p2_4 + 0.05*x2_3 + p1_3,
0 == p2_5 + 0.05*x2_4 + p1_4,
0 == p2_5 - 0.05*x2_5,
0 == u0+p2_0,
0 == u1+p2_1,
0 == u2+p2_2,
0 == u3+p2_3,
0 == u4+p2_4];



A = equationsToMatrix(eqns,vars);

B = zeros(1,29);
B(1) = 5;
B(7) = 2;

inv(A) * (-B)';


a1_   = states_out(1:6);
a2_   = states_out(7:12);
a3_   = states_out(13:18);
b_    = states_out(19:24);
tau_f = states_out(25);

fprintf("Results:\n");
fprintf("a1 = ");
fprintf("%0.1f ",a1_);
fprintf("\n");
fprintf("a2 = ");
fprintf("%0.1f ",a2_);
fprintf("\n");
fprintf("a3 = ");
fprintf("%0.1f ",a3_);
fprintf("\n");
fprintf("b = ");
fprintf("%0.1f ",b_);
fprintf("\n");
fprintf("Final time = ");
fprintf("%0.5f seconds",tau_f);
fprintf("\n");







