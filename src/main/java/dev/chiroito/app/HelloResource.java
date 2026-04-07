package dev.chiroito.app;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;

import java.util.concurrent.TimeUnit;


@Path("/hello")
@ApplicationScoped
public class HelloResource {

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public String hello() {
        String message = superSlowMethod();
        System.out.println(message);
        return message;
    }

    private String superSlowMethod() {
        try {
            TimeUnit.MILLISECONDS.sleep(500);
            return "Hello";
        } catch (Exception e) {
            RuntimeException re = new RuntimeException(e);
            throw re;
        }
    }
}
