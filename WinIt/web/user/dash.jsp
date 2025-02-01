<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.List"%>
<%@page import="app.classes.Item"%>
<%@page import="app.classes.DbConnector"%>
<%@page import="app.classes.User"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!User user = new User();

    Item item = new Item();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");


%>
<%
    if (session.getAttribute("user_id") != null) {
        int user_id = (Integer) session.getAttribute("user_id");
        user.setId(user_id);
        user = user.getUserById(DbConnector.getConnection());
        session.setAttribute("user_id", user_id);

    } else {

        response.sendRedirect("../index.jsp");
    }


%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>WinIt Home</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://cdn.tailwindcss.com"></script>
        <script src="https://unpkg.com/@heroicons/react@2.0.16/dist/heroicons.min.js"></script>
        <style>
            .hover-gold:hover {
                color: #F5A623; /* Gold hover effect */
            }
            html {
                scroll-behavior: smooth;
            }
        </style>

        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    </head>
    <body class="bg-[#EEEEEE]">


        <!-- Navbar -->
        <nav class="bg-[#0056D2] text-white">
            <div class="container mx-auto flex justify-between items-center px-4 py-3 whitespace-nowrap">
                <!-- Logo -->
                <div class="text-[30px] font-bold">Win<span class="text-red-500">It</span></div>

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

                <!-- Navigation Links -->
                <div class="flex space-x-10 items-center">
                    <a href="liveAc.jsp" class="hover-gold text-[18px] font-bold whitespace-nowrap">Live</a>
                    <a href="#categories" class="hover-gold text-[18px] font-bold whitespace-nowrap">Categories</a>
                    <a href="topPicks.jsp" class="hover-gold text-[18px] font-bold whitespace-nowrap">Top Picks</a>
                    <a href="../item.jsp" class="hover-gold text-[18px] font-bold whitespace-nowrap">Sell an Item</a>
                    <h2 class="text-[17px] text-blue-200 font-bold whitespace-nowrap">Hello, <%=user.getFirstName()%> !</h2>

                    <!-- User Dropdown remains the same -->
                    <div class="relative inline-block text-left">
                        <a href="#" id="userIcon" class="flex items-center w-8 h-8">
                            <img src="../resources/images/howItWork/user.png" alt="User Icon" class="rounded-full" />
                        </a>
                        <div id="dropdownMenu" class="hidden absolute right-0 mt-2 w-40 bg-white border border-gray-200 rounded-lg shadow-lg z-50">
                            <ul class="py-1">
                                <li>
                                    <a href="checkout.jsp" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">
                                        Cart
                                    </a>
                                </li>
                                <li>
                                    <a href="../admin/signout.jsp" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">
                                        Sign Out
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </nav>

        <!-- Main Section -->
        <div class="w-full h-[714px] bg-[#FCFCFC] flex items-center justify-center">
            <div class="container mx-auto flex flex-wrap md:flex-nowrap items-center px-6 gap-8">
                <!-- Left Content -->
                <div class="w-full md:w-1/2">
                    <h3 class="text-4xl font-bold text-black mb-4">Win<span class="text-red-500">It</span></h3>
                    <p class="text-lg text-gray-600">
                        The ultimate hub for bidding, selling, and winning.
                    </p>
                </div>
                <!-- Right Content (Slideshow) -->
                <div class="w-full md:w-1/2 relative h-[430px] rounded-lg overflow-hidden shadow-lg slideshow">
                    <div class="absolute w-full h-full opacity-100 transition-opacity duration-1000">
                        <img src="../resources/images/slideshowMain/image1.jpg" alt="Slide 1" class="w-full h-full object-cover rounded-lg" />
                    </div>
                    <div class="absolute w-full h-full opacity-0 transition-opacity duration-1000">
                        <img src="../resources/images/slideshowMain/image2.jpg" alt="Slide 2" class="w-full h-full object-cover rounded-lg" />
                    </div>
                    <div class="absolute w-full h-full opacity-0 transition-opacity duration-1000">
                        <img src="../resources/images/slideshowMain/image3.jpg" alt="Slide 3" class="w-full h-full object-cover rounded-lg" />
                    </div>
                </div>
            </div>
        </div>


        <script>
            const slides = document.querySelectorAll('.slideshow .absolute');
            let currentSlide = 0;

            function showSlide(index) {
                // Hide all slides
                slides.forEach((slide, i) => {
                    slide.classList.remove('opacity-100');
                    slide.classList.add('opacity-0');
                    if (i === index) {
                        slide.classList.remove('opacity-0');
                        slide.classList.add('opacity-100');
                    }
                });
            }

            function startSlideshow() {
                setInterval(() => {
                    currentSlide = (currentSlide + 1) % slides.length; // Loop through slides
                    showSlide(currentSlide);
                }, 3500); // Change slide every 3.5 seconds
            }

