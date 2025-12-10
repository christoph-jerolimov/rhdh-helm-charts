#!/bin/bash

namespace="default"
serviceaccount="janus-idp-reader"

oc create -n "$namespace" serviceaccount "$serviceaccount"

# kubernetes core
oc create clusterrole janus-idp-kubernetes-core-reader \
    --verb=get,watch,list \
    --resource=pods \
    --resource=pods/log \
    --resource=jobs \
    --resource=cronjobs \
    --resource=ingresses \
    --resource=statefulsets \
    --resource=configmaps \
    --resource=daemonsets \
    --resource=routes \
    --resource=limitranges \
    --resource=resourcequotas \
    --resource=deployments \
    --resource=replicasets \
    --resource=horizontalpodautoscalers \
    --resource=services

# kubernetes metrics
oc create clusterrole janus-idp-kubernetes-metrics-reader \
   --verb=get,watch,list \
   --resource=pods.metrics.k8s.io

# openshift imagestreams
oc create clusterrole janus-idp-openshift-imagestream-reader \
    --verb=get,watch,list \
    --resource=imagestreams.image.openshift.io \
    --resource=imagestreamtags.image.openshift.io

# tekton
oc create clusterrole janus-idp-tekton-reader \
    --verb=get,watch,list \
    --resource=tasks.tekton.dev \
    --resource=taskruns.tekton.dev \
    --resource=pipelines.tekton.dev \
    --resource=pipelineruns.tekton.dev

# kubevirt
oc create clusterrole janus-idp-kubevirt-reader \
    --verb=get,watch,list \
    --resource=virtualmachines.kubevirt.io

oc adm policy add-cluster-role-to-user janus-idp-kubernetes-core-reader -n "$namespace" -z "$serviceaccount"
oc adm policy add-cluster-role-to-user janus-idp-kubernetes-metrics-reader -n "$namespace" -z "$serviceaccount"
oc adm policy add-cluster-role-to-user janus-idp-openshift-imagestream-reader -n "$namespace" -z "$serviceaccount"
oc adm policy add-cluster-role-to-user janus-idp-tekton-reader -n "$namespace" -z "$serviceaccount"
oc adm policy add-cluster-role-to-user janus-idp-kubevirt-reader -n "$namespace" -z "$serviceaccount"
