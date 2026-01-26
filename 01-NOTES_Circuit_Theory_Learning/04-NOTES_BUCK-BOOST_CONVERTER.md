# NOTES ON NON-INVERTING BUCK/BOOST CONVERTER  
## Summary  
This section analyses how a non-inverting buck converter operates through discussing the effect of each key circuit component and key formulae on converter operation.     
    
## Non-Inverting 4-MOSFET Buck/Boost Converter Key Components    
### 01-MOSFETs  
Act as a switch between input voltage and inductor. Switches to change conduction path, which results in converter acting as buck, boost or buck boost converter.  
Power MOSFET switches repeatedly to control average voltage applied across inductor, and thereby controls average output voltage.    
  
### 02-INDUCTOR  
Generates an EMF (voltage) from energy stored in its magnetic field to resist changes in current, consequentially resulting in smoother output current. (reducing current and voltage ripple amplitude)  
KEY EQUATION:  
V = L*di/dt  
Rearranging:  
di/dt=V/L  
This shows slope of inductor current is equal to:   
(voltage across inductor)/(Inductance of inductor).   
  
Average voltage at output=average voltage of PWM signal from MOSFET, since average voltage of an inductor in Periodic Steady State = 0   
   
We can think of an inductor as storing packets of energy in its magnetic field.  
The behaviour of a DC–DC converter is determined by how the switching network connects the inductor to the input and output nodes during each switching interval. The inductor current alternately increases or decreases depending on the voltage applied across the inductor.  
We use a 4 MOSFET converter to intelligently change between buck, boost and buck/boost topologies in order to change period of time charging vs discharging.  
We can, for example, have inductor:  
  - Always connected to output and sometimes to input (buck)  
  - Always connected to input and sometimes output (boost)  
  - Connected to input for period D and connected to output for period 1-D (buck/boost).    
  We use 4 switches to control which of these switching modes we want to operate in.  
   
### 03-CAPACITOR  
Capacitor draws or provides current in order to limit magnitude of dV/dt.   
This reduces voltage ripple from inductor through storing and releasing energy in electric fields.  
**KEY FORMULA**:  
I=C*dV/dt  
Rearranging:  
dV/dt=I/C    
Since output capacitor shares a node with output load, this is also true for dV/dt at output of converter.  
Therefore a higher capacitance will mean a lower ripple voltage in Periodic Steady State operation.  
Since there will be some current ripple, current is a time varying function in PSS.  
From Ohm's Law: Vcap=Icap*Rcap  
All capacitors have some equivalent series resistance (ESR) represented here as Rcap.   
This ESR will cause a ripple voltage of magnitude Icap*Rcap, where Icap and Rcap are instantaneous current and ESR of capacitor respectively.    
This implies having a capacitor of low ESR is advantageous for reducing voltage and current ripple caused by ESR losses.   

Capacitor across input terminals also helps reduce voltage ripple from source and ensures panel sees constant load from the buck converter, so that it does not drift from its Maximum Power Point.(MPP)  
  
## EQUATIONS TO NOTE:  
Vout during Buck/Boost mode:Vout=-D/(1-D)  
Vout during Buck mode:Vout=Vin*D  
Vout during Boost mode + Vout=Vin/(1-D)  
Req during buck/boost mode: Req=Rload/(Vout/Vin)  
Req during Buck mode:Req=Rload/D^2  
Req during Boost mode:Req=Rload*(1-D)^2  