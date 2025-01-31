<%@page import="app.classes.DbConnector"%>
<%@ page import="java.sql.*" %>

<%
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        conn = DbConnector.getConnection();
        String sql = "SELECT * FROM sellitems";
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Page</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100">
    <!-- Blue Navbar -->
    <nav class="bg-blue-600 p-4 shadow-md">
        <div class="container mx-auto flex justify-between items-center">
            <h1 class="text-white text-2xl font-bold">Admin Dashboard</h1>
            <div>
                <form action="signout.jsp" method="POST"><a href="signout.jsp" class="bg-red-500 text-white px-4 py-2 rounded-md hover:bg-red-600 transition duration-300">Sign Out</a></form>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="p-8">
        <h1 class="text-3xl font-bold mb-6">Manage Items</h1>
        <div class="overflow-x-auto">
            <table class="min-w-full bg-white border border-gray-300 shadow-lg rounded-lg">
                <thead class="bg-gray-200">
                    <tr>
                        <th class="px-6 py-3 border-b-2 border-gray-300 text-left text-sm font-semibold text-gray-700">ID</th>
                        <th class="px-6 py-3 border-b-2 border-gray-300 text-left text-sm font-semibold text-gray-700">First Name</th>
                        <th class="px-6 py-3 border-b-2 border-gray-300 text-left text-sm font-semibold text-gray-700">Last Name</th>
                        <th class="px-6 py-3 border-b-2 border-gray-300 text-left text-sm font-semibold text-gray-700">Contact</th>
                        <th class="px-6 py-3 border-b-2 border-gray-300 text-left text-sm font-semibold text-gray-700">Category</th>
                        <th class="px-6 py-3 border-b-2 border-gray-300 text-left text-sm font-semibold text-gray-700">Price</th>
                        <th class="px-6 py-3 border-b-2 border-gray-300 text-left text-sm font-semibold text-gray-700">Description</th>
                        <th class="px-6 py-3 border-b-2 border-gray-300 text-left text-sm font-semibold text-gray-700">Image</th>
                        <th class="px-6 py-3 border-b-2 border-gray-300 text-left text-sm font-semibold text-gray-700">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <% while (rs.next()) { %>
                    <tr class="hover:bg-gray-50">
                        <td class="px-6 py-4 border-b border-gray-300 text-sm text-gray-900"><%= rs.getInt("id") %></td>
                        <td class="px-6 py-4 border-b border-gray-300 text-sm text-gray-900"><%= rs.getString("firstName") %></td>
                        <td class="px-6 py-4 border-b border-gray-300 text-sm text-gray-900"><%= rs.getString("lastName") %></td>
                        <td class="px-6 py-4 border-b border-gray-300 text-sm text-gray-900"><%= rs.getString("contact") %></td>
                        <td class="px-6 py-4 border-b border-gray-300 text-sm text-gray-900"><%= rs.getString("category") %></td>
                        <td class="px-6 py-4 border-b border-gray-300 text-sm text-gray-900"><%= rs.getDouble("price") %></td>
                        <td class="px-6 py-4 border-b border-gray-300 text-sm text-gray-900"><%= rs.getString("description") %></td>
                        <td class="px-6 py-4 border-b border-gray-300 text-sm text-gray-900">
                            <img src="data:image/jpeg;base64,<%= javax.xml.bind.DatatypeConverter.printBase64Binary(rs.getBytes("image")) %>" class="w-16 h-16 object-cover rounded">
                        </td>
                        <td class="px-6 py-4 border-b border-gray-300 text-sm text-gray-900">
                            <div class="flex space-x-2">
                                <a href="editItem.jsp?id=<%= rs.getInt("id") %>" class="bg-blue-500 text-white px-4 py-2 rounded-md hover:bg-blue-600 transition duration-300">Edit</a>
                                <a href="deleteItem.jsp?id=<%= rs.getInt("id") %>" class="bg-red-500 text-white px-4 py-2 rounded-md hover:bg-red-600 transition duration-300" onclick="return confirm('Are you sure you want to delete this item?');">Delete</a>
                            </div>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>

<%
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        if (rs != null) rs.close();
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
%>