<%@page import="java.sql.Timestamp"%>
<%@page import="app.classes.Bids"%>
<%@page import="java.math.BigDecimal"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection, java.sql.PreparedStatement, java.sql.ResultSet"%>
<%@page import="app.classes.DbConnector"%>
<%@page import="app.classes.Item"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>

<%
    int itemId = Integer.parseInt(request.getParameter("id"));
    Integer userId = (Integer) session.getAttribute("user_id");
    Connection conn = DbConnector.getConnection();
    Item item = Item.getItemById(conn, itemId);
    BigDecimal basePrice = item.getPrice();
    BigDecimal currentBid = basePrice;
    long auctionEndTime = 0;

    try {
        String sql = "SELECT MAX(bid_amount) FROM bids WHERE item_id = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, itemId);
        ResultSet rs = ps.executeQuery();
        if (rs.next() && rs.getBigDecimal(1) != null) {
            currentBid = rs.getBigDecimal(1);
        }
        rs.close();
        ps.close();

        // Fetch auction end time
        sql = "SELECT created_at FROM SellItems WHERE id = ?";
        ps = conn.prepareStatement(sql);
        ps.setInt(1, itemId);
        rs = ps.executeQuery();
        if (rs.next()) {
            Date createdAt = rs.getTimestamp("created_at");
            auctionEndTime = createdAt.getTime() + (2 * 60 * 60 * 1000);
        }
        rs.close();
        ps.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }

    BigDecimal newBid = currentBid.add(new BigDecimal(1000));
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sell an Item - WinIt</title>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@600&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/azus.css">
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body>

        <!-- Navbar -->
        <nav class="bg-[#0056D2] text-white">
            <div class="container mx-auto flex justify-between items-center px-4 py-3">
                <a href="user/dash.jsp"><div class="text-[30px] font-bold">Win<span class="text-red-500">It</span></div></a>
                <div class="mr-10">
                    <div class="relative w-[480px]">
                        <input type="text" class="w-full py-2 pl-10 pr-4 rounded-full text-gray-700 focus:outline-none focus:ring-2 focus:ring-blue-300" placeholder="Search for items..."/>
                    </div>
                </div>
                <div class="flex space-x-14 items-center">
                    <a href="user/liveAc.jsp" class="<%= request.getRequestURI().contains("liveAc.jsp") ? "active-link" : "hover-gold"%> text-[20px] font-bold">Live</a>
                    <a href="user/categories.jsp" class="<%= request.getRequestURI().contains("categories.jsp") ? "active-link" : "hover-gold"%> text-[20px] font-bold">Categories</a>
                    <a href="user/topPicks.jsp" class="<%= request.getRequestURI().contains("topPicks.jsp") ? "active-link" : "hover-gold"%> text-[20px] font-bold">Top Picks</a>
                    <a href="item.jsp" class="<%= request.getRequestURI().contains("item.jsp") ? "active-link" : "hover-gold"%> text-[20px] font-bold">Sell an Item</a>
                    <a href="#" class="flex items-center w-8 h-8">
                        <img src="resources/images/howItWork/user.png" alt="User Icon"/>
                    </a>
                </div>
            </div>
        </nav>
        <!-- Main Content -->
        <main class="container mx-auto px-24 py-8">
            <h2 class="text-2xl font-bold mb-8"><%=item.getFirstName()%> </h2>
            <section class="sell-item">
                <div class="container">
                    <div class="card">
                        <div class="left-section">
                            <!-- Display the image -->
                            <img src="${pageContext.request.contextPath}/<%= item.getImage()%>" alt="Item Image">
                        </div>
                        <div class="right-section">
                            <p class="highest-bid">Base price: <strong>Rs.<%= currentBid%></strong></p>
                            <p class="time-remaining">Time remaining: <strong><span id="countdown"></span></strong></p>
                            <form action="placeBid.jsp" method="post">
                                <input type="hidden" name="itemId" value="<%= itemId%>">
                                <input type="hidden" name="userId" value="<%= userId%>">
                                <input type="hidden" name="bidAmount" value="<%= newBid%>">
                                <button id="bid-button" class="bid-button" type="submit">Bid LKR <%= newBid%></button>
                            </form>
                        </div>
                    </div>
                    <div class="details">
                        <h2>Item Description</h2>
                        <p><%= item.getDescription()%></p>
                        <h2>Seller Information</h2>
                        <p><strong>Seller Name:</strong> <%= item.getLastName()%></p>
                        <p><strong>Contact No:</strong> <%= item.getContact()%></p>
                    </div>
                </div>
            </section>
        </main>


        <%
            Connection conn2 = null;
            PreparedStatement ps2 = null;
            ResultSet rs2 = null;
            // Retrieve item ID from URL
            String itemIdParam = request.getParameter("id");
            if (itemIdParam != null && !itemIdParam.trim().isEmpty()) {
                try {
                    itemId = Integer.parseInt(itemIdParam);
                } catch (NumberFormatException e) {
                    itemId = -1; // Fallback to show all items if ID is invalid
                }
            }

            try {
                conn2 = DbConnector.getConnection();

                // Base SQL query
                String bidQuery = "SELECT u.firstName, b.bid_amount, b.bid_time, s.category "
                        + "FROM bids b "
                        + "JOIN user u ON b.user_id = u.id "
                        + "JOIN sellitems s ON b.item_id = s.id "
                        + "WHERE b.item_id " + (itemId != -1 ? "= ?" : "IN (SELECT DISTINCT item_id FROM bids)")
                        + " ORDER BY b.bid_time DESC LIMIT 5";

                ps2 = conn2.prepareStatement(bidQuery);
                if (itemId != -1) {
                    ps2.setInt(1, itemId);
                }

                rs2 = ps2.executeQuery();
        %>

        <!-- Recent Bids Section -->
        <section style="background-color: #f3f4f6; padding: 30px 0; margin-bottom: 30px;">
            <div style="max-width: 1200px; margin: auto; padding: 0 20px;">
                <h2 style="font-size: 24px; font-weight: bold; text-align: center; margin-bottom: 20px;">
                    <%= (itemId != -1) ? "Bids Details" : "Recent Bids"%>
                </h2>
                <div style="overflow-x: auto;">
                    <table style="width: 100%; background-color: white; border-collapse: collapse; border: 1px solid #ddd;">
                        <thead>
                            <tr style="background-color: #007bff; color: white;">
                                <th style="padding: 10px; text-align: left;">Bidder Name</th>
                                <th style="padding: 10px; text-align: left;">Bid Amount (LKR)</th>
                                <th style="padding: 10px; text-align: left;">Bid Time</th>
                                <th style="padding: 10px; text-align: left;">Item Name</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                boolean hasBids = false;
                                while (rs2.next()) {
                                    hasBids = true;
                            %>
                            <tr style="border-bottom: 1px solid #ddd;">
                                <td style="padding: 10px;"><%= rs2.getString("firstName")%></td>
                                <td style="padding: 10px;"><%= rs2.getBigDecimal("bid_amount")%></td>
                                <td style="padding: 10px;"><%= rs2.getTimestamp("bid_time")%></td>
                                <td style="padding: 10px;"><%= rs2.getString("category")%></td>
                            </tr>
                            <% } %>

                            <% if (!hasBids) { %>
                            <tr>
                                <td colspan="4" style="text-align: center; padding: 15px; color: gray;">No bids placed yet.</td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </section>

        <%
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    if (rs2 != null) {
                        rs2.close();
                    }
                } catch (Exception e) {
                }
                try {
                    if (ps2 != null) {
                        ps2.close();
                    }
                } catch (Exception e) {
                }
                try {
                    if (conn2 != null) {
                        conn2.close();
                    }
                } catch (Exception e) {
                }
            }
        %>

        <!-- Footer Section -->
        <section class="bg-[#24384B] text-white py-10 mt-40">
            <div class="max-w-7xl mx-auto px-6">
                <div class="flex flex-col md:flex-row justify-between items-start md:items-center">
                    <!-- Branding and Description -->
                    <div class="mb-6 md:mb-0">
                        <div class="flex items-center mb-4">
                            <span class="text-2xl font-bold">Win<span class="text-red-500">It</span></span>
                        </div>
                        <p class="text-gray-300">WinIt is the leading global platform for online auctions, <br/>featuring local auctions happening today, this weekend, and every day. <br/>Each week, we showcase thousands of fresh listings from a network of over 15,000 auctioneers across the country.</p>
                    </div>
                    <!-- Quick Links -->
                    <div class="flex flex-col md:flex-row md:space-x-10">
                        <div class="mb-6 md:mb-0 pr-36">
                            <h3 class="text-lg font-semibold mb-4">Quick Links</h3>
                            <ul>
                                <li><a href="#" class="text-gray-300 hover:text-yellow-500">Create Account</a></li>
                                <li><a href="#" class="text-gray-300 hover:text-yellow-500">Categories</a></li>
                                <li><a href="#" class="text-gray-300 hover:text-yellow-500">Sell Online</a></li>
                                <li><a href="#" class="text-gray-300 hover:text-yellow-500">About Us</a></li>
                                <li><a href="#" class="text-gray-300 hover:text-yellow-500">Contact Us</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- Copyright and Policies -->
                <div class="flex flex-col md:flex-row justify-between items-center mt-10">
                    <p class="text-gray-400">© WinIt 2024 | All rights reserved</p>
                    <div class="flex space-x-4 mt-4 md:mt-0">
                        <a href="#" class="text-gray-400 hover:text-white">Terms & Conditions</a>
                        <a href="#" class="text-gray-400 hover:text-white">Privacy Policy</a>
                    </div>
                    <div class="flex space-x-4 mt-4 md:mt-0 pr-36">
                        <a href="#"><img src="resources/images/howItWork/facebook.png" alt="Facebook" class="h-6"></a>
                        <a href="#"><img src="resources/images/howItWork/twitter.png" alt="Twitter" class="h-6"></a>
                        <a href="#"><img src="resources/images/howItWork/instagram.png" alt="Instagram" class="h-6"></a>
                    </div>
                </div>
            </div>
        </section>


        <!-- Link JavaScript -->
        <script src="${pageContext.request.contextPath}/js/SellItem.js"></script>
        <script>
            function startCountdown(endTime) {
                function updateCountdown() {
                    var now = new Date().getTime();
                    var timeLeft = endTime - now;

                    if (timeLeft <= 0) {
                        document.getElementById("countdown").innerHTML = "Auction Ended";
                        document.getElementById("countdown").style.color = "red";
                        document.getElementById("bid-button").disabled = true;
                        document.getElementById("bid-button").style.backgroundColor = "gray";
                        document.getElementById("bid-button").innerHTML = "Auction Ended";
                        clearInterval(timer);
                        return;
                    }

                    var hours = Math.floor((timeLeft / (1000 * 60 * 60)) % 24);
                    var minutes = Math.floor((timeLeft / (1000 * 60)) % 60);
                    var seconds = Math.floor((timeLeft / 1000) % 60);

                    document.getElementById("countdown").innerHTML = hours + "h " + minutes + "m " + seconds + "s";
                }

                updateCountdown();
                var timer = setInterval(updateCountdown, 1000);
            }

            var auctionEndTime = <%= auctionEndTime%>;
            startCountdown(auctionEndTime);
        </script>

    </body>
</html>