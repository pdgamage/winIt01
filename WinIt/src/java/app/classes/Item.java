package app.classes;

import java.io.InputStream;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.Base64;
import java.io.ByteArrayOutputStream;


/**
 *
 * @author DILSHAN
 */
public class Item {
    private int id;
    private String firstName;
    private String lastName;
    private String contact;
    private String category;
    private BigDecimal price;
    private String description;
    private String image;

    public Item() {
    }

    public Item(int id, String firstName, String lastName, String contact, String category, BigDecimal price, String description, String image) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.contact = contact;
        this.category = category;
        this.price = price;
        this.description = description;
        this.image = image;
    }

    

    public String getFirstName() {
        return firstName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public List<Item> getAllItems(Connection con) {
        List<Item> itemList = new ArrayList<>();

        try {
            String query = "SELECT * FROM sellitems";
            PreparedStatement pstmt = con.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Item item = new Item(
                    rs.getInt("id"),
                    rs.getString("firstName"),
                    rs.getString("lastName"),
                    rs.getString("contact"),
                    rs.getString("category"),
                    rs.getBigDecimal("price"),
                    rs.getString("description"),
                    rs.getString("image")
                );
                System.out.println("Image Path: " + item.getImage());
                itemList.add(item);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Item.class.getName()).log(Level.SEVERE, null, ex);
        }

        return itemList;
    }

//    // Updated method to convert InputStream to Base64 encoded string
//     // Method to get Base64 encoded image
//    public String getImageBase64() {
//        try {
//            if (imageBytes == null) {
//                return null; // No image available
//            }
//            return "data:image/jpeg;base64," + Base64.getEncoder().encodeToString(imageBytes);
//        } catch (Exception e) {
//            e.printStackTrace();
//            return null; // Return null if an error occurs
//        }
//    }

//    // Method to set imageBytes from an InputStream
//    public void setImageBytes(InputStream inputStream) {
//        try {
//            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
//            byte[] buffer = new byte[1024];
//            int bytesRead;
//            while ((bytesRead = inputStream.read(buffer)) != -1) {
//                outputStream.write(buffer, 0, bytesRead);
//            }
//            this.imageBytes = outputStream.toByteArray();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
    
    public static Item getItemById(Connection conn, int id) {
    Item item = null;
    try {
        String query = "SELECT * FROM sellitems WHERE id = ?";
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setInt(1, id);
        ResultSet rs = pstmt.executeQuery();
        if (rs.next()) {
            item = new Item();
            item.setId(rs.getInt("id"));
            item.setFirstName(rs.getString("firstName"));
            item.setLastName(rs.getString("LastName"));
            item.setDescription(rs.getString("description"));
            item.setContact(rs.getString("contact"));
            item.setLastName(rs.getString("LastName"));
            item.setPrice(rs.getBigDecimal("price"));
            item.setCategory(rs.getString("category"));
             
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return item;
}
    
    
    
   

    

}

