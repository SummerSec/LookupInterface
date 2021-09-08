import java


class Context extends  RefType{
    Context(){
        this.hasQualifiedName("javax.naming", "Context")
        or
        this.hasQualifiedName("javax.naming", "InitialContext")
        or
        this.hasQualifiedName("org.springframework.jndi", "JndiCallback")
        or 
        this.hasQualifiedName("org.springframework.jndi", "JndiTemplate")
        or
        this.hasQualifiedName("org.springframework.jndi", "JndiLocatorDelegate")
        or
        this.hasQualifiedName("org.apache.shiro.jndi", "JndiCallback")
        or
        this.getQualifiedName().matches("%JndiCallback")
        or
        this.getQualifiedName().matches("%JndiLocatorDelegate")
        or
        this.getQualifiedName().matches("%JndiTemplate")

    }
}

from Class cls
where cls.getASourceSupertype() instanceof Context
or cls.getASupertype() instanceof Context

select cls