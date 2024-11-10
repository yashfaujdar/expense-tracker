package com.travel.servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class AccFiltServlet extends HttpServlet {
    // JDBC driver name and database URL
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
    static final String DB_URL = "jdbc:mysql://localhost:3306/TIMS";

    //  Database credentials
    static final String USER = "root";
    static final String PASS = "sqldb";

    public void doGet(HttpServletRequest request, HttpServletResponse response) {  
        try {            
            response.setContentType("text/html");  
            PrintWriter out = response.getWriter();

            String dest_city = request.getParameter("dest_city");
            String c1 = request.getParameter("c1");
            String c2 = request.getParameter("c2");
            String fn = request.getParameter("fn");

            out.println("<table>");
            out.println("<tr><th>Accomodation Type</th><th>Accomodation Name</th><th>Address</th><th>Cost</th><th>Amenities</th></tr>");

            // Register JDBC driver
            Class.forName(JDBC_DRIVER);
            Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);

            // Prepare the SQL query with parameters to avoid SQL injection
            String sql1 = (c1.equals("Hostel") || c1.equals("Hotel") || c1.equals("Villa") || c1.equals("Resort") || c1.equals("Homestay")) ? c1 : "%";
            String sql4 = c2.equals("inc") ? ", cost ASC" : (c2.equals("dec") ? ", cost DESC" : "");

            String sql = "SELECT * FROM accommodation NATURAL JOIN location WHERE city = ? AND accom_type LIKE ? ORDER BY prom_priority" + sql4;
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, dest_city);
            stmt.setString(2, sql1);

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                out.println("<tr id='" + rs.getString("accom_id") + "' onclick='clear_all();" + fn + "(" + rs.getString("accom_id") + ");'><td>" + rs.getString("accom_type") + "</td><td>" + rs.getString("accom_name") + "</td><td>" + rs.getString("address") + "</td><td>" + rs.getString("cost") + "</td><td>" + rs.getString("amenities") + "</td></tr>");
            }

            out.println("</table>");
            rs.close();
            stmt.close();
            conn.close();

        } catch (Exception e) { 
            e.printStackTrace();
            // Handle exception
        }  
    }  
}
