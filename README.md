# JBoss EAP Observability Demo

This demo is a sample application for exploring observability with JBoss EAP 8.1.  
It includes two configurations: one with JBoss EAP alone, and another combining JBoss EAP 8.1 with XP 6.0.

The JBoss EAP-only configuration allows you to examine the observability data provided by the application server out of the box.  
The JBoss EAP 8.1 + XP 6.0 configuration also lets you see how the system behaves when application developers add their own metrics and spans.

This demo can be started locally with Podman Compose, and it can also be deployed and run on OpenShift.

<img src="img/trace.png" width="600">
<img src="img/log.png" width="600">
<img src="img/metrics.png" width="600">
<img src="img/profiling.png" width="600">

## Intended Use Cases

This demo can be used for the following purposes:

* To verify the basic observability behavior of JBoss EAP
* To compare the differences between the JBoss EAP-only configuration and the XP-enabled configuration
* To understand the difference between information provided by the application server and information added by application developers
* To quickly test the behavior locally with Podman Compose
* To test the behavior on OpenShift

## What You Can Explore in This Demo

This demo covers the following observability capabilities:

- Health Check
- Metrics
- Tracing
- Log
- Profiling

The implementation approach for each capability is as follows:

### Health Check
  Uses Eclipse MicroProfile Health.

### Metrics
  The JBoss EAP-only configuration uses Eclipse MicroProfile Metrics.  
  The JBoss EAP 8.1 + XP 6.0 configuration uses Micrometer.

### Tracing
  Uses OpenTelemetry.  
  In the JBoss EAP-only configuration, OpenTelemetry is added as a Java agent.  
  In the JBoss EAP 8.1 + XP 6.0 configuration, the tracing functionality provided by XP is used.

### Log
  GC logs are collected using Unified JVM Logging.

### Profiling
  Uses JDK Flight Recorder.

## Differences Between the Configurations

### JBoss EAP 8.1 Only

This configuration is mainly intended for observing information provided by the application server itself.  
It is designed to examine server-side Health Check, Metrics, Tracing, Log, and Profiling without adding extra application-level implementations.

### JBoss EAP 8.1 + XP 6.0

This configuration allows developers to add metrics and spans from application code, in addition to the information provided by the application server.  
It is therefore suitable when you want to explore observability not only from the server perspective, but also from the application perspective.

## Deployment Options

This demo can be run in the following ways:

- Podman Compose
- OpenShift

## Running with Podman Compose

### JBoss EAP 8.1 on Podman Compose

To start the JBoss EAP-only configuration, run the following command:

```shell
podman compose up -d
````

To stop it, run:

```shell
podman compose down
```

### JBoss EAP 8.1 + XP 6.0 on Podman Compose

To start the JBoss EAP 8.1 + XP 6.0 configuration, run the following command:

```shell
podman compose -f docker-compose-xp.yaml up -d
```

To stop it, run:

```shell
podman compose -f docker-compose-xp.yaml down
```

## Access URL

When deployed with Podman Compose, the application is available at:

* [http://localhost:8080](http://localhost:8080)

## Running on OpenShift (Not Yet Implemented)

This demo can also be deployed and run on OpenShift.
In an OpenShift environment, routes and public URLs depend on the target environment.
For detailed deployment steps and access information, refer to the OpenShift manifests and related documentation.

## Notes

Some of the specifications and implementation approaches differ between the JBoss EAP-only configuration and the XP-enabled configuration.
In particular, Metrics and Tracing use different technologies depending on the configuration, so it is important to choose the appropriate setup based on what you want to verify.
