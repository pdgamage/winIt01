
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

@WebServlet("/SellItemServlet")
@MultipartConfig
public class SellItemServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "")) {
            String sql = "INSERT INTO SellItems (firstName, lastName, contact, category, price, description, image) VALUES (?, ?, ?, ?, ?, ?, ?)";

            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, request.getParameter("firstName"));
                stmt.setString(2, request.getParameter("lastName"));
                stmt.setString(3, request.getParameter("contact"));
                stmt.setString(4, request.getParameter("category"));
                stmt.setBigDecimal(5, new java.math.BigDecimal(request.getParameter("price")));
                stmt.setString(6, request.getParameter("description"));

                Part filePart = request.getPart("image");
                stmt.setBlob(7, filePart != null ? filePart.getInputStream() : null);

                int rowsInserted = stmt.executeUpdate();
                response.sendRedirect("item.jsp?s=" + (rowsInserted > 0 ? "1" : "0"));
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<h1>Error: " + e.getMessage() + "</h1>");
        }
    }
}
