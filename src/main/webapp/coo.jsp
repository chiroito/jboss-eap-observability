<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>JBoss EAP Observability Demo w/ Cluster Observability Operator</title>
</head>
<body>
<h2>JBoss EAP Observability Demo w/ Cluster Observability Operator</h2>
<h3>Demo Application</h3>
<ul>
    <li><a href="/api/hello">Hello API</a></li>
</ul>
<h3>Observability</h3>
<ul>
    <li>
        <a href='https://console-openshift-console.${domain}/monitoring/v2/dashboards/view?dashboard=my-metrics-dashboard&project=observability-coo-demo&start=5m&refresh=15s'>Metrics</a>
    </li>
    <li>
        <a href='https://console-openshift-console.${domain}/observe/traces?start=5m&namespace=observability-coo-demo&name=hello-tempo-monolithic&tenant=hello-app-tenant&limit=5000'>Tracing</a>
    </li>
    <li>
        <a href="https://console-openshift-console.${domain}/monitoring/logs?q=%7B+kubernetes_namespace_name%3D%22observability-coo-demo%22+%7D+%7C+json&start=now-5m&end=now">Log</a>
    </li>
    <li><a href="https://my-cryostat-observability-coo-demo.${domain}">JFR</a></li>
</ul>
</body>
</html>
