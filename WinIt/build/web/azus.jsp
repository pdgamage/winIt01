<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sell an Item - WinIt</title>
        <!-- Link CSS with context path -->
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@600&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/azus.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;700&display=swap" rel="stylesheet">
          <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body>
        <!-- Navbar -->
        <nav class="bg-[#0056D2] text-white">
            <div class="container mx-auto flex justify-between items-center px-4 py-3">
                <!-- Logo -->
                <div class="text-[30px] font-bold">Win<span class="text-red-500">It</span></div>
                <!-- Search Area -->
                <div class="mr-10">
                    <div class="relative w-[480px]">
                        <input 
                            type="text" 
                            class="w-full py-2 pl-10 pr-4 rounded-full text-gray-700 focus:outline-none focus:ring-2 focus:ring-blue-300" 
                            placeholder="Search for items..."
                            />
                    </div>
                </div>
                <!-- Navigation Links -->
                <div class="flex space-x-14 items-center">
                    <a href="user/liveAc.jsp" class="hover-gold text-[20px] font-bold">Live</a>
                    <a href="user/categories.jsp" class="hover-gold text-[20px] font-bold">Categories</a>
                    <a href="user/topPicks.jsp" class="hover-gold text-[20px] font-bold">Top Picks</a>
                    <a href="#" class="hover-gold text-[20px] font-bold">Sell an Item</a>
                    <a href="#" class="flex items-center w-8 h-8">
                        <img src="images/user.png" alt="User Icon"/>
                    </a>
                </div>
            </div>
        </nav>
        



         <main class="container mx-auto px-24 py-8">
            <div class="flex items-center text-gray-500 font-medium text-sm mt-4">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-1" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                <path stroke-linecap="round" stroke-linejoin="round" d="M15 19l-7-7 7-7" />
                </svg>
                <a href="user/dash.jsp" class="hover:underline">Back to Home</a>
            </div>

            <h2 class="text-2xl font-bold mb-8">Asus Rog Strix Laptop</h2>

            <section class="sell-item">
                <div class="container">
                    <div class="card">
                        <div class="left-section">
                            <img src="images/img2.jpg" alt="Asus Rog Strix Laptop">
                        </div>
                        <div class="right-section">

                            <p class="highest-bid">Highest Bid: <strong>LKR 150,000</strong> <span style="color: blue; font-size: 12px; margin-left: 40px; ">42 bids</span></p>


                            <p class="time-remaining">Time remaining: <strong><span style="color: orange;">12/01/2025</span></strong></p>

                            <button class="bid-button">Bid LKR 151,000</button>

                        </div>
                    </div>
                    <div class="details">
                        <h2>Item Description</h2>
                        <p>Used Asus Rog Strix core i5 10th gen gaming laptop with 16GB RAM, 512GB SSD and NVIDIA RTX 2050 graphics.</p>
                        <h2>Seller Information</h2>
                        <p><strong>Seller Name:</strong> Kavinda Nimush</p>
                        <p><strong>Contact No:</strong> +94 758776568</p>
                    </div>
                </div>

            </section>



        </main>

        <!-- Footer -->
        <footer>
            <div class="logo">
                <a href="#">Win<span class="highlight">It</span></a>
            </div>
            <div class="description">
                WinIt is the leading global platform for online auctions, featuring local<br>auctions
                happening today, this weekend, and every day. Each week, we <br> showcase thousands 
                of fresh listings from a network of over 15,000 <br>auctioneers across the country.
            </div>


            <div class="ft">
                <div class="p">
                    <p style="color: #ffffff;">© WiniIt 2024 | All rights reserved</p>
                </div>

                <div class="info">
                    <div class="p1"><p style="color: #ffffff;">Terms & Conditions | Privacy Policy</p>
                    </div>


                </div>






        </footer>

        <!-- Link JavaScript -->
        <script src="${pageContext.request.contextPath}/js/SellItem.js"></script>
    </body>
</html>
