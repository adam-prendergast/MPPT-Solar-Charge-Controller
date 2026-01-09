# Buck Converter for Solar MPPT   
## Summary  
This section:  
   
-Analyses how a buck converter operates through discussing the effect of each key circuit component on buck converter operation.   
  
-Derives equivalent resistance formula specific to a buck converter.  
    
## Buck Converter Key Components    
### 01-MOSFET  
Acts as a switch between input voltage and inductor. Switches repeatedly to reduce average voltage applied across inductor, and thereby controls average output voltage.    
  
### 02-INDUCTOR  
Generates an EMF (voltage) from energy stored in its magnetic field to resist changes in current, consequentially resulting in smoother output current. (reducing current and voltage ripple amplitude)  
KEY EQUATION:  
V = L*di/dt  
Rearranging:  
di/dt=V/L  
This shows slope of inductor current is equal to:   
(voltage across inductor)/(Inductance of inductor).   
  
Average voltage at output=average voltage of PWM signal from MOSFET, since average voltage of an inductor in Periodic Steady State = 0   
  
### 03-CAPACITOR  
Capacitor draws or provides current in order to limit magnitude of dV/dt.  
This reduces voltage and current ripple from inductor through storing and releasing energy in electric fields.  
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
  
### 04-FREEWHEELING DIODE (or MOSFET in synchronous sytems)  
Acts as current path to complete circuit only when inductor acts as current source when MOSFET is off (source disconnected). 
  

  














