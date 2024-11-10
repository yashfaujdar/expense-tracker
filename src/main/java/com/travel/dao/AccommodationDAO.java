package com.travel.dao;

import java.sql.*;

public class AccomPromoDao {
    // Database credentials and URL
    private static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    private static final String DB_URL = "jdbc:mysql://localhost:3306/TIMS";
    private static final String USER = "root";
    private static final String PASS = "sqldb";

    // Method to update promotion priority for an accommodation
    public boolean updatePromoPriority(String accomId, int promoPriority) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            // Register JDBC driver
            Class.forName(JDBC_DRIVER);
            // Open a connection
            conn = DriverManager.getConnection(DB_URL, USER, PASS);

            String sql = "UPDATE Accommodation SET prom_priority = ? WHERE accom_id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, promoPriority);
            stmt.setString(2, accomId);

            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
    }

    // Method to get accommodation details
    public ResultSet getAccommodationDetails(String accomId) {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            // Register JDBC driver
            Class.forName(JDBC_DRIVER);
            // Open a connection
            conn = DriverManager.getConnection(DB_URL, USER, PASS);

            stmt = conn.createStatement();
            String sql = "SELECT * FROM Accommodation WHERE accom_id = '" + accomId + "'";
            rs = stmt.executeQuery(sql);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return rs;
    }
}
