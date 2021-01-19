
import cpp

//Define MacroInvocation as mi and define Macro as m
from MacroInvocation mi , Macro m 
//join mi = m
where mi.getMacro() = m and
// m = ["","",""]
m.hasName(["ntohs","ntohl","ntohll"])  
//select mi and display note
select mi , "a macro invocation"