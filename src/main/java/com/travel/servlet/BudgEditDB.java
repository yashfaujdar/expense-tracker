package com.travel.servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class BudgEditDB extends HttpServlet {
    // JDBC driver name and database URL
    static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";  
    static final String DB_URL = "jdbc:mysql://localhost:3306/TIMS?serverTimezone=UTC";

    // Database credentials
    static final String USER = "root";
    static final String PASS = "sqldb";

    public void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException { 
    
        // Set response content type
        response.setContentType("text/html"); 
        PrintWriter out = response.getWriter();
        String title = "Insert and View Budget";

        try {
            // Register JDBC driver
            Class.forName(JDBC_DRIVER);
            // Open a connection
            Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);

            // Find the number of existing budgets for the given trip_id
            String sql = "SELECT * FROM Budget WHERE trip_id = ?";
            PreparedStatement st_c = conn.prepareStatement(sql);
            st_c.setString(1, request.getParameter("trip_id"));
            ResultSet rs1 = st_c.executeQuery();

            int budg_id = 1;
            while (rs1.next()) {
                budg_id++;
            }
            st_c.close(); 
            rs1.close();

            // Convert the budget id to String
            String b = String.valueOf(budg_id);

            // Insert new budget into the table
            String insertSql = "INSERT INTO Budget VALUES (?, ?, ?, ?)";
            PreparedStatement st_ins = conn.prepareStatement(insertSql);
            st_ins.setString(1, b);
            st_ins.setString(2, request.getParameter("trip_id"));
            st_ins.setString(3, request.getParameter("group_name"));
            st_ins.setFloat(4, Float.parseFloat(request.getParameter("amt")));
            st_ins.executeUpdate();

            st_ins.close();
            conn.close();

            out.println("<p>Insert Successful....</p>"); 
        } catch (Exception e) {
            out.println("<p>Error occurred: " + e.getMessage() + "</p>");
            e.printStackTrace();
        }
    }
}