// Initialize the slideshow
            showSlide(currentSlide); // Display the first slide
            startSlideshow();


            // Get the user icon and dropdown menu
            const userIcon = document.getElementById('userIcon');
            const dropdownMenu = document.getElementById('dropdownMenu');

// Toggle dropdown visibility on click
            userIcon.addEventListener('click', (e) => {
                e.preventDefault();
                dropdownMenu.classList.toggle('hidden');
            });

// Hide dropdown when clicking outside
            document.addEventListener('click', (e) => {
                if (!userIcon.contains(e.target) && !dropdownMenu.contains(e.target)) {
                    dropdownMenu.classList.add('hidden');
                }
            });



        </script>



        <!-- Live Auctions Section -->
        <section class="my-8 mb-18">
            <div class="flex items-center justify-between w-full pr-36">
                <h2 class="text-3xl font-semibold mb-10 md:w-1/2 pl-20">Live Auctions</h2>
                <a href="liveAc.jsp">
                    <button class="text-[#0056D2] border-2 border-[#0056D2] py-1 px-4 rounded-lg hover:bg-[#0056D2] hover:text-white text-sm font-medium">
                        View All
                    </button>
                </a>

            </div>
            <div class="relative overflow-hidden">

                <div class="flex space-x-8 overflow-x-hidden w-full pl-20" style="scroll-behavior: smooth;">

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
                            <img src="<%= i.getImageBase64()%>" class="w-full h-48 object-cover p-2 rounded-lg" alt="Item Image">
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

                <!-- Manual Control Buttons -->
                <button id="prev-btn" class="absolute left-12 top-1/2 transform -translate-y-1/2 p-2 rounded-full">
                    <img src="../resources/images/howItWork/previous.png" alt="Previous" class="w-8 h-8">
                </button>
                <button id="next-btn" class="absolute right-12 top-1/2 transform -translate-y-1/2 p-2 rounded-full">
                    <img src="../resources/images/howItWork/next.png" alt="Next" class="w-8 h-8">
                </button>
            </div>
        </section>

        <!-- JavaScript -->
        <script>
            const container = document.querySelector('.flex.space-x-8');
            const prevBtn = document.getElementById('prev-btn');
            const nextBtn = document.getElementById('next-btn');
            const cardWidth = 280 + 32; // Card width + space

            nextBtn.addEventListener('click', () => {
                container.scrollBy({
                    left: cardWidth * 4,
                    behavior: 'smooth'
                });
            });

            prevBtn.addEventListener('click', () => {
                container.scrollBy({
                    left: -cardWidth * 4,
                    behavior: 'smooth'
                });
            });
        </script>

        <!-- Categories Section -->
        <section class="my-8 mt-12" id="categories">
            <h2 class="text-3xl font-semibold mb-8 md:w-1/2 pl-20">Categories</h2>
            <!-- Grid for Category Cards -->
            <div class="pl-20 flex gap-6 mb-4">
                <%
                    String[][] categories = {
                        {"Art", "Paintings & More", "../resources/images/categories/img1.png", "Art Category", "../item.jsp"},
                        {"Vehicles", "Cars & Boats", "../resources/images/categories/img2.png", "Vehicles Category", "vehicle.jsp"},
                        {"Furniture", "Modern & Classic", "../resources/images/categories/img3.png", "Furniture Category", "furniture.jsp"},
                        {"Antiques", "Collectibles", "../resources/images/categories/img4.png", "Antiques Category", "antiques.jsp"},
                        {"Jewelry", "Fine Jewelry", "../resources/images/categories/img5.png", "Jewelry Category", "jewelry.jsp"},
                        {"Sports", "Equipment", "../resources/images/categories/img6.png", "Sports Category", "sports.jsp"}
                    };
                    for (String[] category : categories) {
                %>
                <a href="<%= category[4]%>" class="block">
                    <div class="w-40 h-[170px] bg-white rounded-lg shadow-md overflow-hidden hover:shadow-lg transition-shadow duration-300">
                        <div class="h-28 flex items-center justify-center">
                            <img src="<%= category[2]%>" alt="<%= category[3]%>" class="w-4/5 h-[80%] object-contain">
                        </div>
                        <div class="p-2 text-center">
                            <h3 class="text-sm font-semibold text-gray-900"><%= category[0]%></h3>
                            <p class="text-xs text-gray-600 mt-0.5"><%= category[1]%></p>
                        </div>
                    </div>
                </a>
                <% } %>
            </div>

            <!-- Second Row - 4 Cards -->
            <div class="pl-20 flex gap-6">
                <%-- Dynamic Category Data for Second Row --%>
                <%
                    String[][] secondRowCategories = {
                        {"Fashion", "Luxury Items", "../resources/images/categories/img7.png", "Fashion Category"},
                        {"Toys", "Collectibles", "../resources/images/categories/img8.png", "Toys Category"},
                        {"Electronics", "Computers", "../resources/images/categories/img9.png", "Electronics Category"},
                        {"Real Estate", "Properties", "../resources/images/categories/img10.png", "Real Estate Category"}
                    };
                    for (String[] category : secondRowCategories) {
                %>
                <a href="#" class="block">
                    <div class="w-40 h-[170px] bg-white rounded-lg shadow-md overflow-hidden hover:shadow-lg transition-shadow duration-300">
                        <div class="h-28 flex items-center justify-center">
                            <img src="<%= category[2]%>" alt="<%= category[3]%>" class="w-4/5 h-[80%] object-contain">
                        </div>
                        <div class="p-2 text-center">
                            <h3 class="text-sm font-semibold text-gray-900"><%= category[0]%></h3>
                            <p class="text-xs text-gray-600 mt-0.5"><%= category[1]%></p>
                        </div>
                    </div>
                </a>
                <% }%>
            </div>
        </section>

        <!-- Step how it works -->
        <section class="my-8 mt-16 mb-10">
            <h2 class="text-3xl font-semibold mb-8 md:w-1/2 pl-20">How It Works</h2>
            <div class="w-full h-[450px] bg-[#F3F4F6] mt-12">
                <div class="flex py-32 space-x-24 justify-center mx-24">
                    <!-- Step 1: Register -->
                    <div class="flex flex-col justify-center items-center">
                        <div class="flex justify-center items-center w-[150px] h-[150px] rounded-full bg-[#BFDBFE]">
                            <img src="../resources/images/howItWork/register.png" alt="Register Icon" class="h-16" />
                        </div>
                        <div class="text-center mt-4">
                            <h1 class="text-lg font-bold">Register</h1>
                            <p class="text-sm text-gray-600">Complete the registration process <br> easily and quickly.</p>
                        </div>
                    </div>

                    <!-- Arrow -->
                    <img src="../resources/images/howItWork/arrow.png" alt="Arrow Icon" class="h-12 mt-12" />

                    <!-- Step 2: Buy or Bid -->
                    <div class="flex flex-col justify-center items-center">
                        <div class="flex justify-center items-center w-[150px] h-[150px] rounded-full bg-[#BFDBFE]">
                            <img src="../resources/images/howItWork/cart.png" alt="Buy or Bid Icon" class="h-16" />
                        </div>
                        <div class="text-center mt-4">
                            <h1 class="text-lg font-bold">Browse Items</h1>
                            <p class="text-sm text-gray-600">Search and browse through items.</p>
                        </div>
                    </div>

                    <!-- Arrow -->
                    <img src="../resources/images/howItWork/arrow.png" alt="Arrow Icon" class="h-12 mt-12" />

                    <!-- Step 3: Submit a Bid -->
                    <div class="flex flex-col justify-center items-center">
                        <div class="flex justify-center items-center w-[150px] h-[150px] rounded-full bg-[#BFDBFE]">
                            <img src="../resources/images/howItWork/dollar.png" alt="Submit a Bid Icon" class="h-16" />
                        </div>
                        <div class="text-center mt-4">
                            <h1 class="text-lg font-bold">Submit a Bid</h1>
                            <p class="text-sm text-gray-600">Bid on your favorite items quickly.</p>
                        </div>
                    </div>

                    <!-- Arrow -->
                    <img src="../resources/images/howItWork/arrow.png" alt="Arrow Icon" class="h-12 mt-12" />

                    <!-- Step 4: Win -->
                    <div class="flex flex-col justify-center items-center">
                        <div class="flex justify-center items-center w-[150px] h-[150px] rounded-full bg-[#BFDBFE]">
                            <img src="../resources/images/howItWork/cup.png" alt="Win Icon" class="h-16" />
                        </div>
                        <div class="text-center mt-4">
                            <h1 class="text-lg font-bold">Win</h1>
                            <p class="text-sm text-gray-600">Claim your winnings effortlessly.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Top Picks Section -->
        <section class="max-w-7xl mx-auto my-8 px-6 flex items-center mt-16">
            <!-- Heading and Button Container -->
            <div class="flex items-center justify-between w-full">
                <h2 class="text-3xl font-semibold mb-10">Top Picks</h2>
                <a href="topPicks.jsp">
                    <button class="text-[#0056D2] border-2 border-[#0056D2] py-1 px-4 rounded-lg hover:bg-[#0056D2] hover:text-white text-sm font-medium">
                        View All
                    </button>
                </a>

            </div>
        </section>

        <div class="max-w-7xl mx-auto mt-6 px-6 grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
            <!-- Card 1 -->
            <div class="bg-white shadow-md rounded-lg overflow-hidden w-[280px] h-[380px] mx-auto">
                <img src="../resources/images/liveAuction/img8.jpg" alt="Luxury Apartment - Kandy" class="w-full h-[200px] object-cover">
                <div class="p-4">
                    <h3 class="text-lg font-semibold mb-2">Toyota tundra - Colombo</h3>
                    <p class="text-gray-600 mb-4">
                        LKR 10,000,000 <span class="font-bold text-blue-600 ml-[55px]">40 bids</span>
                    </p>
                    <button class="w-full bg-blue-600 text-white py-2 rounded hover:bg-blue-700">
                        Place your Bid
                    </button>
                </div>
            </div>

            <!-- Card 2 -->
            <div class="bg-white shadow-md rounded-lg overflow-hidden w-[280px] h-[380px] mx-auto">
                <img src="../resources/images/liveAuction/img3.jpg" alt="Honda Civic 2019" class="w-full h-[200px] object-cover">
                <div class="p-4">
                    <h3 class="text-lg font-semibold mb-2">Luxury Villa - Kandy</h3>
                    <p class="text-gray-600 mb-4">
                        LKR 30,000,000 <span class="font-bold text-blue-600 ml-[55px]">35 bids</span>
                    </p>
                    <button class="w-full bg-blue-600 text-white py-2 rounded hover:bg-blue-700">
                        Place your Bid
                    </button>
                </div>
            </div>

            <!-- Card 3 -->
            <div class="bg-white shadow-md rounded-lg overflow-hidden w-[280px] h-[380px] mx-auto">
                <img src="../resources/images/liveAuction/img10.jpg" alt="Asus Rog Strix Laptop" class="w-full h-[200px] object-cover">
                <div class="p-4">
                    <h3 class="text-lg font-semibold mb-2">Beachfront Property - Galle</h3>
                    <p class="text-gray-600 mb-4">
                        LKR 20,000,000 <span class="font-bold text-blue-600 ml-[55px]">38 bids</span>
                    </p>
                    <button class="w-full bg-blue-600 text-white py-2 rounded hover:bg-blue-700">
                        Place your Bid
                    </button>
                </div>
            </div>

            <!-- Card 4 -->
            <div class="bg-white shadow-md rounded-lg overflow-hidden w-[280px] h-[380px] mx-auto">
                <img src="../resources/images/liveAuction/img1.jpg" alt="Study Table" class="w-full h-[200px] object-cover">
                <div class="p-4">
                    <h3 class="text-lg font-semibold mb-2">Mountain Retreat - Kandy</h3>
                    <p class="text-gray-600 mb-4">
                        LKR 27,000,000  <span class="font-bold text-blue-600 ml-[55px]">35 bids</span>
                    </p>
                    <button class="w-full bg-blue-600 text-white py-2 rounded hover:bg-blue-700">
                        Place your Bid
                    </button>
                </div>
            </div>
        </div>


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
