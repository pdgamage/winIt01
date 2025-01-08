<%-- 
    Document   : login
    Created on : Jan 5, 2025, 10:59:20 PM
    Author     : DILSHAN
--%>

<%@page import="app.classes.DbConnector"%>
<%@page import="app.classes.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    User user = new User(email, password);
    if (user.authenticate(DbConnector.getConnection())) {

        response.sendRedirect("user/dash.jsp");
    } else {
        response.sendRedirect("index.jsp?s=0");
    }
%>