<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="app.classes.DbConnector"%>
<%@page import="app.classes.Item"%>

<%
    Item item = new Item();
    // Retrieve form parameters
    int itemId = Integer.parseInt(request.getParameter("itemId"));
    int userId = Integer.parseInt(request.getParameter("userId"));
    BigDecimal bidAmount = new BigDecimal(request.getParameter("bidAmount"));

    Connection conn = null;
    PreparedStatement ps = null;
    boolean success = false;

    try {
        // Establish DB connection
        conn = DbConnector.getConnection();

        // Insert the bid into the bids table
        String sql = "INSERT INTO bids (item_id, user_id, bid_amount) VALUES (?, ?, ?)";
        ps = conn.prepareStatement(sql);
        ps.setInt(1, itemId);
        ps.setInt(2, userId);
        ps.setBigDecimal(3, bidAmount);

        int rowsAffected = ps.executeUpdate();
        if (rowsAffected > 0) {
            success = true;
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    if (success) {
        // Get the previous page URL and append ?s=1 for success
        String previousPage = request.getHeader("Referer");
        if (previousPage != null) {
            // Append ?s=1 if no query parameters exist, otherwise append &s=1
            if (previousPage.contains("?")) {
                response.sendRedirect(previousPage + "&s=1");
            } else {
                response.sendRedirect(previousPage + "?s=1");
            }
        } else {
            response.sendRedirect("azus.jsp?s=1"); // Fallback to default page with success flag
        }
    } else {
        out.println("<p>Failed to place bid. Please try again.</p>");
    }
%>
