/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.classes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author DILSHAN
 */
public class Admin {

    // Method to fetch all items from the sellitems table
    public static ResultSet getAllItems() throws SQLException {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DbConnector.getConnection();
            String sql = "SELECT * FROM sellitems";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
        // Note: The caller is responsible for closing the ResultSet, PreparedStatement, and Connection.
        return rs;
    }

    // Method to delete an item and its related bids
    public static boolean deleteItem(int itemId) throws SQLException {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = DbConnector.getConnection();

            // Delete related bids
            String deleteBidsSql = "DELETE FROM bids WHERE item_id = ?";
            pstmt = conn.prepareStatement(deleteBidsSql);
            pstmt.setInt(1, itemId);
            pstmt.executeUpdate();

            // Delete the item
            String deleteItemSql = "DELETE FROM sellitems WHERE id = ?";
            pstmt = conn.prepareStatement(deleteItemSql);
            pstmt.setInt(1, itemId);
            int rowsAffected = pstmt.executeUpdate();

            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        } finally {
            if (pstmt != null) {
                pstmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    // Method to update an item
    public static boolean updateItem(int itemId, String firstName, String lastName, String contact, String category, double price, String description) throws SQLException {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = DbConnector.getConnection();
            String updateSql = "UPDATE sellitems SET firstName = ?, lastName = ?, contact = ?, category = ?, price = ?, description = ? WHERE id = ?";
            pstmt = conn.prepareStatement(updateSql);
            pstmt.setString(1, firstName);
            pstmt.setString(2, lastName);
            pstmt.setString(3, contact);
            pstmt.setString(4, category);
            pstmt.setDouble(5, price);
            pstmt.setString(6, description);
            pstmt.setInt(7, itemId);

            int rowsUpdated = pstmt.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        } finally {
            if (pstmt != null) {
                pstmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    // Method to fetch a single item by ID
    public static ResultSet getItemById(int itemId) throws SQLException {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DbConnector.getConnection();
            String selectSql = "SELECT * FROM sellitems WHERE id = ?";
            pstmt = conn.prepareStatement(selectSql);
            pstmt.setInt(1, itemId);
            rs = pstmt.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
        // Note: The caller is responsible for closing the ResultSet, PreparedStatement, and Connection.
        return rs;
    }
}
