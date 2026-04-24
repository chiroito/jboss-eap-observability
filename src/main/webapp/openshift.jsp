<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>JBoss EAP Observability Demo on OpenShift</title>
</head>
<body>
<h2>JBoss EAP Observability Demo on OpenShift</h2>
<h3>Demo Application</h3>
<ul>
    <li><a href="/api/hello">Hello API</a></li>
</ul>
<h3>Observability</h3>
<ul>
    <li>
        <a href='https://my-grafana-route-observability-demo.${domain}/a/grafana-metricsdrilldown-app/drilldown'>Metrics (Grafana + userWorkload)</a>
    </li>
    <li>
        <a href='https://my-grafana-route-observability-demo.${domain}/a/grafana-exploretraces-app/explore?actionView=traceList'>Tracing (Grafana + Tempo)</a>
    </li>
    <li>
        <a href="https://my-grafana-route-observability-demo.${domain}/a/grafana-lokiexplore-app/explore/service/hello-app/logs?var-filters=service_name%7C%3D%7Chello-app">Log (Grafana + Loki)</a>
    </li>
    <li><a href="https://my-cryostat-observability-demo.${domain}">JFR</a></li>
</ul>
</body>
</html>
