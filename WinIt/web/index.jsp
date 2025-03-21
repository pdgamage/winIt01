<%-- 
    Document   : index
    Created on : Jan 4, 2025, 6:21:38 PM
    Author     : DILSHAN
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="bg-gray-100 flex items-center justify-center min-h-screen">
        <div class="bg-white shadow-lg rounded-lg w-full max-w-4xl p-8 flex items-center">
            <!-- Form Section -->
            <div class="w-1/2 pr-8">
                <h2 class="text-2xl font-bold mb-6">Login</h2>

                <%
                    if (request.getParameter("s") != null) {
                        if (request.getParameter("s").equals("0")) {
                %>
                <h6 style='color: red'>Incorrect username or password.</h6>
                <%
                        }
                    }
                %>
                <form action="login.jsp" method="post" class="space-y-4">
                    <div>
                        <label class="block text-gray-700 mb-1" for="email">Email</label>
                        <input
                            type="email"
                            id="email"
                            name="email"
                            class="w-full px-4 py-2 border border-gray-300 rounded-md focus:ring-2 focus:ring-blue-400 focus:outline-none"
                            placeholder="Email"
                            required
                            />
                    </div>
                    <div>
                        <label class="block text-gray-700 mb-1" for="password">Password</label>
                        <input
                            type="password"
                            id="password"
                            name="password"
                            class="w-full px-4 py-2 border border-gray-300 rounded-md focus:ring-2 focus:ring-blue-400 focus:outline-none"
                            placeholder="Password"
                            required
                            />
                    </div>
                    <div class="text-right">
                        <button
                            type="submit"
                            class="bg-blue-500 text-white py-2 px-12 rounded-md hover:bg-blue-600 transition duration-300"
                            >
                            Login
                        </button>
                    </div>
                </form>
            </div>

            <!-- Illustration Section -->
            <div class="w-1/2 flex flex-col items-center">
                <img
                    src="<%= request.getContextPath()%>/resources/images/Assets/signin.svg"
                    alt="Login illustration"
                    class="max-w-full h-auto mb-4"
                    />
                <p class="text-gray-600 text-sm font-semibold mt-0">
                    Don’t have an account? <a href="<%= request.getContextPath()%>/SignUp.jsp" class="text-blue-500 hover:underline">Signup</a>
                </p>
            </div>
        </div>
    </body>
</html>
