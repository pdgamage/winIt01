<%@page import="app.classes.Bids"%>
<%@page import="java.util.List"%>
<%@page import="app.classes.Bids.BidsWithDetails"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Checkout</title>
        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    </head>
    <body class="bg-gray-100">

        <%
            Integer userId = (Integer) session.getAttribute("user_id");

            if (userId == null) {
                response.sendRedirect("index.jsp");
                return;
            }

            List<BidsWithDetails> bids = Bids.getUserBids(userId);
        %>

        <div class="max-w-5xl mx-auto mt-10 p-6">
            <div class="flex items-center text-gray-500 font-medium text-sm mt-4">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-1" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                <path stroke-linecap="round" stroke-linejoin="round" d="M15 19l-7-7 7-7" />
                </svg>
                <a href="dash.jsp" class="hover:underline">Back to Home</a>
            </div>
            <h2 class="text-2xl font-bold mb-8">Winning Bids</h2>
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                <%
                    if (bids.isEmpty()) {

                    } else {
                        for (BidsWithDetails bid : bids) {
                %>

                <div class="bg-white shadow-lg rounded-lg p-6">
                    <h3 class="text-xl font-semibold mb-4">Item Details</h3>
                    <p><strong>Item ID:</strong> <%= bid.getItemId()%></p>
                    <p><strong>Category:</strong> <%= bid.getCategory()%></p>
                    <p><strong>Item Name:</strong> <%= bid.getSellerFirstName()%></p>
                    <p><strong>Seller:</strong> <%= bid.getSellerLastName()%></p>
                    <p><strong>Your Highest Bid:</strong> $<%= bid.getBidAmount()%></p>
                    <button onclick="proceedToPayment(<%= bid.getItemId()%>)" class="w-full mt-6 bg-blue-500 text-white py-2 px-4 rounded hover:bg-blue-600 transition duration-300">
                        Proceed to Payment
                    </button>
                </div>

                <%
                        }
                    }
                %>
            </div>
        </div>

        <script>
            function proceedToPayment(itemId) {
                window.location.href = "payment.jsp?item_id=" + itemId;
            }
        </script>

    </body>
</html>
