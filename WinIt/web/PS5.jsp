<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.*, java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%!
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>

<%
    long auctionEndTime = 0;
    try {
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/your_db", "your_user", "your_password");
        String sql = "SELECT created_at FROM SellItems WHERE id = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, 1); // Replace with dynamic item ID
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            Timestamp createdAt = rs.getTimestamp("created_at");
            if (createdAt != null) {
                long createdTime = createdAt.getTime();
                auctionEndTime = createdTime + (1 * 10 * 60 * 1000); // 2-hour auction
            }
        }

        stmt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
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

    <main class="container mx-auto px-24 py-8">
        <h2 class="text-2xl font-bold mb-8">PlayStation 5</h2>

        <section class="sell-item">
            <div class="container">
                <div class="card">
                    <div class="left-section">
                        <img src="images/img1.jpg" alt="PlayStation 5">
                    </div>
                    <div class="right-section">
                        <p class="highest-bid">Highest Bid: <strong>LKR 211,000</strong> <span style="color: blue; font-size: 12px; margin-left: 40px;">70 bids</span></p>

                        <!-- Countdown Timer -->
                        <p class="time-remaining">
                            Time remaining: <strong><span id="countdown" style="color: orange;"></span></strong>
                        </p>

                        <!-- Bid Button -->
                        <button id="bid-button" class="bid-button">Bid LKR 212,000</button>
                    </div>
                </div>
                
                <div class="details">
                    <h2>Item Description</h2>
                    <p>Used PlayStation 5 in mint condition with the controller. Up for the highest bid!</p>
                    <h2>Seller Information</h2>
                    <p><strong>Seller Name:</strong> Pahan Kawindu</p>
                    <p><strong>Contact No:</strong> +94 766776568</p>
                </div>
            </div>
        </section>
    </main>
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

    <script>
        function startCountdown(endTime) {
            function updateCountdown() {
                var now = new Date().getTime();
                var timeLeft = endTime - now;

                if (timeLeft <= 0) {
                    document.getElementById("countdown").innerHTML = "Auction Ended";
                    document.getElementById("countdown").style.color = "red";

                    var bidButton = document.getElementById("bid-button");
                    bidButton.innerHTML = "Auction Ended";
                    bidButton.disabled = true;
                    bidButton.style.backgroundColor = "gray";
                    bidButton.style.cursor = "not-allowed";

                    clearInterval(timer);
                    return;
                }

                var hours = Math.floor((timeLeft / (1000 * 60 * 60)) % 24);
                var minutes = Math.floor((timeLeft / (1000 * 60)) % 60);
                var seconds = Math.floor((timeLeft / 1000) % 60);

                document.getElementById("countdown").innerHTML = hours + "h " + minutes + "m " + seconds + "s";
            }

            updateCountdown(); // Call immediately to prevent delay
            var timer = setInterval(updateCountdown, 1000);
        }

        var auctionEndTime = <%= auctionEndTime %>; // Time from server
        startCountdown(auctionEndTime);
    </script>
    
    
</body>
</html>
