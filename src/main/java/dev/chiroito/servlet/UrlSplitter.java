package dev.chiroito.servlet;

public class UrlSplitter {
    public String getDomain(String currentHost) {
        if(currentHost.equals("localhost")) return "";

        int firstDot = currentHost.indexOf(".");

        String routeName = currentHost.substring(0, firstDot);
        String domain = currentHost.substring(firstDot + 1);

        return domain;
    }
}
