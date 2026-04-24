package dev.chiroito.servlet;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class UrlSplitterTest {

    String DOMAIN = "observability-demo.apps.o.chiroito.dev";

    @Test
    void getDomain() {
        UrlSplitter splitter = new UrlSplitter();
        Assertions.assertEquals(DOMAIN, splitter.getDomain("my-hello-app.observability-demo.apps.o.chiroito.dev"));
    }
}