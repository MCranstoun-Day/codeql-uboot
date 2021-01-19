//find al;l macros named  - ntohs, ntohl or ntohll

import cpp

from Macro m
where m.hasName("ntohs") or
m.hasName("ntohl") or 
m.hasName("ntohll") 
select m, "a macro called ntohs/ntohl/ntohll"