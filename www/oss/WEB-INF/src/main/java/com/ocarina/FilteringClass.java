package com.ocarina;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Enumeration;
import java.util.logging.Logger;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletInputStream;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebFilter(urlPatterns = { "/oss/ecs/services/ECommerceSOAPTest", "/oss/ecs/services/ECommerceSOAP",
        "/oss/ias/services/IdentityAuthenticationSOAP", "/ecs/log", "/oss/serv/debug", "*" })
public class FilteringClass implements Filter {
    private static final Logger logger = Logger.getLogger(FilteringClass.class.getName());

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        String requestURI = httpRequest.getRequestURI();
        String requestMethod = httpRequest.getMethod();
        String var8;
        if ("POST".equalsIgnoreCase(httpRequest.getMethod())) {
            for (Enumeration headerNames = httpRequest.getHeaderNames(); headerNames
                    .hasMoreElements(); var8 = (String) headerNames.nextElement()) {
            }
        }

        if (requestURI.contains(".jsp")) {
            chain.doFilter(request, response);
        } else {
            byte[] buffer;
            String targetUrl;
            HttpURLConnection connection;
            int statusCode;
            InputStream resStream;
            ServletOutputStream clientOutput;
            if (requestURI.contains("/oss/ccs/download")) {
                targetUrl = "http://127.0.0.1:7557" + requestURI;
                targetUrl = targetUrl.replace("/oss/ccs/download", "/ccs/download");
                connection = (HttpURLConnection) (new URL(targetUrl)).openConnection();
                connection.setDoOutput(true);
                connection.setRequestMethod("GET");
                statusCode = connection.getResponseCode();
                if (statusCode >= 400) {
                    resStream = connection.getErrorStream();
                } else {
                    resStream = connection.getInputStream();
                }

                response.setContentType(connection.getContentType());
                response.setCharacterEncoding("UTF-8");
                response.setContentLength(connection.getContentLength());
                ((HttpServletResponse) response).setStatus(statusCode);
                clientOutput = response.getOutputStream();

                try {
                    buffer = resStream.readAllBytes();
                    clientOutput.write(buffer);
                } catch (Throwable var42) {
                    if (clientOutput != null) {
                        try {
                            clientOutput.close();
                        } catch (Throwable var20) {
                            var42.addSuppressed(var20);
                        }
                    }

                    throw var42;
                }

                if (clientOutput != null) {
                    clientOutput.close();
                }

                connection.disconnect();
            } else if (requestURI.contains("/oss/serv/debug")) {
                ((HttpServletResponse) response).sendRedirect("https://oss-auth.blinklab.com/oss/serv/debug.jsp");
            } else if (requestURI.contains("/oss/trace")) {
                if (httpRequest.getHeader("msg") == null) {
                    ((HttpServletResponse) response).sendError(200, "No message header found!");
                } else {
                    targetUrl = "http://127.0.0.1:8082/trace";
                    connection = (HttpURLConnection) (new URL(targetUrl)).openConnection();
                    connection.setDoOutput(true);
                    connection.setRequestMethod("GET");
                    connection.setRequestProperty("msg", httpRequest.getHeader("msg"));
                    statusCode = connection.getResponseCode();
                    if (statusCode >= 400) {
                        resStream = connection.getErrorStream();
                    } else {
                        resStream = connection.getInputStream();
                    }

                    response.setContentType(connection.getContentType());
                    response.setCharacterEncoding("UTF-8");
                    response.setContentLength(connection.getContentLength());
                    ((HttpServletResponse) response).setStatus(statusCode);
                    clientOutput = response.getOutputStream();

                    try {
                        buffer = resStream.readAllBytes();
                        clientOutput.write(buffer);
                    } catch (Throwable var41) {
                        if (clientOutput != null) {
                            try {
                                clientOutput.close();
                            } catch (Throwable var31) {
                                var41.addSuppressed(var31);
                            }
                        }

                        throw var41;
                    }

                    if (clientOutput != null) {
                        clientOutput.close();
                    }

                    connection.disconnect();
                }
            } else {
                OutputStream output;
                ServletInputStream input;
                if (requestURI.contains("/oss/ecs/log")) {
                    targetUrl = "http://127.0.0.1:8082/ecs/log";
                    connection = (HttpURLConnection) (new URL(targetUrl)).openConnection();
                    connection.setDoOutput(true);
                    connection.setRequestMethod("POST");
                    connection.setRequestProperty("code", httpRequest.getHeader("code"));
                    output = connection.getOutputStream();

                    try {
                        input = request.getInputStream();

                        try {
                            buffer = input.readAllBytes();
                            output.write(buffer);
                        } catch (IOException var52) {
                            if (input != null) {
                                try {
                                    input.close();
                                } catch (IOException var30) {
                                    var52.addSuppressed(var30);
                                }
                            }

                            throw var52;
                        }

                        if (input != null) {
                            input.close();
                        }
                    } catch (IOException var53) {
                        if (output != null) {
                            try {
                                output.close();
                            } catch (IOException var29) {
                                var53.addSuppressed(var29);
                            }
                        }

                        throw var53;
                    }

                    if (output != null) {
                        output.close();
                    }

                    statusCode = connection.getResponseCode();
                    if (statusCode >= 400) {
                        resStream = connection.getErrorStream();
                    } else {
                        resStream = connection.getInputStream();
                    }

                    response.setContentType(connection.getContentType());
                    response.setCharacterEncoding("UTF-8");
                    response.setContentLength(connection.getContentLength());
                    ((HttpServletResponse) response).setStatus(statusCode);
                    clientOutput = response.getOutputStream();

                    try {
                        buffer = resStream.readAllBytes();
                        clientOutput.write(buffer);
                    } catch (IOException var39) {
                        if (clientOutput != null) {
                            try {
                                clientOutput.close();
                            } catch (IOException var24) {
                                var39.addSuppressed(var24);
                            }
                        }

                        throw var39;
                    }

                    if (clientOutput != null) {
                        clientOutput.close();
                    }

                    connection.disconnect();
                } else if (requestURI.contains("ECommerceSOAP")) {
                    targetUrl = "http://127.0.0.1:8443/ecs/services/ECommerceSOAP";
                    connection = (HttpURLConnection) (new URL(targetUrl)).openConnection();
                    connection.setDoOutput(true);
                    connection.setRequestMethod("POST");
                    connection.setRequestProperty("SOAPAction", httpRequest.getHeader("SOAPAction"));
                    output = connection.getOutputStream();

                    try {
                        input = request.getInputStream();

                        try {
                            buffer = input.readAllBytes();
                            output.write(buffer);
                        } catch (IOException var47) {
                            if (input != null) {
                                try {
                                    input.close();
                                } catch (IOException var23) {
                                    var47.addSuppressed(var23);
                                }
                            }

                            throw var47;
                        }

                        if (input != null) {
                            input.close();
                        }
                    } catch (IOException var48) {
                        if (output != null) {
                            try {
                                output.close();
                            } catch (IOException var22) {
                                var48.addSuppressed(var22);
                            }
                        }

                        throw var48;
                    }

                    if (output != null) {
                        output.close();
                    }

                    statusCode = connection.getResponseCode();
                    if (statusCode >= 400) {
                        resStream = connection.getErrorStream();
                    } else {
                        resStream = connection.getInputStream();
                    }

                    response.setContentType(connection.getContentType());
                    response.setCharacterEncoding("UTF-8");
                    response.setContentLength(connection.getContentLength());
                    ((HttpServletResponse) response).setStatus(statusCode);
                    clientOutput = response.getOutputStream();

                    try {
                        buffer = resStream.readAllBytes();
                        clientOutput.write(buffer);
                    } catch (Throwable var49) {
                        if (clientOutput != null) {
                            try {
                                clientOutput.close();
                            } catch (Throwable var27) {
                                var49.addSuppressed(var27);
                            }
                        }

                        throw var49;
                    }

                    if (clientOutput != null) {
                        clientOutput.close();
                    }

                    connection.disconnect();
                } else if (requestURI.contains("ECommerceTest")) {
                    targetUrl = "http://127.0.0.1/ecs/services/ECommerceSOAP";
                    connection = (HttpURLConnection) (new URL(targetUrl)).openConnection();
                    connection.setDoOutput(true);
                    connection.setRequestMethod("POST");
                    connection.setRequestProperty("SOAPAction", httpRequest.getHeader("SOAPAction"));
                    connection.setRequestProperty("Content-Type", httpRequest.getHeader("Content-Type"));
                    output = connection.getOutputStream();

                    try {
                        input = request.getInputStream();

                        try {
                            buffer = input.readAllBytes();
                            output.write(buffer);
                        } catch (Throwable var37) {
                            if (input != null) {
                                try {
                                    input.close();
                                } catch (Throwable var21) {
                                    var37.addSuppressed(var21);
                                }
                            }

                            throw var37;
                        }

                        if (input != null) {
                            input.close();
                        }
                    } catch (Throwable var38) {
                        if (output != null) {
                            try {
                                output.close();
                            } catch (Throwable var15) {
                                var38.addSuppressed(var15);
                            }
                        }

                        throw var38;
                    }

                    if (output != null) {
                        output.close();
                    }

                    statusCode = connection.getResponseCode();
                    if (statusCode >= 400) {
                        resStream = connection.getErrorStream();
                    } else {
                        resStream = connection.getInputStream();
                    }

                    response.setContentType(connection.getContentType());
                    response.setCharacterEncoding("UTF-8");
                    response.setContentLength(connection.getContentLength());
                    ((HttpServletResponse) response).setStatus(statusCode);
                    clientOutput = response.getOutputStream();

                    try {
                        buffer = resStream.readAllBytes();
                        clientOutput.write(buffer);
                    } catch (Throwable var40) {
                        if (clientOutput != null) {
                            try {
                                clientOutput.close();
                            } catch (Throwable var16) {
                                var40.addSuppressed(var16);
                            }
                        }

                        throw var40;
                    }

                    if (clientOutput != null) {
                        clientOutput.close();
                    }

                    connection.disconnect();
                } else if (requestURI.contains("IdentityAuthenticationTest")) {
                    targetUrl = "http://127.0.0.1/ias/services/IdentityAuthenticationSOAP";
                    connection = (HttpURLConnection) (new URL(targetUrl)).openConnection();
                    connection.setDoOutput(true);
                    connection.setRequestMethod("POST");
                    connection.setRequestProperty("SOAPAction", httpRequest.getHeader("SOAPAction"));
                    connection.setRequestProperty("Content-Type", httpRequest.getHeader("Content-Type"));
                    output = connection.getOutputStream();

                    try {
                        input = request.getInputStream();

                        try {
                            buffer = input.readAllBytes();
                            output.write(buffer);
                        } catch (Throwable var43) {
                            if (input != null) {
                                try {
                                    input.close();
                                } catch (Throwable var33) {
                                    var43.addSuppressed(var33);
                                }
                            }

                            throw var43;
                        }

                        if (input != null) {
                            input.close();
                        }
                    } catch (Throwable var44) {
                        if (output != null) {
                            try {
                                output.close();
                            } catch (Throwable var32) {
                                var44.addSuppressed(var32);
                            }
                        }

                        throw var44;
                    }

                    if (output != null) {
                        output.close();
                    }

                    statusCode = connection.getResponseCode();
                    if (statusCode >= 400) {
                        resStream = connection.getErrorStream();
                    } else {
                        resStream = connection.getInputStream();
                    }

                    response.setContentType(connection.getContentType());
                    response.setCharacterEncoding("UTF-8");
                    response.setContentLength(connection.getContentLength());
                    ((HttpServletResponse) response).setStatus(statusCode);
                    clientOutput = response.getOutputStream();

                    try {
                        buffer = resStream.readAllBytes();
                        clientOutput.write(buffer);
                    } catch (Throwable var35) {
                        if (clientOutput != null) {
                            try {
                                clientOutput.close();
                            } catch (Throwable var18) {
                                var35.addSuppressed(var18);
                            }
                        }

                        throw var35;
                    }

                    if (clientOutput != null) {
                        clientOutput.close();
                    }

                    connection.disconnect();
                } else if (requestURI.contains("CatalogingTest")) {
                    targetUrl = "http://127.0.0.1/ias/services/CatalogingSOAP";
                    connection = (HttpURLConnection) (new URL(targetUrl)).openConnection();
                    connection.setDoOutput(true);
                    connection.setRequestMethod("POST");
                    connection.setRequestProperty("SOAPAction", httpRequest.getHeader("SOAPAction"));
                    connection.setRequestProperty("Content-Type", httpRequest.getHeader("Content-Type"));
                    output = connection.getOutputStream();

                    try {
                        input = request.getInputStream();

                        try {
                            buffer = input.readAllBytes();
                            output.write(buffer);
                        } catch (Throwable var50) {
                            if (input != null) {
                                try {
                                    input.close();
                                } catch (Throwable var28) {
                                    var50.addSuppressed(var28);
                                }
                            }

                            throw var50;
                        }

                        if (input != null) {
                            input.close();
                        }
                    } catch (Throwable var51) {
                        if (output != null) {
                            try {
                                output.close();
                            } catch (Throwable var19) {
                                var51.addSuppressed(var19);
                            }
                        }

                        throw var51;
                    }

                    if (output != null) {
                        output.close();
                    }

                    statusCode = connection.getResponseCode();
                    if (statusCode >= 400) {
                        resStream = connection.getErrorStream();
                    } else {
                        resStream = connection.getInputStream();
                    }

                    response.setContentType(connection.getContentType());
                    response.setCharacterEncoding("UTF-8");
                    response.setContentLength(connection.getContentLength());
                    ((HttpServletResponse) response).setStatus(statusCode);
                    clientOutput = response.getOutputStream();

                    try {
                        buffer = resStream.readAllBytes();
                        clientOutput.write(buffer);
                    } catch (Throwable var34) {
                        if (clientOutput != null) {
                            try {
                                clientOutput.close();
                            } catch (Throwable var17) {
                                var34.addSuppressed(var17);
                            }
                        }

                        throw var34;
                    }

                    if (clientOutput != null) {
                        clientOutput.close();
                    }

                    connection.disconnect();
                } else if (requestURI.contains("IdentityAuthenticationSOAP")) {
                    targetUrl = "http://127.0.0.1:8443/ias/services/IdentityAuthenticationSOAP";
                    connection = (HttpURLConnection) (new URL(targetUrl)).openConnection();
                    connection.setDoOutput(true);
                    connection.setRequestMethod("POST");
                    connection.setRequestProperty("SOAPAction", httpRequest.getHeader("SOAPAction"));
                    output = connection.getOutputStream();

                    try {
                        input = request.getInputStream();

                        try {
                            buffer = input.readAllBytes();
                            output.write(buffer);
                        } catch (Throwable var45) {
                            if (input != null) {
                                try {
                                    input.close();
                                } catch (Throwable var26) {
                                    var45.addSuppressed(var26);
                                }
                            }

                            throw var45;
                        }

                        if (input != null) {
                            input.close();
                        }
                    } catch (Throwable var46) {
                        if (output != null) {
                            try {
                                output.close();
                            } catch (Throwable var25) {
                                var46.addSuppressed(var25);
                            }
                        }

                        throw var46;
                    }

                    if (output != null) {
                        output.close();
                    }

                    statusCode = connection.getResponseCode();
                    if (statusCode >= 400) {
                        resStream = connection.getErrorStream();
                    } else {
                        resStream = connection.getInputStream();
                    }

                    response.setContentType(connection.getContentType());
                    response.setCharacterEncoding("UTF-8");
                    response.setContentLength(connection.getContentLength());
                    ((HttpServletResponse) response).setStatus(statusCode);
                    clientOutput = response.getOutputStream();

                    try {
                        buffer = resStream.readAllBytes();
                        clientOutput.write(buffer);
                    } catch (Throwable var36) {
                        if (clientOutput != null) {
                            try {
                                clientOutput.close();
                            } catch (Throwable var14) {
                                var36.addSuppressed(var14);
                            }
                        }

                        throw var36;
                    }

                    if (clientOutput != null) {
                        clientOutput.close();
                    }

                    connection.disconnect();
                } else {
                    chain.doFilter(request, response);
                }
            }
        }
    }

    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("\ud83d\udee0\ufe0f FilteringClass initialized!");
    }

    public void destroy() {
        System.out.println("\ud83d\uded1 FilteringClass destroyed.");
    }
}
