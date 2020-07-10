#!/usr/bin/env bash

     OUTPUTFILE_NAME="oc-cluster-pods-stat"
OUTPUTFILE_TIMESTAMP=`date +%Y-%m-%d--%H.%M.%S`
      OUTPUTFILE_ALL="$OUTPUTFILE_NAME--$OUTPUTFILE_TIMESTAMP.txt"
   OUTPUTFILE_BUILDS="$OUTPUTFILE_NAME--$OUTPUTFILE_TIMESTAMP-builds.txt"
  OUTPUTFILE_DEPLOYS="$OUTPUTFILE_NAME--$OUTPUTFILE_TIMESTAMP-deploys.txt"

# List all pods: Namespace,Pod,Created,Status,Node (sorted)
#  - All namespaces
echo "----------------------------------------------------------------------"
echo "Listing ALL    pods... --> $OUTPUTFILE_ALL"
oc get pods --no-headers --all-namespaces -o custom-columns=NAMESPACE:metadata.namespace,POD:metadata.name,CREATED:metadata.creationTimestamp,STATUS:status.phase,NODE:spec.nodeName|sort > $OUTPUTFILE_ALL

echo "Listing BUILD  pods... --> $OUTPUTFILE_BUILDS";   grep '\-build'  $OUTPUTFILE_ALL > $OUTPUTFILE_BUILDS
echo "Listing DEPLOY pods... --> $OUTPUTFILE_DEPLOYS";  grep '\-deploy' $OUTPUTFILE_ALL > $OUTPUTFILE_DEPLOYS
echo "----------------------------------------------------------------------"

for age in '1days' '3days' '1week'; do
  AGE_TIMESTAMP="now-$age"
  echo "Successful Builds  ($age old) : $(grep 'Succeeded' $OUTPUTFILE_BUILDS  | awk '$3 <= "'$(date -d $AGE_TIMESTAMP -Ins --utc | sed 's/+0000/Z/')'" { print $0 }' | wc -l)"
  echo "Failed     Builds  ($age old) : $(grep 'Failed'    $OUTPUTFILE_BUILDS  | awk '$3 <= "'$(date -d $AGE_TIMESTAMP -Ins --utc | sed 's/+0000/Z/')'" { print $0 }' | wc -l)"
  echo "Successful Deploys ($age old) : $(grep 'Succeeded' $OUTPUTFILE_DEPLOYS | awk '$3 <= "'$(date -d $AGE_TIMESTAMP -Ins --utc | sed 's/+0000/Z/')'" { print $0 }' | wc -l)"
  echo "Failed     Deploys ($age old) : $(grep 'Failed'    $OUTPUTFILE_DEPLOYS | awk '$3 <= "'$(date -d $AGE_TIMESTAMP -Ins --utc | sed 's/+0000/Z/')'" { print $0 }' | wc -l)"
  echo "----------------------------------------------------------------------"
done
