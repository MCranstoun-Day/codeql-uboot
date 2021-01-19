import cpp

class NetworkByteSwap extends Expr {
  NetworkByteSwap () {
    //first define class 
    exists(MacroInvocation mi |
        //Conditions
        //using defined class mi you can access.getMacro which allows access to hasName where we can do our name lookup on macros
        mi.getMacro().hasName(["ntohs","ntohl","ntohll"])  
        and 
        //this current class must equal macroinvocation expressions.
        this = mi.getExpr() 
    )
  } 
}

from NetworkByteSwap n
select n, "Network byte swap" 
