**org.apache.logging.log4j.core.lookup.StrLookup** 

```
public interface StrLookup {

    String CATEGORY = "Lookup";

    String lookup(String key);

    String lookup(LogEvent event, String key);
}
```

