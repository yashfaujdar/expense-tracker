package com.travel.servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class AddItemServlet extends HttpServlet {
    // JDBC driver name and database URL
    static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";  
    static final String DB_URL = "jdbc:mysql://localhost:3306/TIMS?serverTimezone=UTC";

    // Database credentials
    static final String USER = "root";
    static final String PASS = "sqldb";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set content type
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession(false);  // Get session if exists
        if (session == null || session.getAttribute("uid") == null) {
            out.println("<p>You must be logged in to add an item.</p>");
            return;
        }

        String uid = (String) session.getAttribute("uid");  // Get user ID from session
        String cid = request.getParameter("cid");  // Get checklist ID
        String itemName = request.getParameter("name");  // Get item name
        int checklistNo = Integer.parseInt(request.getParameter("cno"));  // Get checklist number

        // Output for debugging purposes (you can remove it later)
        out.println("<p>Adding item with details:</p>");
        out.println("<p>Checklist ID: " + cid + "</p>");
        out.println("<p>Item Name: " + itemName + "</p>");
        out.println("<p>Checklist No: " + checklistNo + "</p>");

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            // Register JDBC driver
            Class.forName(JDBC_DRIVER);
            // Open a connection
            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            
            // SQL query to insert the item into the checklist
            String sql = "INSERT INTO checklistitems (checklist_no, checklist_id, item_name, added_by) VALUES (?, ?, ?, NULL)";
            stmt = conn.prepareStatement(sql);
            
            // Set the parameters for the prepared statement
            stmt.setInt(1, checklistNo);
            stmt.setString(2, cid);
            stmt.setString(3, itemName);
            
            // Execute the update
            int rowsAffected = stmt.executeUpdate();
            
            if (rowsAffected > 0) {
                out.println("<p>Item added successfully!</p>");
            } else {
                out.println("<p>Failed to add the item.</p>");
            }
        } catch (SQLException e) {
            out.println("<p>Error occurred while inserting the item.</p>");
            e.printStackTrace();  // Print stack trace for debugging
        } catch (Exception e) {
            out.println("<p>Unexpected error occurred.</p>");
            e.printStackTrace();  // Print stack trace for debugging
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException se) {
                out.println("<p>Error closing resources.</p>");
                se.printStackTrace();  // Print stack trace for debugging
            }
        }

        out.println("</body></html>");
    }
}
