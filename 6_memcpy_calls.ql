import cpp
//Define FuncitonCall "fc" and then define a Function "f" within that fc 
from FunctionCall fc , Function f
//link fc to function target f
where fc.getTarget() = f and
//in Function f we seek functions == "memcpy"
f.getName() = "memcpy" 
//select fc and add note
select fc, "a function call for memcpy"
