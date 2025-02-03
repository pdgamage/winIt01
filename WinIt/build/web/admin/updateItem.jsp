<%@page import="app.classes.DbConnector"%>
<%@ page import="java.sql.*" %>

<%
    int itemId = Integer.parseInt(request.getParameter("id"));
    String firstName = request.getParameter("firstName");
    String lastName = request.getParameter("lastName");
    String contact = request.getParameter("contact");
    String category = request.getParameter("category");
    double price = Double.parseDouble(request.getParameter("price"));
    String description = request.getParameter("description");

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        conn = DbConnector.getConnection();
        String sql = "UPDATE sellitems SET firstName=?, lastName=?, contact=?, category=?, price=?, description=? WHERE id=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, firstName);
        pstmt.setString(2, lastName);
        pstmt.setString(3, contact);
        pstmt.setString(4, category);
        pstmt.setDouble(5, price);
        pstmt.setString(6, description);
        pstmt.setInt(7, itemId);
        pstmt.executeUpdate();

        response.sendRedirect("admin.jsp");
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        if (pstmt != null) {
            pstmt.close();
        }
        if (conn != null) {
            conn.close();
        }
    }
%>