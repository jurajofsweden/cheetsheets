# oc - OpenShift CLI

##  Set log-level
```bash
--loglevel 5	                                  # https://blog.openshift.com/oc-command-newbies/
```

##  BuildConfig
```bash
oc delete bc <BuildConfigName>                  # Delete	
oc delete --cascade=false bc <BuildConfigName>  # Delete w/o deleting builds
oc describe bc <BuildConfigName>                # Describe
oc logs -f bc/<BuildConfigName>                 # Logs w/Follow
```
