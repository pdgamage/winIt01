<%-- 
    Document   : signout
    Created on : Jan 31, 2025, 12:07:22 PM
    Author     : DILSHAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  session.invalidate();
  response.sendRedirect("../index.jsp");

%>