<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>JBoss EAP Observability Demo on Cluster Observability Operator</title>
</head>
<body>
<h2>JBoss EAP Observability Demo on Cluster Observability Operator</h2>
<h3>Demo Application</h3>
<ul>
    <li><a href="/api/hello">Hello API</a></li>
</ul>
<h3>Observability</h3>
<ul>
    <li>
        <a href='https://console-openshift-console.${domain}/monitoring/v2/dashboards/view?dashboard=my-metrics-dashboard'>Metrics</a>
    </li>
    <li>
        <a href='https://console-openshift-console.${domain}/observe/traces?start=5m&namespace=observability-coo-demo&name=hello-tempo-monolithic&tenant=hello-app-tenant&limit=5000'>Tracing</a>
    </li>
    <li>
        <a href="https://console-openshift-console.${domain}/monitoring/logs">Log</a>
    </li>
    <li><a href="https://my-cryostat-observability-coo-demo.${domain}">JFR</a></li>
</ul>
</body>
</html>
