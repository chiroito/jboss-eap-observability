oc apply -f ./openshift-coo/project.yaml
oc apply -f ./openshift-coo/jfr.yaml
oc apply -f ./openshift-coo/log.yaml
oc apply -f ./openshift-coo/metrics.yaml
oc apply -f ./openshift-coo/trace.yaml
oc apply -f ./openshift-coo/monitoring.yaml
oc apply -f ./openshift-coo/application.yaml
oc start-build -n observability-coo-demo hello-app-build-config
