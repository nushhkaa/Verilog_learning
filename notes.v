iverilog -o filename.vvp filename.v 
vvp filename.vvp 

we can use testbanch code inside the same file when we dont need another module
eg. block.v file 


initial: gets executed only once, used solely for testbench purpose 

always: hardware ko behaviour model garcha, 
executes for as long as power is on usually 
used in synthesis, like a continuous loop that never terminates 

or, also has a event expression to trigger that block
only has REG variables, 
because it is not continuous, the always block only triggers in that condition
and so, we need reg type to store that value

NET = combinational
REG = sequential 


INITIAL 
begin ..... end  

1st feb, 2025: BLOCK and NON-BLOCK 

we use non-blocking when we wat 3 4 statements to be assigned ekai pali 
the clock will give the required trigger to assign the value, which is what happens in hardware 

mixing both can be difficult 
avoid using both at once 

delay ignored in hardware, so we should keep in mind 
x = y;
x <= x+2; is not allowed , same target cannot have blocking and non blocking assignment