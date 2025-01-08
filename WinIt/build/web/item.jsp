<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sell an Item - WinIt</title>
        <!-- Link CSS with context path -->
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@600&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/SellItem.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;700&display=swap" rel="stylesheet">
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="bg-gray-100">
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
      
        <h2><a href="user/dash.jsp"> < Back to Home</a></h2>
        <h1>Sell an Item</h1>
        <p>Want to sell an item? Create a listing and make the best out of it!</p>
        <!-- Sell Item Form -->
        <main class="form-container">
            <div class="image-box">
                <img src="images/right.png" alt="Image" class="image">
            </div>

            <form id="sellForm" action="SellItemServlet" method="post" enctype="multipart/form-data">

                <div class="form-group">
                    <label for="firstName">First Name:</label>
                    <img src="images/first-name-icon.png" alt="FNIcon" class="form-icon">
                    <input type="text" id="firstName" name="firstName" required>
                </div>

                <div class="form-group">
                    <label for="lastName">Last Name:</label>
                    <img src="images/last-name-icon.png" alt="LNIcon" class="form-icon">
                    <input type="text" id="lastName" name="lastName" required>
                </div>

                <div class="form-group">
                    <label for="contact">Contact Number:</label>
                    <img src="images/contact-icon.png" alt="CIcon" class="form-icon">
                    <input type="tel" id="contact" name="contact" required>
                </div>

                <div class="form-group">
                    <label for="category">Category:</label>
                    <img src="images/category-icon.png" alt="CIcon" class="form-icon">
                    <input type="text" id="category" name="category" required>
                </div>

                <div class="form-group">
                    <label for="price">Initial Value (LKR):</label>
                    <img src="images/value-icon.png" alt="VIcon" class="form-icon">
                    <input type="number" id="price" name="price" required>
                </div>

                <div class="form-group">
                    <label for="description">Item Description:</label>
                    <img src="images/description-icon.png" alt="DIcon" class="form-icon">
                    <input type="text" id="category" name="category" required>
                </div>

                <div class="form-group">
                    <label for="image">Item’s Photos:</label>
                    <img src="images/Item’s Photos-icon.png" alt="IPIcon" class="form-icon">
                    <input type="file" id="image" name="image" required>
                </div>

                <button type="submit" class="submit-btn">Create</button>

            </form>


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
                    <p class="text-gray-400">© WinIt 2024 | All rights reserved</p>
                    <div class="flex space-x-4 mt-4 md:mt-0">
                        <a href="#" class="text-gray-400 hover:text-white">Terms & Conditions</a>
                        <a href="#" class="text-gray-400 hover:text-white">Privacy Policy</a>
                    </div>
                    <div class="flex space-x-4 mt-4 md:mt-0 pr-36">
                        <a href="#"><img src="images/facebook.png" alt="Facebook" class="h-6"></a>
                        <a href="#"><img src="images/twitter.png" alt="Twitter" class="h-6"></a>
                        <a href="#"><img src="images/instagram.png" alt="Instagram" class="h-6"></a>
                    </div>
                </div>
            </div>
        </section>

        <!-- Link JavaScript -->
        <script src="${pageContext.request.contextPath}/js/SellItem.js"></script>
    </body>
</html>
