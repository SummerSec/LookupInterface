# LookupInterface
CodeQL 寻找 JNDI利用 Lookup接口，寻找更多利用gadget。

* 首先Context和InitialContext的基础之上找到其“**拓展”**类亦或者说是相似类，作用相似功能相似但名字不一样包名不一样。

**接口类**

```
import java

class Context extends  RefType{
    Context(){
        this.hasQualifiedName("javax.naming", "Context")
    }
}

from Interface it
where it.getAMethod().getAParamType() instanceof Context
select it
```

* 实现类

```
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
```



* 在第一步基础上进一步找到其类的使用类（例如JdbcRowSetImpI）。

```
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
```





---

