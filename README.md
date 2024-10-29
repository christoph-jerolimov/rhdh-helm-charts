# Some [RHDH](https://developers.redhat.com/rhdh) experiments 🧪

For [Backstage](https://backstage.io/) experiments see https://github.com/christoph-jerolimov/backstage-experiments

## Helm Charts

1. Required cli tools: `helm`, `oc` and `yq`

2. `oc` cli must connected to to an OpenShift cluster

   (with read access to `ConfigMap` `cluster-config-v1` in `kube-system` namespace)

3. Copy `github.sample.yaml` to `github.local.yaml` and change the content to enable GitHub authentification.

4. All helm charts automatically create a new namespace by default!

   You should be able to customize the `Makefile` or helm charts before applying them.

5. Use `make` instead of `helm install`

   It automatically applies

   * the correct `global.clusterRouterBase` from the connected cluster,
   * the `github.local.yaml` and
   * depennding on the example other configurations from `values.yaml`

Example:

```
cd helm-charts/bulk-import
make
```
