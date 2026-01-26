# MPPT-Solar-Charge-Controller  
Design and implementation of an MPPT solar charge controller, including circuit theory study, LTspice simulation, and ESP32-based C++ firmware development    
**OBJECTIVE:**  
Design and construct an MPPT charge controller for a 100w solar panel to charge 12V Li-ion battery at high efficiency.  
  
## 01-Circuit Theory Learning   
MPPT & equivalent resistance notes explains much of the fundamental theory behind switching DC-DC circuits that is common across buck, boost, and buck/boost topologies. The operation of each of these circuit topologies is also analysed individually.  
   
My notes on the Circuit Theory relevant to this project can be found [here](01-NOTES_Circuit_Theory_Learning)  
  
## 02-Circuit Design  
### 2.1-Deciding circuit topology  
[Notes on Deciding circuit topology](02-NOTES_Circuit_Design/2.2-Deciding_Circuit_Topology.md)  
   
### 2.2-Circuit Simulation (LTspice & MATLAB)  
[Ideal switch buck converter model](02-notes_Circuit_Design/2.1-Circuit_Simulation/BUCK_TRANSIENT_SIMULATION.asc)  
[MATLAB_BUCK_CONVERTER_MODEL](02-NOTES_Circuit_Design/2.1-Circuit_Simulation/BUCK_CONVERTER_V_OUT_SIMULATION.m)  
  
### 2.3-Component Selection  
-Under development  
  
## 03-Developing Code   
  
### 3.1-MPPT Algorithm Overview  
Notes on MPPT algorithms - Under development   
  
### 3.2-Developing MPPT algorithm  
3.2.1-Pseudocode development  - Under development    
3.2.2-Arduino algorithm development - Under development    
3.2.3-Final C++ algorithm development - Under development  
  
## 04-Testing  
-Hardware testing will commence when Component selection and MPPT algorithm development are complete.  
  
## 05-Conclusions  
Key lessons, tradeoffs, and future improvements.  
  
## 06-References  
[INTRO_TO_SWITCHING_CIRCUITS,_BUCK_CONVERTER_&_PSS](https://ocw.mit.edu/courses/6-622-power-electronics-spring-2023/resources/mit6_622s23_lecture_02_mp4/)  
  
[INTRO_TO_BOOST_CONVERTERS,_INDUCTOR_AND_CAPACITOR_BEHAVIOUR_IN_PSS](https://ocw.mit.edu/courses/6-622-power-electronics-spring-2023/resources/mit6_622s23_lecture_05_mp4/)  
  
[Current_ripple,_DCM](https://ocw.mit.edu/courses/6-622-power-electronics-spring-2023/resources/mit6_622s23_lecture_08_mp4/)  
  
[CMC](https://ocw.mit.edu/courses/6-622-power-electronics-spring-2023/resources/mit6_622s23_lecture_27_mp4/)  
  
[Non-Inverting_4_MOSFET_buck/boost_topology](https://www.youtube.com/watch?v=AG9smav1vy4)
   
[COMPONENT_SELECTION](https://ocw.mit.edu/courses/6-622-power-electronics-spring-2023/resources/mit6_622s23_lecture_07_mp4/)  
(Component selection currently in development)  