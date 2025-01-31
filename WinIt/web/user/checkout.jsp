<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="app.classes.DbConnector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Checkout</title>
    <!-- Tailwind CSS -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100">

    <%
        // Get user_id from session
        Integer userId = (Integer) session.getAttribute("user_id");

        if (userId == null) {
            response.sendRedirect("index.jsp"); // Redirect if session expired
            return;
        }

        // Database connection
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            con = DbConnector.getConnection();
            String query = "SELECT b.bid_amount, s.id AS item_id, s.category,  " +
                           "s.firstName AS sellerFirstName, s.lastName AS sellerLastName, s.created_at " +
                           "FROM bids b " +
                           "JOIN sellitems s ON b.item_id = s.id " +
                           "WHERE b.user_id = ? " +
                           "AND TIMESTAMPDIFF(MINUTE, s.created_at, NOW()) > 12 " + // Only items older than 12 minutes
                           "ORDER BY b.bid_amount DESC"; // Sorting by highest bid amount

            pstmt = con.prepareStatement(query);
            pstmt.setInt(1, userId);
            rs = pstmt.executeQuery();
    %>

    <div class="max-w-5xl mx-auto mt-10 p-6">
        <h2 class="text-3xl font-bold text-center mb-8">Your Bids</h2>

        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            <%
                boolean hasBids = false;
                while (rs.next()) {
                    hasBids = true;
                    int itemId = rs.getInt("item_id");
                    double highestBid = rs.getDouble("bid_amount");
                    String category = rs.getString("category");
                    String sellerFirstName = rs.getString("sellerFirstName");
                    String sellerLastName = rs.getString("sellerLastName");
            %>

            <!-- Item Card -->
            <div class="bg-white shadow-lg rounded-lg p-6">
                <h3 class="text-xl font-semibold mb-4">Item Details</h3>
                <p><strong>Item ID:</strong> <%= itemId %></p>
                <p><strong>Category:</strong> <%= category %></p>
                <p><strong>Item Name:</strong> <%= sellerFirstName %> </p>
                <p><strong>Seller:</strong><%= sellerLastName %></p>
                <p><strong>Your Highest Bid:</strong> $<%= highestBid %></p>
                <button onclick="proceedToPayment(<%= itemId %>)" class="w-full mt-6 bg-green-500 text-white py-2 px-4 rounded hover:bg-green-600 transition duration-300">
                    Proceed to Payment
                </button>
            </div>

            <%
                }
                if (!hasBids) {
                    out.println("<p class='text-center text-gray-600 col-span-3'>No eligible bids found (items must be older than 12 minutes).</p>");
                }
            %>
        </div>
    </div>

    <script>
        function proceedToPayment(itemId) {
            window.location.href = "payment.jsp?item_id=" + itemId;
        }
    </script>

    <%
        } catch (Exception e) {
            out.println("<p class='text-center text-red-500'>Error: " + e.getMessage() + "</p>");
        } finally {
            // Close resources manually for Java 8 compatibility
            if (rs != null) try { rs.close(); } catch (Exception ignored) {}
            if (pstmt != null) try { pstmt.close(); } catch (Exception ignored) {}
            if (con != null) try { con.close(); } catch (Exception ignored) {}
        }
    %>

</body>
</html>
