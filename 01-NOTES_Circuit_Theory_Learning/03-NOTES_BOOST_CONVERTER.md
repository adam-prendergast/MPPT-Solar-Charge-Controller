# Boost Converter  
## Summary  
This section:  
   
-Analyses how a boost converter operates through discussing the effect of each key circuit component on boost converter operation.   
  
-Derives equivalent resistance formula specific to a boost converter.  
    
## Boost Converter Key Components    
### 01-MOSFET  
Acts as a switch between inductor and load. Switches repeatedly to increase average voltage applied across inductor, and thereby controls average output voltage.    
  
### 02-INDUCTOR  
Generates an EMF (voltage) from energy stored in its magnetic field to resist changes in current. Inductor is always connected to source and output is connevted to inductor less than 100% of the time.  
Since there is no load connected across inductor when MOSFET is open circuit (other than inductor DCR) there is high current through inductor during this period.  
When load is connected inductor induces larger voltage than source voltage in order to keep current constant (current decays at rate V/L).  
  
This reduces current and voltage ripple amplitude.  
  
KEY EQUATION:  
V = L*di/dt  
Rearranging:  
di/dt=V/L  
This shows slope of inductor current is equal to:   
(voltage across inductor)/(Inductance of inductor).   
  
Average voltage at output=(average input voltage)/(1-D).  
Since average voltage of an inductor in Periodic Steady State = 0, volt-seconds inducing voltage across load must be equal to volt-seconds inducing EMF during charging period.  
Therefore avergae voltage across load must be Vin*1/(time proportion not charging inductor) which is what this formula shows.   
  
### 03-CAPACITOR  
Capacitor draws or provides current in order to limit magnitude of dV/dt.  
This reduces voltage and current ripple from inductor through storing and releasing energy in electric fields.  
KEY FORMULA:  
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
  
Capacitor across input terminals also helps reduce voltage ripple from source and ensures panel sees constant load from the boost converter, so that it does not drift from its Maximum Power Point.(MPP)  
  
### 04-Synchronous MOSFET  
Acts as current path to complete circuit only when inductor is being charged (load disconnectd).  
Acts as open circuit when inductor is acting as source (power must go through load).