

import cpp

//Define MacroInvocation as mi and define Macro as m
from MacroInvocation mi , Macro m 
//join mi = m
where mi.getMacro() = m and
// m = ["","",""]
m.hasName(["ntohs","ntohl","ntohll"])  
//select mi expersion and display note
select mi.getExpr() , "an expr that invokes a macro"