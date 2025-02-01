import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

@WebServlet("/SellItemServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,    // 2MB
                 maxFileSize = 1024 * 1024 * 10,         // 10MB
                 maxRequestSize = 1024 * 1024 * 50)      // 50MB
public class SellItemServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String uploadPath = getServletContext().getRealPath("/uploads");
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();  // Create upload directory if not exists

        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "")) {
            String sql = "INSERT INTO SellItems (firstName, lastName, contact, category, price, description, image) VALUES (?, ?, ?, ?, ?, ?, ?)";
            
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, request.getParameter("firstName"));
                stmt.setString(2, request.getParameter("lastName"));
                stmt.setString(3, request.getParameter("contact"));
                stmt.setString(4, request.getParameter("category"));
                stmt.setDouble(5, Double.parseDouble(request.getParameter("price")));
                stmt.setString(6, request.getParameter("description"));

                // Handle file upload
                Part filePart = request.getPart("image");
                String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                String filePath = uploadPath + File.separator + fileName;

                // Save file to server
                try (InputStream fileContent = filePart.getInputStream()) {
                    Files.copy(fileContent, Paths.get(filePath));
                }

                // Save file path in the database
                stmt.setString(7, "uploads/" + fileName); 

                int result = stmt.executeUpdate();
                if (result > 0) {
                    response.getWriter().println("Item uploaded successfully!");
                } else {
                    response.getWriter().println("Failed to upload item.");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
