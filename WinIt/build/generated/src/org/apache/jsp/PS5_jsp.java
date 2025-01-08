package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class PS5_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"en\">\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta charset=\"UTF-8\">\r\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("        <title>Sell an Item - WinIt</title>\r\n");
      out.write("        <!-- Link CSS with context path -->\r\n");
      out.write("        <link href=\"https://fonts.googleapis.com/css2?family=Poppins:wght@600&display=swap\" rel=\"stylesheet\">\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.request.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/CSS/azus.css\">\r\n");
      out.write("        <link rel=\"preconnect\" href=\"https://fonts.googleapis.com\">\r\n");
      out.write("        <link href=\"https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;700&display=swap\" rel=\"stylesheet\">\r\n");
      out.write("          <script src=\"https://cdn.tailwindcss.com\"></script>\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        <!-- Navbar -->\r\n");
      out.write("        <nav class=\"bg-[#0056D2] text-white\">\r\n");
      out.write("            <div class=\"container mx-auto flex justify-between items-center px-4 py-3\">\r\n");
      out.write("                <!-- Logo -->\r\n");
      out.write("                <div class=\"text-[30px] font-bold\">Win<span class=\"text-red-500\">It</span></div>\r\n");
      out.write("                <!-- Search Area -->\r\n");
      out.write("                <div class=\"mr-10\">\r\n");
      out.write("                    <div class=\"relative w-[480px]\">\r\n");
      out.write("                        <input \r\n");
      out.write("                            type=\"text\" \r\n");
      out.write("                            class=\"w-full py-2 pl-10 pr-4 rounded-full text-gray-700 focus:outline-none focus:ring-2 focus:ring-blue-300\" \r\n");
      out.write("                            placeholder=\"Search for items...\"\r\n");
      out.write("                            />\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                <!-- Navigation Links -->\r\n");
      out.write("                <div class=\"flex space-x-14 items-center\">\r\n");
      out.write("                    <a href=\"user/liveAc.jsp\" class=\"hover-gold text-[20px] font-bold\">Live</a>\r\n");
      out.write("                    <a href=\"user/categories.jsp\" class=\"hover-gold text-[20px] font-bold\">Categories</a>\r\n");
      out.write("                    <a href=\"user/topPicks.jsp\" class=\"hover-gold text-[20px] font-bold\">Top Picks</a>\r\n");
      out.write("                    <a href=\"#\" class=\"hover-gold text-[20px] font-bold\">Sell an Item</a>\r\n");
      out.write("                    <a href=\"#\" class=\"flex items-center w-8 h-8\">\r\n");
      out.write("                        <img src=\"images/user.png\" alt=\"User Icon\"/>\r\n");
      out.write("                    </a>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </nav>\r\n");
      out.write("        \r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("        <main class=\"container mx-auto px-24 py-8\">\r\n");
      out.write("            <div class=\"flex items-center text-gray-500 font-medium text-sm mt-4\">\r\n");
      out.write("                <svg xmlns=\"http://www.w3.org/2000/svg\" class=\"h-4 w-4 mr-1\" fill=\"none\" viewBox=\"0 0 24 24\" stroke=\"currentColor\" stroke-width=\"2\">\r\n");
      out.write("                <path stroke-linecap=\"round\" stroke-linejoin=\"round\" d=\"M15 19l-7-7 7-7\" />\r\n");
      out.write("                </svg>\r\n");
      out.write("                <a href=\"user/dash.jsp\" class=\"hover:underline\">Back to Home</a>\r\n");
      out.write("            </div>\r\n");
      out.write("\r\n");
      out.write("            <h2 class=\"text-2xl font-bold mb-8\">PlayStaion 5</h2>\r\n");
      out.write("\r\n");
      out.write("            <section class=\"sell-item\">\r\n");
      out.write("                <div class=\"container\">\r\n");
      out.write("                    <div class=\"card\">\r\n");
      out.write("                        <div class=\"left-section\">\r\n");
      out.write("                            <img src=\"images/img1.jpg\" alt=\"Asus Rog Strix Laptop\">\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"right-section\">\r\n");
      out.write("\r\n");
      out.write("                            <p class=\"highest-bid\">Highest Bid: <strong>LKR 211,000</strong> <span style=\"color: blue; font-size: 12px; margin-left: 40px; \">70 bids</span></p>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("                            <p class=\"time-remaining\">Time remaining: <strong><span style=\"color: orange;\">05:17:03:04</span></strong></p>\r\n");
      out.write("\r\n");
      out.write("                            <button class=\"bid-button\">Bid LKR 212,000</button>\r\n");
      out.write("\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"details\">\r\n");
      out.write("                        <h2>Item Description</h2>\r\n");
      out.write("                        <p>Used PlayStation 5 in a mint condition with the controller. Up for the highest Bid!</p>\r\n");
      out.write("                        <h2>Seller Information</h2>\r\n");
      out.write("                        <p><strong>Seller Name:</strong> Pahan Kawindu</p>\r\n");
      out.write("                        <p><strong>Contact No:</strong> +94 766776568</p>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("\r\n");
      out.write("            </section>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("        </main>\r\n");
      out.write("\r\n");
      out.write("        <!-- Footer -->\r\n");
      out.write("        <footer>\r\n");
      out.write("            <div class=\"logo\">\r\n");
      out.write("                <a href=\"#\">Win<span class=\"highlight\">It</span></a>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"description\">\r\n");
      out.write("                WinIt is the leading global platform for online auctions, featuring local<br>auctions\r\n");
      out.write("                happening today, this weekend, and every day. Each week, we <br> showcase thousands \r\n");
      out.write("                of fresh listings from a network of over 15,000 <br>auctioneers across the country.\r\n");
      out.write("            </div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("            <div class=\"ft\">\r\n");
      out.write("                <div class=\"p\">\r\n");
      out.write("                    <p style=\"color: #ffffff;\">© WiniIt 2024 | All rights reserved</p>\r\n");
      out.write("                </div>\r\n");
      out.write("\r\n");
      out.write("                <div class=\"info\">\r\n");
      out.write("                    <div class=\"p1\"><p style=\"color: #ffffff;\">Terms & Conditions | Privacy Policy</p>\r\n");
      out.write("                    </div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("                </div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("        </footer>\r\n");
      out.write("\r\n");
      out.write("        <!-- Link JavaScript -->\r\n");
      out.write("        <script src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.request.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/js/SellItem.js\"></script>\r\n");
      out.write("    </body>\r\n");
      out.write("</html>\r\n");
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
