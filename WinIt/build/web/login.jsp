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

    // Authenticate user
    User user = new User(email, password);
    if (user.authenticate(DbConnector.getConnection())) {
        // Store user ID in session
        session.setAttribute("user_id", user.getId());

        // Redirect based on user role
        if ("admin".equals(user.getRole())) {
            response.sendRedirect("admin/admin.jsp"); // Redirect to admin dashboard
        } else if("user".equals(user.getRole())) {
            response.sendRedirect("user/dash.jsp"); // Redirect to user dashboard
        }
    } else {
        response.sendRedirect("index.jsp"); // Redirect to login page if authentication fails
    }
%>