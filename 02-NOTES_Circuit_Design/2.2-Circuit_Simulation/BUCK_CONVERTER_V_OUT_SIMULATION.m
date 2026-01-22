%THIS MATLAB FILE USES A VECTOR OF POSSIBLE AVAILABLE POWER OUTPUTS FROM
%SOLAR PANEL, A VECTOR OF RLOAD VALUES FROM 0.1 TO 10 OHMS AND IRRADIANCE (POWER) FROM 1
%TO 100W, and graphs the result.
%
%ASSUMPTIONS:  
%Buck converter is assumed lossless
%Optimum operating voltage is approximated as a constant value of 19.97V
%
%Defining independent variables
Voc= 22.79
Voptimum=19.97
Rload= 0.1:0.02:10
Pavailable=1:0.1:100

%Defining dependant variables
I=Pavailable./Voptimum
REQ=Voptimum./I

%Using meshgrid to create a 2D grid of all combinations of Rload and REQ,
%so we can compute D, Vout, and Pout element-wise over entire parameter
%space without loops.
[RL, Req]=meshgrid(Rload, REQ)

%Defining D, Vout, Pout from BUCK_CONVERTER NOTES:
%Req=Rload/D^2
%D^2=Rload/Req,
D=sqrt(RL ./ Req)
D(D>1) = NaN

%Now we have defined D we can define Vout:
%From Buck_Converter notes:(Vout=Vin*D)
Vout=Voptimum.*D

%From P=IV and V=IR
Pout=Vout.^2./RL

%Graphing
figure
surf(RL, Pout, Vout, D ) 
xlabel('Rload')
ylabel('Pout')
zlabel('Vout')
shading interp
colormap turbo
colorbar
caxis([0 1])
title("Output power and voltage vs. Load Resistance buck converter ")

