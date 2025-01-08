<%-- 
    Document   : SignUp
    Created on : Jan 4, 2025, 6:22:19 PM
    Author     : DILSHAN
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sign Up</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="bg-gray-100 flex items-center justify-center min-h-screen">
        <div class="bg-white shadow-lg rounded-lg w-full max-w-4xl p-8 flex items-center">
            <!-- Form Section -->
            <div class="w-1/2 pr-8">
                <h2 class="text-2xl font-bold mb-6">Sign up</h2>

                <%
                    if (request.getParameter("s") != null){
                        String message;
                        if(request.getParameter("s").equals("1")){
                        message = "<h6 style='color:green'>You successfully registered</h6>";
                        }else{
                        message = "<h6 style='color:red'>Error occured.please try again</h6>";
                        }
                        
                       out.println(message);
                }
                %> 
                <form action="registration.jsp" method="post" class="space-y-4">
                    <div>
                        <label class="block text-gray-700 mb-1" for="firstName">First Name</label>
                        <input
                            type="text"
                            id="firstName"
                            name="firstName"
                            class="w-full px-4 py-2 border border-gray-300 rounded-md focus:ring-2 focus:ring-blue-400 focus:outline-none"
                            placeholder="First Name"
                            required
                            />
                    </div>

                    <div>
                        <label class="block text-gray-700 mb-1" for="lastName">Last Name</label>
                        <input
                            type="text"
                            id="lastName"
                            name="lastName"
                            class="w-full px-4 py-2 border border-gray-300 rounded-md focus:ring-2 focus:ring-blue-400 focus:outline-none"
                            placeholder="Last Name"
                            required
                            />
                    </div>
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
                            Sign up
                        </button>
                    </div>
                </form>
            </div>

            <!-- Illustration Section -->
            <div class="w-1/2 flex flex-col items-center">
                <img
                    src="<%= request.getContextPath() %>/resources/images/Assets/signup.svg"
                    alt="Sign up illustration"
                    class="max-w-full h-auto mb-4"
                    />
                <p class="text-gray-600 text-sm mt-0 font-semibold">
                    Already have an account? <a href="<%= request.getContextPath()%>/index.jsp" class="text-blue-500 hover:underline">Login</a>
                </p>
            </div>
        </div>
    </body>
</html>
