<%-- 
    Document   : Categories
    Created on : Jan 7, 2025, 6:06:12 PM
    Author     : DILSHAN
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>categories</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <script src="https://unpkg.com/@heroicons/react@2.0.16/dist/heroicons.min.js"></script>

        <style>
            .hover-gold:hover {
                color: #F5A623; /* Gold hover effect */
            }
            .active-link {
                color: #F5A623; /* Gold color for active link */
            }
        </style>
    </head>
    <body class="bg-gray-100">
        <!-- Navbar -->
        <nav class="bg-[#0056D2] text-white">
            <div class="container mx-auto flex justify-between items-center px-4 py-3">
                <!-- Logo -->
                <a href="dash.jsp"><div class="text-[30px] font-bold">Win<span class="text-red-500">It</span></div></a>
                <!-- Search Area -->
                <div class="mr-10">
                </div>
                <!-- Navigation Links -->
                <div class="flex space-x-14 items-center">
                    <a href="liveAc.jsp" class="<%= request.getRequestURI().contains("liveAc.jsp") ? "active-link" : "hover-gold"%> text-[20px] font-bold">Live</a>
                    <a href="categories.jsp" class="<%= request.getRequestURI().contains("categories.jsp") ? "active-link" : "hover-gold"%> text-[20px] font-bold">Categories</a>
                    <a href="../item.jsp" class="<%= request.getRequestURI().contains("item.jsp") ? "active-link" : "hover-gold"%> text-[20px] font-bold">Sell an Item</a>

                    <div class="relative inline-block text-left">
                        <!-- User Icon -->
                        <a href="#" id="userIcon" class="flex items-center w-8 h-8">
                            <img src="../resources/images/howItWork/user.png" alt="User Icon" class="rounded-full" />
                        </a>

                        <!-- Dropdown Menu -->
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

    <h2 class="text-2xl font-bold mb-8">Categories</h2>
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 justify-items-center gap-6">
        <%
            String[][] categories = {
                {"Art", "Paintings & More", "../resources/images/categories/img1.png", "Art Category", "art.html"},
                {"Vehicles", "Cars & Boats", "../resources/images/categories/img2.png", "Vehicles Category", "vehicles.html"},
                {"Furniture", "Modern & Classic", "../resources/images/categories/img3.png", "Furniture Category", "furniture.html"},
                {"Antiques", "Collectibles", "../resources/images/categories/img4.png", "Antiques Category", "antiques.html"},
                {"Jewelry", "Fine Jewelry", "../resources/images/categories/img5.png", "Jewelry Category", "jewelry.html"},
                {"Sports", "Equipment", "../resources/images/categories/img6.png", "Sports Category", "sports.html"},
                {"Fashion", "Luxury Items", "../resources/images/categories/img7.png", "Fashion Category", "fashion.html"},
                {"Toys", "Collectibles", "../resources/images/categories/img8.png", "Toys Category", "toys.html"},
                {"Electronics", "Computers", "../resources/images/categories/img9.png", "Electronics Category", "electronics.html"},
                {"Real Estate", "Properties", "../resources/images/categories/img10.png", "Real Estate Category", "realestate.html"}
            };
            for (String[] category : categories) {
        %>
        <a href="<%= category[4]%>" class="w-56 bg-white rounded-xl shadow-lg overflow-hidden h-[250px] block">
            <div class="relative">
                <img src="<%= category[2]%>" alt="<%= category[3]%>" class="w-full h-48 object-cover p-2 rounded-lg">
            </div>
            <div class="p-4">
                <h3 class="font-medium text-gray-900 text-center"><%= category[0]%></h3>

            </div>
        </a>
        <% }%>
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
            <p class="text-gray-400">© WinIt 2024 | All rights reserved</p>
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