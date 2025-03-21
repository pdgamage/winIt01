<%@page import="app.classes.DbConnector"%>
<%@page import="java.util.List"%>
<%@page import="app.classes.Item"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>WinIt - Live Auctions</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
        <style>
            .hover-gold:hover { color: #F5A623; }
            .active-link { color: #F5A623; }
        </style>
    </head>
    <body class="bg-[#EEEEEE]">

        <!-- Navbar -->
        <nav class="bg-[#0056D2] text-white">
            <div class="container mx-auto flex justify-between items-center px-4 py-3">
                <a href="dash.jsp" class="text-[30px] font-bold">Win<span class="text-red-500">It</span></a>

                <div class="flex space-x-14 items-center">
                    <a href="liveAc.jsp" class="active-link text-[20px] font-bold">Live</a>
                    <a href="categories.jsp" class="hover-gold text-[20px] font-bold">Categories</a>
                    <a href="../item.jsp" class="hover-gold text-[20px] font-bold">Sell an Item</a>

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

        <% Connection conn = DbConnector.getConnection(); %>
        <% List<Item> itemList = Item.getAllItems(conn); %>

        <main class="container mx-auto px-24 py-8">
            <div class="flex items-center text-gray-500 font-medium text-sm mt-4">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-1" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                <path stroke-linecap="round" stroke-linejoin="round" d="M15 19l-7-7 7-7" />
                </svg>
                <a href="dash.jsp" class="hover:underline">Back to Home</a>
            </div>
            <h2 class="text-2xl font-bold mb-8">Live Auctions</h2>
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 justify-items-center gap-6">
                <% for (Item i : itemList) {%>
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
                            <p class="font-semibold">Rs.<%= i.getPrice()%></p>
                            <p class="text-sm text-gray-500"><%= i.getCategory()%></p>
                        </div>
                        <a href="azus.jsp?id=<%= i.getId()%>">
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
                        updateCountdown();
                        var timer = setInterval(updateCountdown, 1000);
                    }
                    var auctionEndTime = <%= Item.getAuctionEndTime(conn, i.getId())%>;
                    startCountdown(auctionEndTime, "countdown-<%= i.getId()%>");
                </script>
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
