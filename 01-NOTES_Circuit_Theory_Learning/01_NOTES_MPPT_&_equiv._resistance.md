# Solar MPPT and Equivalent Resistance Theory  
## Summary  
This section describes how equivalent resistance of MPPT circuit is controlled in order to maximise power output from solar panel and dicusses effect of switching frequency on circuit performance.  
  
Converter specific behaviour is discussed in converter notes.  
  
## Objective:  
  
For MPPT stage, we want to extract maximum power from what can be modelled as a non-ideal current source (solar panel).   
   
Since a solar panel cannot output infinite power, we cannot increase the load indefitely and expect the same current.  
There is an optimum resistance across the panel for which we obtain the greatest value for instantaneous power, I*V.  
This optimum resistance can vary depending on local conditions of irradiance and temperature.  
    
To maintain operation at this point, we must dynamically control the apparent load across the solar panel.  

## Controlling the apparent load   
We can control the apparent resistance of a circuit by switching energy storage elements on and off rapidly.  
    
The equivalent input resistance is controlled by varying the fraction of time our switch is on for (Duty Cycle).  
  
For example, if switch is on for 80% of switching period, D=0.8 irrespective of switching frequency.  
  
We use the fact that we can control equivalent input resistance by varying duty cycle to keep solar panel operating point at its Maximum Power Point (MPP).  
  
## Energy flow during switching cycle (In Periodic Steady State (PSS))  
We can store energy as a magnetic field in an inductor during on period and release this energy as a current during off period.  

Rate of change of current during switching cycle is governed by the following formula:
     
V = L * di/dt  
  
As switch is turned on, a voltage is applied across inductor.  
Current will not change instantaneously like it would in a wire but instead change at a rate V/L.  
While switch is off and inductor is disconnected from source, di/dt changes sign.   
Since inductor resists changes in current, voltage is induced across inductor to keep current flowing. This voltage is opposite in sign relative to the EMF across inductor during charging phase.  

As this process is repeated, the system reaches a periodic steady state (PSS) where average inductor voltage per cycle is 0.  
## CCM VS DCM  
   
### CCM  
In CCM, current is continuously flowing through inductor. This is the state assumed in all notes and formulae so far.

### DCM   
When inductor runs out of energy in its magnetic field, it can no longer induce a voltage to keep current flowing. This means that current reaches 0 during inductor discharge of cycle.  
di/dt=V/L,
E=0.5*L*I^2, where L is constant.  
  
(Vin-Vout)*D*T/L=inductor current ripple, where T is switching period.  
**If half the amplitude of inductor ripple current is greater than average current through load, inductor will run out of energy and hence circuit will operate in DCM.** 
So circuit is in DCM when:
Iavg<0.5*(Vin-Vout)*D*T/L
  
Equivalent resistance and Vout formulae in CCM is no longer valid in DCM.  
   
This adds complexity that could be avoided by sizing the inductor appropriately to avoid DCM under all conditions and edge cases, especially low load and low power.  
Further analysis to be completed in "Component selection" to identify required inductance to enforce CCM in all operating scenarios, and decide whether this is practical, or if another approach may be necessary to manage DCM operation.  
   
### Effective resistance seen by the panel   
  
As mentioned above, required equivalent resistance of our MPPT circuit will determine Duty cycle.  
   
This point of optimum equivalent resistance is called maximum power point, or MPP.  
There are three main topologies we can use:  
1-Buck  
2-Boost  
3-Buck/Boost 
Equivalent resistance formula for these converters will each be derived in their respective notes section.  
  
#### Input decoupling for MPP stability  
Whilst MOSFET is open circuit, power is not instantaneously being extracted from solar cells.  
Some of this energy is wasted if capacitance of source is not sufficient to keep panel operating voltage very close to MPP voltage.  
Higher switching frequency reduces source voltage ripple which means more stable operating voltage of solar panel and hence closer operation to MPP on average.  
  
## Notes on switching frequency  
**EFFECT OF MOSFET SWITCHING FREQUENCY ON OUTPUT:**    
Inductor current reduces by slope V(of inductor)/L.  
Shorter switching period means less time per cycle, which limits magnitude of current change per cycle.  
This reduces amplitude of current and voltage ripple.  
   
So higher switching frequency = more stable output voltage and current.  
  
Practically however, with non-ideal MOSFETs there are increased switching losses at higher frequencies. This is a tradeoff which must be considered when designating switching frequency for a converter.  