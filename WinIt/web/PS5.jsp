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
