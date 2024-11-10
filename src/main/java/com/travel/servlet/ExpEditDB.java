package com.travel.servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class ExpEditDB extends HttpServlet {
    // JDBC driver name and database URL
    static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";  // Updated driver
    static final String DB_URL = "jdbc:mysql://localhost:3306/TIMS?serverTimezone=UTC";  // Added timezone

    // Database credentials
    static final String USER = "root";
    static final String PASS = "sqldb";

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set response content type
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        Connection conn = null;
        PreparedStatement st_ins = null;
        ResultSet rs1 = null;

        try {
            // Register JDBC driver and open a connection
            Class.forName(JDBC_DRIVER);
            conn = DriverManager.getConnection(DB_URL, USER, PASS);

            // Retrieve parameters from the request
            String budgetId = request.getParameter("budget_id");
            String tripId = request.getParameter("trip_id");
            String expDetails = request.getParameter("exp_dets");
            float amountSpent = Float.parseFloat(request.getParameter("amt_spent"));

            // Counting the current number of expenses for the given budget_id and trip_id
            String countSql = "SELECT COUNT(*) AS expense_count FROM expenses WHERE budget_id = ? AND trip_id = ?";
            PreparedStatement countStmt = conn.prepareStatement(countSql);
            countStmt.setString(1, budgetId);
            countStmt.setString(2, tripId);
            rs1 = countStmt.executeQuery();
            int no_exp = 1; // Start from 1 by default
            if (rs1.next()) {
                no_exp = rs1.getInt("expense_count") + 1;
            }

            // Insert into the expenses table
            String insertSql = "INSERT INTO expenses (expense_id, budget_id, trip_id, exp_dets, amt_spent) VALUES (?, ?, ?, ?, ?)";
            st_ins = conn.prepareStatement(insertSql);
            st_ins.setInt(1, no_exp);
            st_ins.setString(2, budgetId);
            st_ins.setString(3, tripId);
            st_ins.setString(4, expDetails);
            st_ins.setFloat(5, amountSpent);
            st_ins.executeUpdate();

            // Send response
            out.println("<html><body>");
            out.println("<h3>Expense Record Inserted Successfully</h3>");
            out.println("<p>Expense ID: " + no_exp + "</p>");
            out.println("</body></html>");

        } catch (Exception e) {
            // Handle exceptions
            e.printStackTrace(out);
        } finally {
            // Close resources in finally block
            try {
                if (rs1 != null) rs1.close();
                if (st_ins != null) st_ins.close();
                if (conn != null) conn.close();
            } catch (SQLException se) {
                se.printStackTrace(out);
            }
        }
    }
}