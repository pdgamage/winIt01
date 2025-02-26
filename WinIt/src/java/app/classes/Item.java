package app.classes;

import java.io.InputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.Base64;

public class Item {

    private int id;
    private String firstName;
    private String lastName;
    private String contact;
    private String category;
    private BigDecimal price;
    private String description;
    private byte[] imageBytes;

    public Item() {
    }

    public Item(int id, String firstName, String lastName, String contact, String category, BigDecimal price, String description, byte[] imageBytes) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.contact = contact;
        this.category = category;
        this.price = price;
        this.description = description;
        this.imageBytes = imageBytes;
    }

    // Getter and Setter methods...
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
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

    public byte[] getImageBytes() {
        return imageBytes;
    }

    public void setImageBytes(byte[] imageBytes) {
        this.imageBytes = imageBytes;
    }

    // Convert image bytes to Base64
    public String getImageBase64() {
        if (imageBytes == null || imageBytes.length == 0) {
            return null;
        }
        return "data:image/jpeg;base64," + Base64.getEncoder().encodeToString(imageBytes);
    }

    public static List<Item> getAllItems(Connection con) {
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
                        rs.getBytes("image") // Fetch image as bytes
                );
                itemList.add(item);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Item.class.getName()).log(Level.SEVERE, null, ex);
        }
        return itemList;
    }

    public static Item getItemById(Connection conn, int id) {
        Item item = null;
        try {
            String query = "SELECT * FROM sellitems WHERE id = ?";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                item = new Item(
                        rs.getInt("id"),
                        rs.getString("firstName"),
                        rs.getString("lastName"),
                        rs.getString("contact"),
                        rs.getString("category"),
                        rs.getBigDecimal("price"),
                        rs.getString("description"),
                        rs.getBytes("image")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return item;
    }

    // Method to calculate auction end time for an item
    public static long getAuctionEndTime(Connection conn, int itemId) throws SQLException {
        long auctionEndTime = 0;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            String sql = "SELECT created_at FROM sellitems WHERE id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, itemId);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                Timestamp createdAt = rs.getTimestamp("created_at");
                if (createdAt != null) {
                    long createdTime = createdAt.getTime();
                    auctionEndTime = createdTime + (4 * 60 * 60 * 1000); // 2 hours auction
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pstmt != null) {
                pstmt.close();
            }
        }
        return auctionEndTime;
    }

}
