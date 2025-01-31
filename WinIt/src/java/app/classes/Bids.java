/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.classes;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author DILSHAN
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
    
    
     public static Bids getBidsById(Connection conn, int id) {
    Bids bids = null;
    try {
        String query = "SELECT * FROM bids WHERE id = ?";
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setInt(1, id);
        ResultSet rs = pstmt.executeQuery();
        if (rs.next()) {
            bids = new Bids();
            bids.setId(rs.getInt("id"));
            bids.setItem_id(rs.getInt("item_id"));
            bids.setUser_id(rs.getInt("user_id"));
            bids.setBid_amount(rs.getBigDecimal("bid_amount"));
           
             
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return bids;
}
    
    
    
}
