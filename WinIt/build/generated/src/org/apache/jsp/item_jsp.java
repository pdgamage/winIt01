package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class item_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <title>Sell an Item - WinIt</title>\n");
      out.write("        <!-- Link CSS with context path -->\n");
      out.write("        <link href=\"https://fonts.googleapis.com/css2?family=Poppins:wght@600&display=swap\" rel=\"stylesheet\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.request.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/CSS/SellItem.css\">\n");
      out.write("        <link rel=\"preconnect\" href=\"https://fonts.googleapis.com\">\n");
      out.write("        <link href=\"https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;700&display=swap\" rel=\"stylesheet\">\n");
      out.write("        <script src=\"https://cdn.tailwindcss.com\"></script>\n");
      out.write("    </head>\n");
      out.write("    <body class=\"bg-gray-100\">\n");
      out.write("        <!-- Navbar -->\n");
      out.write("        <nav class=\"bg-[#0056D2] text-white\">\n");
      out.write("            <div class=\"container mx-auto flex justify-between items-center px-4 py-3\">\n");
      out.write("                <!-- Logo -->\n");
      out.write("                <div class=\"text-[30px] font-bold\">Win<span class=\"text-red-500\">It</span></div>\n");
      out.write("                <!-- Search Area -->\n");
      out.write("                <div class=\"mr-10\">\n");
      out.write("                    <div class=\"relative w-[480px]\">\n");
      out.write("                        <input \n");
      out.write("                            type=\"text\" \n");
      out.write("                            class=\"w-full py-2 pl-10 pr-4 rounded-full text-gray-700 focus:outline-none focus:ring-2 focus:ring-blue-300\" \n");
      out.write("                            placeholder=\"Search for items...\"\n");
      out.write("                            />\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <!-- Navigation Links -->\n");
      out.write("                <div class=\"flex space-x-14 items-center\">\n");
      out.write("                    <a href=\"user/liveAc.jsp\" class=\"hover-gold text-[20px] font-bold\">Live</a>\n");
      out.write("                    <a href=\"user/categories.jsp\" class=\"hover-gold text-[20px] font-bold\">Categories</a>\n");
      out.write("                    <a href=\"user/topPicks.jsp\" class=\"hover-gold text-[20px] font-bold\">Top Picks</a>\n");
      out.write("                    <a href=\"#\" class=\"hover-gold text-[20px] font-bold\">Sell an Item</a>\n");
      out.write("                    <a href=\"#\" class=\"flex items-center w-8 h-8\">\n");
      out.write("                        <img src=\"images/user.png\" alt=\"User Icon\"/>\n");
      out.write("                    </a>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </nav>\n");
      out.write("      \n");
      out.write("        <h2><a href=\"user/dash.jsp\"> < Back to Home</a></h2>\n");
      out.write("        <h1>Sell an Item</h1>\n");
      out.write("        <p>Want to sell an item? Create a listing and make the best out of it!</p>\n");
      out.write("        <!-- Sell Item Form -->\n");
      out.write("        <main class=\"form-container\">\n");
      out.write("            <div class=\"image-box\">\n");
      out.write("                <img src=\"images/right.png\" alt=\"Image\" class=\"image\">\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <form id=\"sellForm\" action=\"SellItemServlet\" method=\"post\" enctype=\"multipart/form-data\">\n");
      out.write("\n");
      out.write("                <div class=\"form-group\">\n");
      out.write("                    <label for=\"firstName\">First Name:</label>\n");
      out.write("                    <img src=\"images/first-name-icon.png\" alt=\"FNIcon\" class=\"form-icon\">\n");
      out.write("                    <input type=\"text\" id=\"firstName\" name=\"firstName\" required>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div class=\"form-group\">\n");
      out.write("                    <label for=\"lastName\">Last Name:</label>\n");
      out.write("                    <img src=\"images/last-name-icon.png\" alt=\"LNIcon\" class=\"form-icon\">\n");
      out.write("                    <input type=\"text\" id=\"lastName\" name=\"lastName\" required>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div class=\"form-group\">\n");
      out.write("                    <label for=\"contact\">Contact Number:</label>\n");
      out.write("                    <img src=\"images/contact-icon.png\" alt=\"CIcon\" class=\"form-icon\">\n");
      out.write("                    <input type=\"tel\" id=\"contact\" name=\"contact\" required>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div class=\"form-group\">\n");
      out.write("                    <label for=\"category\">Category:</label>\n");
      out.write("                    <img src=\"images/category-icon.png\" alt=\"CIcon\" class=\"form-icon\">\n");
      out.write("                    <input type=\"text\" id=\"category\" name=\"category\" required>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div class=\"form-group\">\n");
      out.write("                    <label for=\"price\">Initial Value (LKR):</label>\n");
      out.write("                    <img src=\"images/value-icon.png\" alt=\"VIcon\" class=\"form-icon\">\n");
      out.write("                    <input type=\"number\" id=\"price\" name=\"price\" required>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div class=\"form-group\">\n");
      out.write("                    <label for=\"description\">Item Description:</label>\n");
      out.write("                    <img src=\"images/description-icon.png\" alt=\"DIcon\" class=\"form-icon\">\n");
      out.write("                    <input type=\"text\" id=\"category\" name=\"category\" required>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div class=\"form-group\">\n");
      out.write("                    <label for=\"image\">Item’s Photos:</label>\n");
      out.write("                    <img src=\"images/Item’s Photos-icon.png\" alt=\"IPIcon\" class=\"form-icon\">\n");
      out.write("                    <input type=\"file\" id=\"image\" name=\"image\" required>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <button type=\"submit\" class=\"submit-btn\">Create</button>\n");
      out.write("\n");
      out.write("            </form>\n");
      out.write("\n");
      out.write("\n");
      out.write("        </main>\n");
      out.write("\n");
      out.write("       <!-- Footer Section -->\n");
      out.write("        <section class=\"bg-[#24384B] text-white py-10 mt-40\">\n");
      out.write("            <div class=\"max-w-7xl mx-auto px-6\">\n");
      out.write("                <div class=\"flex flex-col md:flex-row justify-between items-start md:items-center\">\n");
      out.write("                    <!-- Branding and Description -->\n");
      out.write("                    <div class=\"mb-6 md:mb-0\">\n");
      out.write("                        <div class=\"flex items-center mb-4\">\n");
      out.write("                            <span class=\"text-2xl font-bold\">Win<span class=\"text-red-500\">It</span></span>\n");
      out.write("                        </div>\n");
      out.write("                        <p class=\"text-gray-300\">WinIt is the leading global platform for online auctions, <br/>featuring local auctions happening today, this weekend, and every day. <br/>Each week, we showcase thousands of fresh listings from a network of over 15,000 auctioneers across the country.</p>\n");
      out.write("                    </div>\n");
      out.write("                    <!-- Quick Links -->\n");
      out.write("                    <div class=\"flex flex-col md:flex-row md:space-x-10\">\n");
      out.write("                        <div class=\"mb-6 md:mb-0 pr-36\">\n");
      out.write("                            <h3 class=\"text-lg font-semibold mb-4\">Quick Links</h3>\n");
      out.write("                            <ul>\n");
      out.write("                                <li><a href=\"#\" class=\"text-gray-300 hover:text-yellow-500\">Create Account</a></li>\n");
      out.write("                                <li><a href=\"#\" class=\"text-gray-300 hover:text-yellow-500\">Categories</a></li>\n");
      out.write("                                <li><a href=\"#\" class=\"text-gray-300 hover:text-yellow-500\">Sell Online</a></li>\n");
      out.write("                                <li><a href=\"#\" class=\"text-gray-300 hover:text-yellow-500\">About Us</a></li>\n");
      out.write("                                <li><a href=\"#\" class=\"text-gray-300 hover:text-yellow-500\">Contact Us</a></li>\n");
      out.write("                            </ul>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <!-- Copyright and Policies -->\n");
      out.write("                <div class=\"flex flex-col md:flex-row justify-between items-center mt-10\">\n");
      out.write("                    <p class=\"text-gray-400\">© WinIt 2024 | All rights reserved</p>\n");
      out.write("                    <div class=\"flex space-x-4 mt-4 md:mt-0\">\n");
      out.write("                        <a href=\"#\" class=\"text-gray-400 hover:text-white\">Terms & Conditions</a>\n");
      out.write("                        <a href=\"#\" class=\"text-gray-400 hover:text-white\">Privacy Policy</a>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"flex space-x-4 mt-4 md:mt-0 pr-36\">\n");
      out.write("                        <a href=\"#\"><img src=\"images/facebook.png\" alt=\"Facebook\" class=\"h-6\"></a>\n");
      out.write("                        <a href=\"#\"><img src=\"images/twitter.png\" alt=\"Twitter\" class=\"h-6\"></a>\n");
      out.write("                        <a href=\"#\"><img src=\"images/instagram.png\" alt=\"Instagram\" class=\"h-6\"></a>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </section>\n");
      out.write("\n");
      out.write("        <!-- Link JavaScript -->\n");
      out.write("        <script src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.request.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/js/SellItem.js\"></script>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
