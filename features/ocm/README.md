# OCM test

1. Install ACM
2. Create MultiClusterHub (and wait until status is installed)
3. Login to the cluster via `oc`
4. Create cluster role:

```sh
oc create clusterrole backstage-ocm-reader \
    --verb=get,watch,list \
    --resource=managedclusters.cluster.open-cluster-management.io \
    --resource=managedclusterinfos.internal.open-cluster-management.io
```

5. Create service account and token:

```sh
oc create -n open-cluster-management serviceaccount backstage-ocm-reader
oc adm policy add-cluster-role-to-user backstage-ocm-reader -n open-cluster-management -z backstage-ocm-reader
oc create -n open-cluster-management token --duration=168h backstage-ocm-reader
```
