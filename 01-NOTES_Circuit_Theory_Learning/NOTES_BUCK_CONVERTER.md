# Buck Converter for Solar MPPT  
# Summary  
This section analyses how a buck converter operates, and discusses the effect of each key circuit component, duty cycle, and switching frequency on circuit performance specific to solar rectification applications.  
   
# OBJECTIVE OF A SOLAR CHARGE CONTROLLER  
Keep output voltage a desired constant while controlling effective load across solar panel in order to extract maximum energy.  
  
There are several potential approaches we can use to achieve this, however in this page I will explain the Buck converter, and how each component of the Buck converter enables this function.  
# MPPT Context (Solar specific notes)  
First some notes about mppt buck converter for solar applications:  

We want to extract maximum power from a current source (solar panel).   
Since a solar panel cannot output infinite power, we cannot increase the load indefinetely and expect the same current.    
There is an ideal resistance in order to obtain greatest value for instantaneous power, I*V.  

There are various algorithms that can be used to track this ideal operating current/voltage, for which the magnitude of the product of V and I are maximised, which will be discussed later under "Coding" notes.  
# Equivalent Resistance seen by the panel  
Equivalent resistance of our buck converter circuit must be calculated to determine duty cycle (where duty cycle is fraction of on/off cycle that MOSFET is on) required to obtain a specific equivalent resistance, in order to reach this ideal voltage/current which results in maximum power output. This point is called maximum power point, or MPP.  
Formula for equivalent resistance of switching buck converter: 
Req=Rload/(D)^2  
Where:  
Req is equivalent resistance,  
Rload is Resistance of load across output  
D is duty cycle of MOSFET  

DERIVATION:  
Starting with Ohm's law:  
  
V=I*R  

Rearranging:  
  
R=V/I  
  
Subbing in for our specific scenario:  
  
Req=Vin/Iin (equivalent resistance=(Voltage in)/(Current in))  
   
Subbing in: Iin=Iout*D (Iout=current through load)  
  
Req=Vin/Iout*D    

Subbing in: Iout=Vin/Rload  
  
Vin/(Vin/Rload)*D  
  
Subbing in: Vin=D*Vout  
  
(D*Vout)/D*((D*Vout/Rload)*D)    
  
This leaves:
  
Rload/(D)^2. 
  
# Buck Converter Key Components    
# 01-MOSFET  
Acts as a switch between input voltage and inductor. Switches repeadetedly to reduce average voltage applied across inductor (generating a PWM signal).  
  
# 02-INDUCTOR  
Resists changes in current and consequentially smooths output current. (reducing current ripple amplitude)  
KEY EQUATION:  
V = L*di/dt 
Rearranging:
di/dt=V/L
This shows slope of inductor current is equal to: 
(voltage across inductor)/(Inductance of inductor).  

Average voltage at output=average volatge of PWM signal from MOSFET, since average voltage of an inductor in Periodic Steady State = 0  

# 03-CAPACITOR
Capacitor reduces volatge and current ripple from inductor through storing and releasing energy in electric fields.     
KEY FORMULA:
I=C*dV/dt
Rearranging:  
dV/dt=I/C    
Since output capacitor shares a node with output load, this is also true for dV/dt at output of converter.  
Therefore a higher capacitance will mean a lower ripple voltage in Periodic Steady State operation.  
Since there will be some current ripple, current is a time varying function in PSS.  
From Ohm's Law: Vcap=Icap*Rcap  
All capacitors have some equivalent series resistance (ESR).  
This ESR will cause a ripple voltage of magnitude Icap*Rcap, where Icap and Rcap are instantaneous current and ESR of capacitor respectively.  
This implies having a capacitor of low ESR is advantageous for reducing voltage and current ripple.  

Capacitor across input terminals also helps reduce voltage ripple from source and ensures panel sees constant load from the buck converter, so that it does not drift from it's Maximum Power Point.(MPP)  
  
# 04-FREEWHEELING DIODE (or MOSFET in synchronous sytems)  
Acts as current path to complete circuit only when inductor acts as current source when MOSFET is off. 
  
# Notes on switching frequency  
EFFECT OF MOSFET SWITCHING FREQUENCY ON OUTPUT:  
When MOSFET is operating as short circuit, energy is being stored in inductor and capacitor.  
Shorter switching period means less energy dissipated per cycle, and therefore lower fraction of inductor energy dissipated during off cycle. This reduces amplitude of current and voltage ripple.  
So higher switching frequency = more stable output voltage and current.  
Practically, with non-ideal MOSFETs there are increased switching losses higher frequencies. This is a tradeoff which must be considered when designating switching frequency for a converter.
  
In the context of a solar charge controller, maximum power extraction is desired from source. Whilst MOSFET is open circuit, power is not instantaneously being extracted from solar cells.  
This energy is wasted if MOSFET input source capacitance is operated at low switching frequency so that input source capacitance cannot buffer energy not drawn from panel during switching period.  
Power losses via this method are negligible at very high switching frequency (>50kHz). Therefore when operating at high frequencies in power electronics rectification we calculate energy and efficiency in terms of average energies rather than instantaneous power transfer.  













