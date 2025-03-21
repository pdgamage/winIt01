<%-- 
    Document   : antique
    Created on : Feb 2, 2025, 12:51:47 AM
    Author     : DILSHAN
--%>

<%@page import="app.classes.Item"%>
<%@page import="app.classes.DbConnector"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    Item item = new Item();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    </head>
    <body>
        <!-- Fetch Items and Display -->

        <%
            List<Item> itemlist = item.getAllItems(DbConnector.getConnection());
            if (itemlist != null && !itemlist.isEmpty()) {
                boolean hasElectronics = false; // To check if any antique items are found
                out.println("<div class='grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 justify-items-center gap-6'>");
                for (Item i : itemlist) {
                    if ("Electronics".equalsIgnoreCase(i.getCategory())) { // Check for category "Electronics"
                        hasElectronics = true;
        %>
        <div class="w-56 bg-white rounded-xl shadow-lg overflow-hidden h-max">

            <div class="relative">
                <img src="<%= i.getImageBase64()%>" class="w-full h-48 object-cover p-2 rounded-lg">
            </div>
            <div class="p-4">
                <h3 class="font-medium text-gray-900"><%= i.getFirstName()%></h3>
                <div class="flex justify-between items-center mt-2">
                    <div class="flex space-x-[35px]">
                        <p class="font-semibold">$<%= i.getPrice()%></p>
                        <p class="text-sm text-gray-500"><%= i.getCategory()%></p>
                    </div>
                </div>
                <a href="<%= i.getContact()%>">
                    <button class="w-full mt-3 bg-blue-600 text-white py-2 rounded-lg text-sm font-medium hover:bg-blue-700">Place your bid</button>
                </a>
            </div>
        </div>
        <%
                    }
                }
                out.println("</div>");
                if (!hasElectronics) { // If no antiques are found, show a message
                    out.println("<p class='text-gray-500'>No items at this moment.</p>");
                }
            } else {
                out.println("<p class='text-gray-500'>No live auctions available at the moment.</p>");
            }
        %>

    </div>

</body>
</html>
