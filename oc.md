# oc - OpenShift CLI

##  Set log-level
```bash
--loglevel 5	                                        # https://blog.openshift.com/oc-command-newbies/
```

##  BuildConfig
```bash
oc delete   bc <build-config-name>                    # Delete	
oc delete   bc <build-config-name> --cascade=false    # Delete w/o deleting builds
oc describe bc <build-config-name>                    # Describe
oc logs -f  bc/<build-config-name>                    # Logs w/follow
```

##  Build
```bash
oc start-build  <build-config-name>                   # Start a build
oc start-build  <build-config-name> --follow          # Start a build and follow	
oc cancel-build <build-name>                          # Cancel a build
oc describe     build <build-name>                    # Describe
oc logs -f      build/<build_name>                    # Logs w/follow	
oc secrets link builder mysecret                      # Builds are run with the builder service account, which must have access to any source clone secrets used.	
                                                      # oc create secret new-sshauth github-my-sshkey --ssh-privatekey=/K/.ssh/id_rsa
oc secrets link builder github-my-sshkey
```
