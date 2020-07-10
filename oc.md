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

## Pods
```bash
# List all pods: Namespace,Pod-name,Pod-status
oc get pods -o custom-columns=NAMESPACE:metadata.namespace,POD:metadata.name,STATUS:status.phase
# List all pods: Node,Created,Namespace,Pod (sorted)
oc get pods --no-headers -o custom-columns=NODE:spec.nodeName,CREATED:metadata.creationTimestamp,NAMESPACE:metadata.namespace,POD:metadata.name|sort
# List all pods: Namespace,Pod,Created,Node (sorted)
oc get pods --no-headers -o custom-columns=NAMESPACE:metadata.namespace,POD:metadata.name,CREATED:metadata.creationTimestamp,NODE:spec.nodeName|sort
# List all pods: Namespace,Pod,Created,Status,Node (sorted)
oc get pods --no-headers -o custom-columns=NAMESPACE:metadata.namespace,POD:metadata.name,CREATED:metadata.creationTimestamp,STATUS:status.phase,NODE:spec.nodeName|sort

# List all pods (all namespaces): Namespace,Pod,Created,Status,Node (sorted) > tee to a file
oc get pods --no-headers --all-namespaces -o custom-columns=NAMESPACE:metadata.namespace,POD:metadata.name,CREATED:metadata.creationTimestamp,STATUS:status.phase,NODE:spec.nodeName|sort|tee oc-get-pods--all-namespaces-$(date +%Y-%m-%dT%H-%M-%S).txt


# List all Completed build pods
oc get pods|grep Completed|grep build|awk '{print NR,$1}'

# Delete all Completed build pods
oc get pods|grep Completed|grep build|awk '{system("oc delete pod "$1)}'

# List all pods: Older than 1 day (current namespace)
oc get pods --no-headers -o custom-columns=NAMESPACE:metadata.namespace,POD:metadata.name,CREATED:metadata.creationTimestamp,STATUS:status.phase,NODE:spec.nodeName|sort|awk '$3 <= "'$(date -d 'yesterday' -Ins --utc | sed 's/+0000/Z/')'" { print $0 }'

# List all pods: Older than 1 day (all namespaces)
oc get pods --no-headers --all-namespaces -o custom-columns=NAMESPACE:metadata.namespace,POD:metadata.name,CREATED:metadata.creationTimestamp,STATUS:status.phase,NODE:spec.nodeName|sort|awk '$3 <= "'$(date -d 'yesterday' -Ins --utc | sed 's/+0000/Z/')'" { print $0 }'

# List all pods: Older than 1 day AND Status:Complete(Succeeded) (all namespaces)
oc get pods --no-headers --all-namespaces -o custom-columns=NAMESPACE:metadata.namespace,POD:metadata.name,CREATED:metadata.creationTimestamp,STATUS:status.phase,NODE:spec.nodeName|sort|awk '$3 <= "'$(date -d 'yesterday' -Ins --utc | sed 's/+0000/Z/')'" { print $0 }'|grep Succeeded

# List all pods: All namespaces AND Older than 1 day: Namespace,Pod,Created,Status,Node (sorted) > tee to a file
oc get pods --no-headers --all-namespaces -o custom-columns=NAMESPACE:metadata.namespace,POD:metadata.name,CREATED:metadata.creationTimestamp,STATUS:status.phase,NODE:spec.nodeName|sort|awk '$3 <= "'$(date -d 'yesterday' -Ins --utc | sed 's/+0000/Z/')'" { print $0 }'|tee oc-get-pods--all-namespaces--1-day-old--$(date +%Y-%m-%dT%H-%M-%S).txt
```
