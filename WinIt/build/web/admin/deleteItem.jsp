<%@page import="app.classes.DbConnector"%>
<%@ page import="java.sql.*" %>

<%
    int itemId = 0;
    try {
        itemId = Integer.parseInt(request.getParameter("id"));
    } catch (NumberFormatException e) {
        e.printStackTrace();
        out.println("Invalid item ID.");
        return;
    }

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        conn = DbConnector.getConnection();
        if (conn == null) {
            out.println("Failed to connect to the database.");
            return;
        }

        // Step 1: Delete related rows from the `bids` table
        String deleteBidsSql = "DELETE FROM bids WHERE item_id = ?";
        pstmt = conn.prepareStatement(deleteBidsSql);
        pstmt.setInt(1, itemId);
        pstmt.executeUpdate();

        // Step 2: Delete the item from the `sellitems` table
        String deleteItemSql = "DELETE FROM sellitems WHERE id = ?";
        pstmt = conn.prepareStatement(deleteItemSql);
        pstmt.setInt(1, itemId);
        int rowsAffected = pstmt.executeUpdate();

        if (rowsAffected > 0) {
            out.println("Item and related bids deleted successfully.");
        } else {
            out.println("No item found with the specified ID.");
        }

        response.sendRedirect("admin.jsp");

    } catch (SQLException e) {
        e.printStackTrace();
        out.println("An error occurred while deleting the item: " + e.getMessage());
    } finally {
        if (pstmt != null) {
            try {
                pstmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>