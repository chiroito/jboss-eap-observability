package dev.chiroito.app;

import io.micrometer.core.instrument.Counter;
import io.opentelemetry.api.trace.Span;
import io.opentelemetry.api.trace.StatusCode;
import io.opentelemetry.api.trace.Tracer;
import io.opentelemetry.context.Scope;
import jakarta.annotation.PostConstruct;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;
import io.micrometer.core.instrument.MeterRegistry;

import java.util.concurrent.TimeUnit;


@Path("/hello")
@ApplicationScoped
public class HelloResource {

    @Inject
    private MeterRegistry registry;

    @Inject
    private Tracer tracer;

    private Counter counter;

    @PostConstruct
    private void createMeters() {
        counter = Counter
                .builder("hello")
                .description("The cumulative count of 'Hello' messages sent")
                .register(registry);
    }

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public String success() {
        Span span = tracer.spanBuilder("prepare-hello").startSpan();
        try(Scope scope = span.makeCurrent()) {
            counter.increment();
            String message = superSlowMethod();
            return message;
        } catch (RuntimeException e) {
            span.recordException(e);
            span.setStatus(StatusCode.ERROR);
            throw e;
        } finally {
            span.end();
            System.out.println("Hello");
        }
    }

    private String superSlowMethod(){
        Span span = tracer.spanBuilder("super-slow").startSpan();
        try(Scope scope = span.makeCurrent()) {
            TimeUnit.MICROSECONDS.sleep(500);
            return "Hello";
        } catch (Exception e) {
            span.recordException(e);
            span.setStatus(StatusCode.ERROR);
            RuntimeException re = new RuntimeException(e);
            throw re;
        }finally {
            span.end();
        }
    }
}
