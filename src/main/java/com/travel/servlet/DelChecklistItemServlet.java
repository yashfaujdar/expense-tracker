package com.travel.servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class DelChecklistItemServlet extends HttpServlet {
    // JDBC driver name and database URL
    static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";  // Updated to the newer MySQL driver
    static final String DB_URL = "jdbc:mysql://localhost:3306/TIMS?serverTimezone=UTC";  // Added serverTimezone=UTC

    // Database credentials
    static final String USER = "root";
    static final String PASS = "sqldb";

    public void doGet(HttpServletRequest request, HttpServletResponse response) {
        try {
            HttpSession session = request.getSession(false);

            response.setContentType("text/html");
            PrintWriter out = response.getWriter(); 
            
            String uid = (String) session.getAttribute("uid");
            String cid = (String) request.getParameter("cid");
            int lno = Integer.parseInt(request.getParameter("cno"));

            out.println("Servlet");

            Class.forName(JDBC_DRIVER);
            Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);

            // Delete the checklist item
            String sql = "DELETE FROM checklistitems WHERE checklist_id= ? AND checklist_item_no= ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, cid);
            stmt.setInt(2, lno);
            stmt.executeUpdate();
            
            // Shift the remaining checklist items
            int i = lno + 1;
            while (true) {
                Statement stmt1 = conn.createStatement();
                String sql1 = "SELECT checklist_item_no FROM checklistitems WHERE checklist_id= ? AND checklist_item_no= ?";
                PreparedStatement stmt1Prepared = conn.prepareStatement(sql1);
                stmt1Prepared.setString(1, cid);
                stmt1Prepared.setInt(2, i);
                ResultSet rs = stmt1Prepared.executeQuery();

                if (rs.next()) {
                    int id = rs.getInt("checklist_item_no");
                    int newid = id - 1;
                    out.println(id + " " + newid);
                    String sql2 = "UPDATE checklistitems SET checklist_item_no= ? WHERE checklist_id= ? AND checklist_item_no= ?";
                    PreparedStatement stmt2 = conn.prepareStatement(sql2);
                    stmt2.setInt(1, newid);
                    stmt2.setString(2, cid);
                    stmt2.setInt(3, id);
                    stmt2.executeUpdate();
                } else {
                    break;
                }
                i++;
            }
            out.println("successful");

            // Close the resources
            stmt.close();
            stmt1.close();
            stmt2.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
