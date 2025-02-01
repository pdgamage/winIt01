<%@page import="app.classes.DbConnector"%>
<%@page import="java.util.List"%>
<%@page import="app.classes.Item"%>
<%@page import="java.sql.*, java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%!
    Item item = new Item();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>WinIt - Live Auctions</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
        <style>
            .hover-gold:hover {
                color: #F5A623;
            }
            .active-link {
                color: #F5A623;
            }
        </style>
    </head>
    <body class="bg-[#EEEEEE]">

        <!-- Navbar -->
        <nav class="bg-[#0056D2] text-white">
            <div class="container mx-auto flex justify-between items-center px-4 py-3 whitespace-nowrap">
                <a href="dash.jsp"><div class="text-[30px] font-bold">Win<span class="text-red-500">It</span></div></a>
                <!-- Search Area -->
                <div class="mr-10">
                    <div class="relative w-[400px]">
                        <input 
                            type="text" 
                            class="w-full py-2 pl-10 pr-4 rounded-full text-gray-700 focus:outline-none focus:ring-2 focus:ring-blue-300" 
                            placeholder="Search for items..."
                            />
                    </div>
                </div>
                <div class="flex space-x-10 items-center">
                    <a href="liveAc.jsp" class="<%= request.getRequestURI().contains("liveAc.jsp") ? "active-link" : "hover-gold"%> text-[18px] font-bold">Live</a>
                    <a href="categories.jsp" class="<%= request.getRequestURI().contains("categories.jsp") ? "active-link" : "hover-gold"%> text-[18px] font-bold">Categories</a>
                    <a href="topPicks.jsp" class="<%= request.getRequestURI().contains("topPicks.jsp") ? "active-link" : "hover-gold"%> text-[18px] font-bold">Top Picks</a>
                    <a href="../item.jsp" class="<%= request.getRequestURI().contains("item.jsp") ? "active-link" : "hover-gold"%> text-[18px] font-bold">Sell an Item</a>
                    <a href="#" class="flex items-center w-8 h-8">
                        <img src="../resources/images/howItWork/user.png" alt="User Icon"/>
                    </a>
                </div>
            </div>
        </nav>

        <!-- Main Content -->
        <main class="container mx-auto px-24 py-8">
            <div class="flex items-center text-gray-500 font-medium text-sm mt-2">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-1" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                <path stroke-linecap="round" stroke-linejoin="round" d="M15 19l-7-7 7-7" />
                </svg>
                <a href="dash.jsp" class="hover:underline">Back to Home</a>
            </div>
            <h2 class="text-2xl font-bold mb-8">Live Auctions</h2>

            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 justify-items-center gap-6">
                <%
                    List<Item> itemlist = item.getAllItems(DbConnector.getConnection());
                    for (Item i : itemlist) {
                        long auctionEndTime = 0;
                        try {
                            Connection conn = DbConnector.getConnection();
                            String sql = "SELECT created_at FROM SellItems WHERE id = ?";
                            PreparedStatement stmt = conn.prepareStatement(sql);
                            stmt.setInt(1, i.getId());
                            ResultSet rs = stmt.executeQuery();

                            if (rs.next()) {
                                Timestamp createdAt = rs.getTimestamp("created_at");
                                if (createdAt != null) {
                                    long createdTime = createdAt.getTime();
                                    auctionEndTime = createdTime + (1 * 10 * 60 * 1000); // 2 hours auction
                                }
                            }

                            stmt.close();
                            conn.close();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                %>
                <div class="w-56 bg-white rounded-xl shadow-lg overflow-hidden h-max">
                    <span id="countdown-<%= i.getId()%>" class="top-1 ml-[110px] bg-white rounded-lg px-2 py-1 text-sm text-orange-500 font-medium">
                        Loading...
                    </span>
                    <div class="relative">
                        <img src="${pageContext.request.contextPath}/<%= i.getImage() %>" class="w-full h-48 object-cover p-2 rounded-lg" alt="Item Image">
                    </div>
                    <div class="p-4">
                        <h3 class="font-medium text-gray-900"><%= i.getFirstName()%></h3>
                        <div class="flex justify-between items-center mt-2">
                            <div class="flex space-x-[35px]">
                                <p class="font-semibold">Rs.<%= i.getPrice()%></p>
                                <p class="text-sm text-gray-500"><%= i.getCategory()%></p>
                            </div>
                        </div>
                        <a href="../azus.jsp?id=<%= i.getId()%>">
                            <button class="w-full mt-3 bg-blue-600 text-white py-2 rounded-lg text-sm font-medium hover:bg-blue-700">Place your bid</button>
                        </a>
                    </div>
                </div>

                <script>
                    function startCountdown(endTime, elementId) {
                        function updateCountdown() {
                            var now = new Date().getTime();
                            var timeLeft = endTime - now;

                            if (timeLeft <= 0) {
                                document.getElementById(elementId).innerHTML = "Auction Ended";
                                clearInterval(timer);
                                return;
                            }

                            var hours = Math.floor((timeLeft / (1000 * 60 * 60)) % 24);
                            var minutes = Math.floor((timeLeft / (1000 * 60)) % 60);
                            var seconds = Math.floor((timeLeft / 1000) % 60);

                            document.getElementById(elementId).innerHTML = hours + "h " + minutes + "m " + seconds + "s";
                        }

                        updateCountdown(); // Call immediately to prevent delay
                        var timer = setInterval(updateCountdown, 1000);
                    }

                    var auctionEndTime = <%= auctionEndTime%>; // Time from server
                    startCountdown(auctionEndTime, "countdown-<%= i.getId()%>");
                </script>
                <%
                    }
                %>
            </div>
        </main>

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
                    <p class="text-gray-400">© WinIt 2025 | All rights reserved</p>
                    <div class="flex space-x-4 mt-4 md:mt-0">
                        <a href="#" class="text-gray-400 hover:text-white">Terms & Conditions</a>
                        <a href="#" class="text-gray-400 hover:text-white">Privacy Policy</a>
                    </div>
                    <div class="flex space-x-4 mt-4 md:mt-0 pr-36">
                        <a href="#"><img src="../resources/images/howItWork/facebook.png" alt="Facebook" class="h-6"></a>
                        <a href="#"><img src="../resources/images/howItWork/twitter.png" alt="Twitter" class="h-6"></a>
                        <a href="#"><img src="../resources/images/howItWork/instagram.png" alt="Instagram" class="h-6"></a>
                    </div>
                </div>
            </div>
        </section>

    </body>
</html>