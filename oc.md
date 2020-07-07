# oc - OpenShift CLI

##  Set log-level
```bash
--loglevel 5                                          # https://blog.openshift.com/oc-command-newbies/
```

## Registry	(minishift/CDK)
```bash
minishift openshift registry                          # View host name and port
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

## Image Stream
```bash
oc describe is                                            # Describe
oc describe is -n openshift                               # All Image Streams in a specific Namespace
oc describe is -n openshift java                          # Specific Image Stream in a specific Namespace
oc describe is -n openshift redhat-openjdk18-openshift    # Specific Image Stream in a specific Namespace
oc describe is -n openshift |grep 'Name:'                 # All Image Streams Names in a specific Namespace
oc describe is -n openshift |grep 'Name:' |grep 'java'    # Specific Image Stream Name in a specific Namespace
oc describe is -n openshift |grep 'Name:' |grep 'jdk'     # Specific Image Stream Name in a specific Namespace
```
			
## Resources
```bash
oc get --show-labels all  # List w/labels	
```

## Secrets
```bash
oc create secret generic <secret-name> --ssh-privatekey=~/.ssh/id_rsa    # Create a secret
oc delete secret         <secret-name>                                   # Delete	a secret
oc get secrets                                                           # List	secrets
```
			
## Project
```bash
oc new-project NAME [--display-name=DISPLAYNAME] [--description=DESCRIPTION] [flags]
```
			
## Templates
```bash
oc get      template -n openshift      # List templates
oc describe template -n openshift      # Describe templates
```

## IP Addresses
```bash
oc get nodes -o wide                        # Internal and external IPs of nodes
oc get pods  -o wide                        # IPs of pods
oc get pods  -o wide --all-namespaces       # IPs of pods - for all namespaces
oc get svc                                  # Cluster and External IPs of services (containers)
oc get svc           --all-namespaces       # Cluster and External IPs of services (containers)  - for all namespaces
```
