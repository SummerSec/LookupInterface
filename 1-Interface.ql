import java

class Context extends  RefType{
    Context(){
        this.hasQualifiedName("javax.naming", "Context")
    }
}

from Interface it
where it.getAMethod().getAParamType() instanceof Context
select it