repo-name=openshift-helm-charts
repo-url=https://charts.openshift.io/

chart-name=openshift-helm-charts/redhat-developer-hub

add-repo:
	helm repo add "${repo-name}" "${repo-url}"

show-chart:
	helm search repo "${chart-name}"

show-versions:
	helm search repo "${chart-name}" --versions

default-values:
	helm show values "${chart-name}"

save-default-values:
	helm show values "${chart-name}" --version 1.0 > helm-charts/1-0-default/default-values.yaml
	helm show values "${chart-name}" --version 1.1 > helm-charts/1-1-default/default-values.yaml
	helm show values "${chart-name}" --version 1.2 > helm-charts/1-2-default/default-values.yaml
	helm show values "${chart-name}" --version 1.3 > helm-charts/1-3-default/default-values.yaml
