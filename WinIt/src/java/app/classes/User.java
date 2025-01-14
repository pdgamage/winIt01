/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.classes;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author DILSHAN
 */
public class User {

    private int id;
    private String firstName;
    private String lastName;
    private String email;
    private String password;
    private String role;

    public User() {
    }

    public User(String email, String password) {
        this.email = email;
        this.password = MD5.getMd5(password);

    }

    public User(String firstName, String lastName, String email, String password, String role) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.password = MD5.getMd5(password);
        this.role = role;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getRole() {
        return role;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setRole(String role) {
        this.role = role;
    }
    
    

    public boolean register(Connection con) {

        try {

            String query = "INSERT INTO user(firstName,lastName,email,password,role) VALUES(?,?,?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, this.firstName);
            pstmt.setString(2, this.lastName);
            pstmt.setString(3, this.email);
            pstmt.setString(4, this.password);
            pstmt.setString(5, this.role);
            return pstmt.executeUpdate() > 0;
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }

    }

    public boolean authenticate(Connection con) {

        try {

            String query = "SELECT id, password FROM user WHERE email = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, this.email);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                String db_password = rs.getString("password");
                if (db_password.equals(this.password)) {
                    int user_id = rs.getInt("id");
                    this.setId(user_id);
                    return true;
                } else {
                    return false;
                }
            } else {
                return false;
            }

        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    public User getUserById(Connection con) {
        try {

            String query = "SELECT firstName,lastName, role FROM user WHERE id = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, this.id);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
             this.setFirstName(rs.getString("firstName"));   
             this.setRole(rs.getString("role"));   
               
            }

        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
            
            
        }

        return this;
    }

}
