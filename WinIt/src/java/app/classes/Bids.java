package app.classes;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Bids class for handling bid-related operations.
 */
public class Bids {

    private int id;
    private int user_id;
    private int item_id;
    private BigDecimal bid_amount;

    public Bids() {
    }

    public Bids(int id, int user_id, int item_id, BigDecimal bid_amount) {
        this.id = id;
        this.user_id = user_id;
        this.item_id = item_id;
        this.bid_amount = bid_amount;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getItem_id() {
        return item_id;
    }

    public void setItem_id(int item_id) {
        this.item_id = item_id;
    }

    public BigDecimal getBid_amount() {
        return bid_amount;
    }

    public void setBid_amount(BigDecimal bid_amount) {
        this.bid_amount = bid_amount;
    }

    public static class BidsWithDetails {

        private int itemId;
        private BigDecimal bidAmount;
        private String category;
        private String sellerFirstName;
        private String sellerLastName;

        public BidsWithDetails(int itemId, BigDecimal bidAmount, String category, String sellerFirstName, String sellerLastName) {
            this.itemId = itemId;
            this.bidAmount = bidAmount;
            this.category = category;
            this.sellerFirstName = sellerFirstName;
            this.sellerLastName = sellerLastName;
        }

        // Getters
        public int getItemId() {
            return itemId;
        }

        public BigDecimal getBidAmount() {
            return bidAmount;
        }

        public String getCategory() {
            return category;
        }

        public String getSellerFirstName() {
            return sellerFirstName;
        }

        public String getSellerLastName() {
            return sellerLastName;
        }
    }

    /**
     * Fetch bid details by bid ID.
     */
    public static Bids getBidsById(Connection conn, int id) {
        Bids bids = null;
        String query = "SELECT * FROM bids WHERE id = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                bids = new Bids(
                        rs.getInt("id"),
                        rs.getInt("user_id"),
                        rs.getInt("item_id"),
                        rs.getBigDecimal("bid_amount")
                );
            }
        } catch (SQLException e) {
            System.err.println("Error fetching bid by ID: " + e.getMessage());
        }
        return bids;
    }

    /**
     * Fetch all bids for a specific user.
     */
    public static List<BidsWithDetails> getUserBids(int userId) {
        List<BidsWithDetails> bidsList = new ArrayList<>();
        String query = "SELECT b.bid_amount, s.id AS item_id, s.category, "
                + "s.firstName AS sellerFirstName, s.lastName AS sellerLastName, s.created_at "
                + "FROM bids b "
                + "JOIN sellitems s ON b.item_id = s.id "
                + "WHERE b.user_id = ? "
                + "AND TIMESTAMPDIFF(MINUTE, s.created_at, NOW()) > 10 "
                + "ORDER BY b.bid_amount DESC";

        try (Connection con = DbConnector.getConnection();
                PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.setInt(1, userId);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                BidsWithDetails bid = new BidsWithDetails(
                        rs.getInt("item_id"),
                        rs.getBigDecimal("bid_amount"),
                        rs.getString("category"),
                        rs.getString("sellerFirstName"),
                        rs.getString("sellerLastName")
                );
                bidsList.add(bid);
            }
        } catch (Exception e) {
            System.err.println("Error fetching user bids: " + e.getMessage());
        }
        return bidsList;
    }

}
