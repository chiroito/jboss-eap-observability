oc apply -f openshift\project.yaml
oc apply -f openshift\jfr.yaml
oc apply -f openshift\log.yaml
oc apply -f openshift\metrics.yaml
oc apply -f openshift\trace.yaml
oc apply -f openshift\monitoring.yaml
oc apply -f openshift\application.yaml
oc start-build -n observability-demo hello-app-build-config
