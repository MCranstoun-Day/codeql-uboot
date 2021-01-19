import cpp 
import semmle.code.cpp.dataflow.TaintTracking
import DataFlow::PathGraph


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

  class Config extends TaintTracking::Configuration {
    Config() { this = "NetworkToMemFuncLength" }
  
    override predicate isSource(DataFlow::Node source) {
      // TODO
            source.asExpr() instanceof NetworkByteSwap
    }
    override predicate isSink(DataFlow::Node sink) {
           
        exists(FunctionCall fc|
        
            fc.getTarget().getName() = "memcpy" and
            sink.asExpr() = fc.getArgument(fc.getNumberOfArguments()-1)
        )
            
    }
  }
  
  from Config cfg, DataFlow::PathNode source, DataFlow::PathNode sink
  where cfg.hasFlowPath(source, sink)
  select sink, source, sink, "Network byte swap flows to memcpy"