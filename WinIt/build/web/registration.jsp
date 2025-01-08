<%-- 
    Document   : registration
    Created on : Jan 5, 2025, 3:34:02 PM
    Author     : DILSHAN
--%>

<%@page import="app.classes.DbConnector"%>
<%@page import="app.classes.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
String firstName = request.getParameter("firstName");
String lastName = request.getParameter("lastName");
String email = request.getParameter("email");
String password = request.getParameter("password");
String role = "user";


User user = new User(firstName, lastName, email, password, role);
if(user.register(DbConnector.getConnection())){
    response.sendRedirect("SignUp.jsp?s=1");
}else{
    response.sendRedirect("SignUp.jsp?s=0");

}
%>