<%@page import="app.classes.Admin" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.SQLException" %>

<%
    int itemId = Integer.parseInt(request.getParameter("id"));
    ResultSet rs = null;

    try {
        if (request.getMethod().equalsIgnoreCase("POST")) {
            // Update the item
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String contact = request.getParameter("contact");
            String category = request.getParameter("category");
            double price = Double.parseDouble(request.getParameter("price"));
            String description = request.getParameter("description");

            boolean isUpdated = Admin.updateItem(itemId, firstName, lastName, contact, category, price, description);
            if (isUpdated) {
                response.sendRedirect("admin.jsp");
            } else {
                out.println("<p class='text-red-500'>Error updating item!</p>");
            }
        } else {
            // Fetch the item for editing
            rs = Admin.getItemById(itemId);
            if (rs.next()) {
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Edit Item</title>
        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    </head>
    <body class="bg-gray-100 p-8">
        <div class="max-w-lg mx-auto bg-white p-6 rounded-lg shadow-md">
            <!-- Back Button -->
            <a href="admin.jsp" class="inline-block mb-4 text-blue-500 hover:text-blue-700">
                &larr; Back
            </a>

            <h1 class="text-2xl font-bold mb-6 text-blue-600">Edit Item</h1>
            <form action="editItem.jsp?id=<%= itemId%>" method="post" class="space-y-4">
                <input type="hidden" name="id" value="<%= rs.getInt("id")%>">

                <!-- First Name -->
                <div>
                    <label class="block text-sm font-medium text-gray-700">First Name</label>
                    <input type="text" name="firstName" value="<%= rs.getString("firstName")%>"
                           class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500">
                </div>

                <!-- Last Name -->
                <div>
                    <label class="block text-sm font-medium text-gray-700">Last Name</label>
                    <input type="text" name="lastName" value="<%= rs.getString("lastName")%>"
                           class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500">
                </div>

                <!-- Contact -->
                <div>
                    <label class="block text-sm font-medium text-gray-700">Contact</label>
                    <input type="text" name="contact" value="<%= rs.getString("contact")%>"
                           class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500">
                </div>

                <!-- Category -->
                <div>
                    <label class="block text-sm font-medium text-gray-700">Category</label>
                    <input type="text" name="category" value="<%= rs.getString("category")%>"
                           class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500">
                </div>

                <!-- Price -->
                <div>
                    <label class="block text-sm font-medium text-gray-700">Price</label>
                    <input type="text" name="price" value="<%= rs.getDouble("price")%>"
                           class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500">
                </div>

                <!-- Description -->
                <div>
                    <label class="block text-sm font-medium text-gray-700">Description</label>
                    <textarea name="description"
                              class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500"><%= rs.getString("description")%></textarea>
                </div>

                <!-- Submit Button -->
                <div>
                    <button type="submit"
                            class="w-full bg-blue-500 text-white px-4 py-2 rounded-md hover:bg-blue-600 transition duration-300">
                        Update
                    </button>
                </div>
            </form>
        </div>
    </body>
</html>

<%
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        if (rs != null) {
            rs.close();
        }
    }
%>