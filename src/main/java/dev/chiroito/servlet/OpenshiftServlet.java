package dev.chiroito.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "Observability Demo", urlPatterns = "/openshift")
public class OpenshiftServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UrlSplitter splitter = new UrlSplitter();
        request.setAttribute("domain", splitter.getDomain(request.getServerName()));

        String mode = request.getParameter("mode");
        if(mode == null || mode.equals("openshift")) {
            request.getRequestDispatcher("/openshift.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("/coo.jsp").forward(request, response);
        }

    }
}
