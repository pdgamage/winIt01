<%@page import="app.classes.Admin" %>
<%@page import="java.sql.SQLException" %>

<%
    int itemId = 0;
    try {
        itemId = Integer.parseInt(request.getParameter("id"));
    } catch (NumberFormatException e) {
        e.printStackTrace();
        out.println("Invalid item ID.");
        return;
    }

    try {
        boolean isDeleted = Admin.deleteItem(itemId);
        if (isDeleted) {
            response.sendRedirect("admin.jsp");
        } else {
            out.println("No item found with the specified ID.");
        }
    } catch (SQLException e) {
        e.printStackTrace();
        out.println("An error occurred while deleting the item: " + e.getMessage());
    }
%>