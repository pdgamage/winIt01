<%-- 
    Document   : vehicle
    Created on : Jan 8, 2025, 2:50:32 PM
    Author     : DILSHAN
--%>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>WinIt - Vehicle</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <script src="https://unpkg.com/@heroicons/react@2.0.16/dist/heroicons.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
        
          <style>
            .hover-gold:hover {
                color: #F5A623; /* Gold hover effect */
            }
            .active-link {
                color: #F5A623; /* Gold color for active link */
            }
        </style>
        
    </head>
    <body class="bg-[#EEEEEE]">
        <!-- Navbar -->
        <nav class="bg-[#0056D2] text-white">
            <div class="container mx-auto flex justify-between items-center px-4 py-3 whitespace-nowrap">
                <!-- Logo -->
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
                <!-- Navigation Links -->
                <div class="flex space-x-10 items-center">
                    <a href="liveAc.jsp" class="<%= request.getRequestURI().contains("liveAc.jsp") ? "active-link" : "hover-gold" %> text-[18px] font-bold">Live</a>
                    <a href="categories.jsp" class="<%= request.getRequestURI().contains("categories.jsp") ? "active-link" : "hover-gold" %> text-[18px] font-bold">Categories</a>
                    <a href="topPicks.jsp" class="<%= request.getRequestURI().contains("topPicks.jsp") ? "active-link" : "hover-gold" %> text-[18px] font-bold">Top Picks</a>
                    <a href="../item.jsp" class="<%= request.getRequestURI().contains("item.jsp") ? "active-link" : "hover-gold" %> text-[18px] font-bold">Sell an Item</a>
                    <a href="#" class="flex items-center w-8 h-8">
                        <img src="../resources/images/howItWork/user.png" alt="User Icon"/>
                    </a>
                </div>
            </div>
        </nav>

        <!-- Main Content -->
        <main class="container mx-auto px-24 py-8">
            <div class="flex items-center text-gray-500 font-medium text-sm mt-4">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-1" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                <path stroke-linecap="round" stroke-linejoin="round" d="M15 19l-7-7 7-7" />
                </svg>
                <a href="dash.jsp" class="hover:underline">Back to Home</a>
            </div>

            <h2 class="text-2xl font-bold mb-8">Vehicles</h2>
          <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 justify-items-center gap-6">
    <%
        String[] houseImages = {"../resources/images/vehicles/img1.jpg", "../resources/images/vehicles/img2.jpg", "../resources/images/vehicles/img3.jpg", "../resources/images/vehicles/img4.jpg", "../resources/images/vehicles/img5.jpg", "../resources/images/vehicles/img6.jpg", "../resources/images/vehicles/img7.jpg", "../resources/images/vehicles/img8.jpg"};
        String[] houseTitles = {"Toyota CHR-GT 2019", "Toyota Prius 2013", "Suzuki Wagon R 2016", "BMW 520d 2013", "Toyota KDH 200 GL", "Toyota Belta 2007", "Ducati Panigale 899", "Suzuki S Cross 2019"};
        String[] housePrices = {"LKR 16,855,000", "LKR 12,000,000", "LKR 8,500,000", "LKR 18,665,000", "LKR 12,000,000", "LKR 8,500,000", "LKR 6,500,000", "LKR 9,800,000"};
        String[] bidCounts = {"23 bids", "17 bids", "32 bids", "19 bids", "12 bids", "28 bids", "5 bids", "22 bids"};
        String[] pages = {"modernHouse.jsp", "luxuryVilla.jsp", "../PS5.jsp", "../azus.jsp", "hondaCivic.jsp", "contemporary.jsp", "seasideBungalow.jsp", "hondaVezel.jsp"}; // Corresponding pages for each item

        for (int i = 0; i < 8; i++) {
    %>
    <div class="w-56 bg-white rounded-xl shadow-lg overflow-hidden h-max">
        <div class="relative">
            <img src="<%= houseImages[i] %>" alt="<%= houseTitles[i] %>" class="w-full h-48 object-cover p-2 rounded-lg">
        </div>
        <div class="p-4">
            <h3 class="font-medium text-gray-900"><%= houseTitles[i] %></h3>
            <div class="flex justify-between items-center mt-2">
                <div class="flex space-x-[35px]">
                    <p class="font-semibold"><%= housePrices[i] %></p>
                    <p class="text-sm text-gray-500"><%= bidCounts[i] %></p>
                </div>
            </div>
            <a href="<%= pages[i] %>">
                <button class="w-full mt-3 bg-blue-600 text-white py-2 rounded-lg text-sm font-medium hover:bg-blue-700">Place your bid</button>
            </a>
        </div>
    </div>
    <% } %>
</div>


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


    </body>
</html>

