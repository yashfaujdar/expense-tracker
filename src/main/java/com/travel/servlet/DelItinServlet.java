package com.travel.servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class DelItinServlet extends HttpServlet {
    // JDBC driver name and database URL
    static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";  // Updated MySQL driver
    static final String DB_URL = "jdbc:mysql://localhost:3306/TIMS?serverTimezone=UTC";  // Added serverTimezone=UTC

    // Database credentials
    static final String USER = "root";
    static final String PASS = "sqldb";

    public void doGet(HttpServletRequest request, HttpServletResponse response) {
        try {
            HttpSession session = request.getSession(false);

            response.setContentType("text/html");
            PrintWriter out = response.getWriter(); 

            String tid = request.getParameter("tid");
            String it_id = request.getParameter("it_id");

            int lno = Integer.parseInt(it_id);

            out.println("Servlet");

            // Register JDBC driver
            Class.forName(JDBC_DRIVER);
            Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);

            // Delete the itinerary entry
            String sql = "DELETE FROM itineraries WHERE trip_id = ? AND it_id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, tid);
            stmt.setInt(2, lno);
            stmt.executeUpdate();

            // Shift the remaining itinerary items
            int i = lno + 1;
            while (true) {
                String sql1 = "SELECT it_id FROM itineraries WHERE trip_id = ? AND it_id = ?";
                PreparedStatement stmt1 = conn.prepareStatement(sql1);
                stmt1.setString(1, tid);
                stmt1.setInt(2, i);
                ResultSet rs = stmt1.executeQuery();

                if (rs.next()) {
                    int id = rs.getInt("it_id");
                    int newid = id - 1;
                    out.println(id + " " + newid);

                    String sql2 = "UPDATE itineraries SET it_id = ? WHERE trip_id = ? AND it_id = ?";
                    PreparedStatement stmt2 = conn.prepareStatement(sql2);
                    stmt2.setInt(1, newid);
                    stmt2.setString(2, tid);
                    stmt2.setInt(3, id);
                    stmt2.executeUpdate();
                } else {
                    break;
                }
                i++;
            }

            out.println("successful");

            // Close resources
            stmt.close();
            stmt1.close();
            stmt2.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
