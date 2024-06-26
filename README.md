LABE XPERIMENTS

AIM: To simulate and synthesis Logic Gates,Adders and Subtractor using vivado 2023.2

APPARATUS REQUIRED:vivado 2023.2

PROCEDURE:1. Open Vivado: Launch Xilinx Vivado software on your computer.

2. Create a New Project: Click on "Create Project" from the welcome page or navigate through "File" > "Project" > "New".

3. Project Settings: Follow the prompts to set up your project. Specify the project name, location, and select RTL project type.

4. Add Design Files: Add your Verilog design files to the project. You can do this by right-clicking on "Design Sources" in the Sources window, then selecting "Add Sources". Choose your Verilog files from the file browser.

5. Specify Simulation Settings: Go to "Simulation" > "Simulation Settings". Choose your simulation language (Verilog in this case) and simulation tool (Vivado Simulator).

6. Run Simulation: Go to "Flow" > "Run Simulation" > "Run Behavioral Simulation". This will launch the Vivado Simulator and compile your design for simulation.

7. Set Simulation Time: In the Vivado Simulator window, set the simulation time if it's not set automatically. This determines how long the simulation will run.

8. Run Simulation: Start the simulation by clicking on the "Run" button in the simulation window.

9. View Results: After the simulation completes, you can view waveforms, debug signals, and analyze the behavior of your design.
Logic Diagram :

