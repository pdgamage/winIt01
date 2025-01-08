package org.apache.jsp.user;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class categories_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html; charset=UTF-8");
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
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <title>categories</title>\n");
      out.write("        <script src=\"https://cdn.tailwindcss.com\"></script>\n");
      out.write("        <script src=\"https://unpkg.com/@heroicons/react@2.0.16/dist/heroicons.min.js\"></script>\n");
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
      out.write("                    <a href=\"liveAc.jsp\" class=\"hover-gold text-[20px] font-bold\">Live</a>\n");
      out.write("                    <a href=\"categories.jsp\" class=\"hover-gold text-[20px] font-bold\">Categories</a>\n");
      out.write("                    <a href=\"topPicks.jsp\" class=\"hover-gold text-[20px] font-bold\">Top Picks</a>\n");
      out.write("                    <a href=\"../item.jsp\" class=\"hover-gold text-[20px] font-bold\">Sell an Item</a>\n");
      out.write("                    <a href=\"#\" class=\"flex items-center w-8 h-8\">\n");
      out.write("                        <img src=\"../resources/images/howItWork/user.png\" alt=\"User Icon\"/>\n");
      out.write("                    </a>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </nav>\n");
      out.write("\n");
      out.write("        <!-- Main Content -->\n");
      out.write("        <main class=\"container mx-auto px-24 py-8\">\n");
      out.write("            <div class=\"flex items-center text-gray-500 font-medium text-sm mt-4\">\n");
      out.write("                <svg xmlns=\"http://www.w3.org/2000/svg\" class=\"h-4 w-4 mr-1\" fill=\"none\" viewBox=\"0 0 24 24\" stroke=\"currentColor\" stroke-width=\"2\">\n");
      out.write("                <path stroke-linecap=\"round\" stroke-linejoin=\"round\" d=\"M15 19l-7-7 7-7\" />\n");
      out.write("                </svg>\n");
      out.write("                <a href=\"dash.jsp\" class=\"hover:underline\">Back to Home</a>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <h2 class=\"text-2xl font-bold mb-8\">Categories</h2>\n");
      out.write("            <div class=\"grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 justify-items-center gap-6\">\n");
      out.write("                ");

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
                
      out.write("\n");
      out.write("                <a href=\"");
      out.print( category[4]);
      out.write("\" class=\"w-56 bg-white rounded-xl shadow-lg overflow-hidden h-[250px] block\">\n");
      out.write("                    <div class=\"relative\">\n");
      out.write("                        <img src=\"");
      out.print( category[2]);
      out.write("\" alt=\"");
      out.print( category[3]);
      out.write("\" class=\"w-full h-48 object-cover p-2 rounded-lg\">\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"p-4\">\n");
      out.write("                        <h3 class=\"font-medium text-gray-900 text-center\">");
      out.print( category[0]);
      out.write("</h3>\n");
      out.write("                       \n");
      out.write("                    </div>\n");
      out.write("                </a>\n");
      out.write("                ");
 }
      out.write("\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("        </main>\n");
      out.write("\n");
      out.write("        <footer class=\"bg-gray-900 text-white px-8 py-12\">\n");
      out.write("            <div class=\"container mx-auto\">\n");
      out.write("                <div class=\"flex justify-between mb-12\">\n");
      out.write("                    <div class=\"max-w-lg mx-[100px]\">\n");
      out.write("                        <h2 class=\"text-2xl font-bold mb-4\">Win<span class=\"text-red-500\">It</span></h2>\n");
      out.write("                        <p class=\"text-gray-400 mb-2\">WinIt is the leading global platform for online auctions, featuring local auctions happening today, this weekend, and every day.</p>\n");
      out.write("                        <p class=\"text-gray-400\">Each week, we showcase thousands of fresh listings from a network of over 15,000 auctioneers across the country.</p>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"pr-[200px]\">\n");
      out.write("                        <h3 class=\"text-lg font-semibold mb-4\">Quick Links</h3>\n");
      out.write("                        <div class=\"grid grid-cols-2 gap-x-16\">\n");
      out.write("                            <div>\n");
      out.write("                                <p class=\"text-gray-400 mb-2\"><a href=\"#\">Create Account</a></p>\n");
      out.write("                                <p class=\"text-gray-400 mb-2\"><a href=\"#\">Categories</a></p>\n");
      out.write("                                <p class=\"text-gray-400\"><a href=\"#\">Sell Online</a></p>\n");
      out.write("                            </div>\n");
      out.write("                            <div>\n");
      out.write("                                <p class=\"text-gray-400 mb-2\"><a href=\"#\">About Us</a></p>\n");
      out.write("                                <p class=\"text-gray-400\"><a href=\"#\">Contact Us</a></p>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"flex justify-between items-center pt-8 \">\n");
      out.write("                    <p class=\"text-white pl-[300px]\">© WinIt 2024 | All rights reserved</p>\n");
      out.write("                    <div class=\"flex items-center gap-8\">\n");
      out.write("                        <div class=\"text-white pr-[300px]\">\n");
      out.write("                            <a href=\"#\">Terms & Conditions</a>\n");
      out.write("                            <span class=\"mx-2\">|</span>\n");
      out.write("                            <a href=\"#\">Privacy Policy</a>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"flex gap-4 pr-[150px]\">\n");
      out.write("                            <!-- Social Links Here -->\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </footer>\n");
      out.write("    </body>\n");
      out.write("</html>");
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
