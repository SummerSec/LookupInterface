/**
 *@name Tainttrack Context lookup
 *@king path-problem
 */

import java
import semmle.code.java.dataflow.FlowSources
import DataFlow::PathGraph




class Context extends  RefType{
    Context(){
        this.hasQualifiedName("javax.naming", "Context")
        or
        this.hasQualifiedName("javax.naming", "InitialContext")
    }
}

predicate isLookup(Expr arg) {
    exists(MethodAccess ma |
        ma.getMethod().getName() = "lookup"
        and
        ma.getMethod().getDeclaringType() instanceof Context
        and
        arg = ma.getArgument(0)
    )
}



class TainttrackLookup  extends TaintTracking::Configuration {
    TainttrackLookup() { 
        this = "TainttrackLookup" 
    }
    
    override predicate isSource(DataFlow::Node source) {
        source instanceof RemoteFlowSource
    }
    
    override predicate isSink(DataFlow::Node sink) {
        exists(Expr arg |
            isLookup(arg)
            and
            sink.asExpr() = arg
        )
    }
} 

from TainttrackLookup config , DataFlow::PathNode source, DataFlow::PathNode sink
where
    config.hasFlowPath(source, sink)
select sink.getNode(), source, sink, "unsafe lookup", source.getNode(), "this is user input"