Logic Gates:
![image](https://github.com/navaneethans/VLSI-LAB-EXPERIMENTS/assets/6987778/ee17970c-3ac9-4603-881b-88e2825f41a4)


Half Adder:

![image](https://github.com/navaneethans/VLSI-LAB-EXPERIMENTS/assets/6987778/0e1ecb96-0c25-4556-832b-aeeedfdfe7b9)


Full adder:

![image](https://github.com/navaneethans/VLSI-LAB-EXPERIMENTS/assets/6987778/9bb3964c-438f-469d-a3de-c1cca6f323fb)


Half Subtractor:

![image](https://github.com/navaneethans/VLSI-LAB-EXPERIMENTS/assets/6987778/731470b7-eb4e-49f8-8bb7-2994052a7184)



Full Subtractor:

![image](https://github.com/navaneethans/VLSI-LAB-EXPERIMENTS/assets/6987778/d66f874b-c1f2-44b3-a035-7149b56430c1)



8 Bit Ripple Carry Adder

![image](https://github.com/navaneethans/VLSI-LAB-EXPERIMENTS/assets/6987778/7385a408-40a5-4203-8050-b72818622d79)



VERILOG CODE:

FULL ADDER
~~~
module fulladder(sum,cout, a,b,c);
input a,b,c;
output sum,cout;
  wire w1,w2,w3,w4,w5;
  xor x1(w1,a,b);
  xor x2(sum,w1,c);  
  and a1(w2,a,b);
  and a2(w3,b,c);
  and a3(w4,a,c);
  
  or o1(w5,w2,w3);
  or o2(cout,w5,w4);
    
endmodule
~~~

OUTPUT:

![image](https://github.com/devasrimathi2004/VLSI-LAB-EXP-1/assets/166363441/1e9d273d-f9dd-47c7-94cf-23618c97e8f5)
![image](https://github.com/devasrimathi2004/VLSI-LAB-EXP-1/assets/166363441/2441f375-c38a-4f59-a941-729c963cf852)


OUTPUT:

FULLSUBTRACTOR:
~~~
module half_subtractor( D,Bo,A,B);
input A,B;
output D,Bo;
assign D = A^B;
assign Bo = (~A)&B;
endmodule
~~~

OUTPUT:

![image](https://github.com/devasrimathi2004/VLSI-LAB-EXP-1/assets/166363441/2412fa4a-745e-4857-897e-24e7b3272981)
![image](https://github.com/devasrimathi2004/VLSI-LAB-EXP-1/assets/166363441/c4b6d4ee-2fdc-4db9-8e55-2968ebbb326f)

HALFADDER:
~~~
module half_adder(a,b,sum,carry);
input a,b;
output sum,carry; // sum and carry
assign sum = a^b;
assign carry = a&b ;
endmodule
~~~

OUTPUT:

![image](https://github.com/devasrimathi2004/VLSI-LAB-EXP-1/assets/166363441/5934d13e-a48b-46a6-9543-bc919b1df830)
![image](https://github.com/devasrimathi2004/VLSI-LAB-EXP-1/assets/166363441/fee80903-199d-4321-9e8a-9306ec240313)

HALFSUBTRACTOR:
~~~
module half_subtractor( D,Bo,A,B);
input A,B;
output D,Bo;
assign D = A^B;
assign Bo = (~A)&B;
endmodule
~~~

OUTPUT:

![image](https://github.com/devasrimathi2004/VLSI-LAB-EXP-1/assets/166363441/4c934617-22ea-4714-a08d-2df78d14d356)
![image](https://github.com/devasrimathi2004/VLSI-LAB-EXP-1/assets/166363441/8f75136a-8710-46b6-b23f-52c68ab4d0c9)

LOGICGATES:
~~~
module logicgates(a,b,andgate,orgate,xorgate,nandgate,norgate,xnorgate,notgate);
input a,b;
output andgate,orgate,xorgate,nandgate,norgate,xnorgate,notgate;
and(andgate,a,b);
or(orgate,a,b);
xor(xorgate,a,b);
nand(nandgate,a,b);  
nor(norgate,a,b);
xnor(xnorgate,a,b);
not(notgate,a);
endmodule
~~~

OUTPUT:

![image](https://github.com/devasrimathi2004/VLSI-LAB-EXP-1/assets/166363441/761c06e9-4583-4a26-bea0-f7a838dd8610)
![image](https://github.com/devasrimathi2004/VLSI-LAB-EXP-1/assets/166363441/522cbf52-a178-4c69-b0ee-68d8ed87f1cd)


RIPPLECARRYADDER_4BIT:
~~~
module rippe_adder(S, Cout, X, Y,Cin);
 input [3:0] X, Y;// Two 4-bit inputs
 input Cin;
 output [3:0] S;
 output Cout;
 wire w1, w2, w3;
 // instantiating 4 1-bit full adders in Verilog
 fulladder u1(S[0], w1,X[0], Y[0], Cin);
 fulladder u2(S[1], w2,X[1], Y[1], w1);
 fulladder u3(S[2], w3,X[2], Y[2], w2);
 fulladder u4(S[3], Cout,X[3], Y[3], w3);
endmodule

module fulladder(S, Co, X, Y, Ci);
  input X, Y, Ci;
  output S, Co;
  wire w1,w2,w3;
  //Structural code for one bit full adder
  xor G1(w1, X, Y);
  xor G2(S, w1, Ci);
  and G3(w2, w1, Ci);
  and G4(w3, X, Y);
  or G5(Co, w2, w3);
endmodule
~~~

OUTPUT:

![image](https://github.com/devasrimathi2004/VLSI-LAB-EXP-1/assets/166363441/8a4309a1-681a-4c25-a835-5e66bca4b755)
![image](https://github.com/devasrimathi2004/VLSI-LAB-EXP-1/assets/166363441/34407067-94d9-4e25-99d0-c96c7d1ebbb3)

RIPPLECRRYADDER_8BIT:
~~~
module fulladder(S, Co, X, Y, Ci);
  input X, Y, Ci;
  output S, Co;
  wire w1,w2,w3;
  //Structural code for one bit full adder
  xor G1(w1, X, Y);
  xor G2(S, w1, Ci);
  and G3(w2, w1, Ci);
  and G4(w3, X, Y);
  or G5(Co, w2, w3);
endmodule

module fulladder(S, Co, X, Y, Ci);
  input X, Y, Ci;
  output S, Co;
  wire w1,w2,w3;
  //Structural code for one bit full adder
  xor G1(w1, X, Y);
  xor G2(S, w1, Ci);
  and G3(w2, w1, Ci);
  and G4(w3, X, Y);
  or G5(Co, w2, w3);
endmodule
~~~

OUTPUT:

![image](https://github.com/devasrimathi2004/VLSI-LAB-EXP-1/assets/166363441/425f5294-f096-44e1-aac5-c90f0dd2087e)
![image](https://github.com/devasrimathi2004/VLSI-LAB-EXP-1/assets/166363441/fac6908f-2f08-473a-af96-ba5272822884)

RESULT:Hence the fulladder,fullsubractor,halfadder,halfsubractor,logicgates,ripplecarryadder_8 ,ripplecarryadder_4 are simulated and synthesised using vivado 2023.1.

