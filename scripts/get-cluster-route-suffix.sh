#!/bin/bash

# 1. requires `oc` and `yq`
# 2. `oc` cli must connected to to an OpenShift cluster with
#    read access to `ConfigMap` `cluster-config-v1`
#    in `kube-system` namespace.

set -euo pipefail

# # read install config
# configMap=$(oc get configmap -n kube-system cluster-config-v1 -o yaml)

# # extract from install-config
# installConfig=$(echo "$configMap" | yq '.data.install-config')

# # extract url
# clusterName=$(echo "$installConfig" | yq '.metadata.name')
# clusterBaseDomain=$(echo "$installConfig" | yq '.baseDomain')

# clusterRouteSuffix="apps.$clusterName.$clusterBaseDomain"

# echo "$clusterRouteSuffix"

oc -n openshift-console get routes.route.openshift.io/console -o jsonpath='{.spec.host}' | sed 's/.*\.apps\./apps./g'
