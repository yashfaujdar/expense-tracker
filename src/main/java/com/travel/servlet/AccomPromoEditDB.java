package com.travel.servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class AccomPromoEditDB extends HttpServlet { 
    // JDBC driver name and database URL
    static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";  
    static final String DB_URL = "jdbc:mysql://localhost:3306/TIMS?serverTimezone=UTC";

    // Database credentials
    static final String USER = "root"; 
    static final String PASS = "sqldb";

    public void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String title = "Edit Accommodation Details";

        out.println(
            "<html>\n" +
            "<head>" +
            "<link rel=\"stylesheet\" href=\"PromRecTable.css\">" +
            "<title>" + title + "</title></head>\n" +
            "<body style=\"background-image:url('images/painting-1682416389136-9172.jpg'); background-repeat:no-repeat; background-size:cover; opacity:0.4\">\n");

        Connection conn = null;
        PreparedStatement stmt = null;
        Statement st = null;
        ResultSet rs = null;

        try {
            // Register JDBC driver
            Class.forName(JDBC_DRIVER);
            // Open a connection
            conn = DriverManager.getConnection(DB_URL, USER, PASS);

            String aid = request.getParameter("accom_id");
            int prom_pri = Integer.parseInt(request.getParameter("prom_pri"));
            
            // Execute SQL query to update promotion priority
            String updateSql = "UPDATE Accommodation SET prom_priority = ? WHERE accom_id = ?";
            stmt = conn.prepareStatement(updateSql);
            stmt.setInt(1, prom_pri);
            stmt.setString(2, aid);
            stmt.executeUpdate();
            stmt.close();  // Close the prepared statement

            // Execute SQL query to retrieve the accommodation details
            String selectSql = "SELECT * FROM Accommodation WHERE accom_id = ?";
            st = conn.createStatement();
            stmt = conn.prepareStatement(selectSql);
            stmt.setString(1, aid);
            rs = stmt.executeQuery();

            out.print("<table>");
            out.print("<tr><th>Accommodation ID</th>");
            out.print("<th>Location ID</th>");
            out.print("<th>Accommodation Name</th>");
            out.print("<th>Accommodation Type</th>");
            out.print("<th>Address</th>");
            out.print("<th>Cost</th>");
            out.print("<th>Amenities</th>");
            out.print("<th>Promotion Priority</th>");
            out.print("</tr>");

            if (rs.next()) {
                // Display the accommodation details
                out.print("<tr><td>" + rs.getString("accom_id") + "</td>");
                out.print("<td>" + rs.getString("loc_id") + "</td>");
                out.print("<td>" + rs.getString("accom_name") + "</td>");
                out.print("<td>" + rs.getString("accom_type") + "</td>");
                out.print("<td>" + rs.getString("address") + "</td>");
                out.print("<td>" + rs.getFloat("cost") + "</td>");
                out.print("<td>" + rs.getString("amenities") + "</td>");
                out.print("<td>" + prom_pri + "</td></tr>");
                out.println("</table>");
            } else {
                out.println("<p>No Records Found</p>");
            }
        } catch (SQLException se) {
            // Handle JDBC errors
            out.println("<p>Error occurred while processing the request</p>");
            se.printStackTrace();
        } catch (Exception e) {
            // Handle general errors
            out.println("<p>Error occurred</p>");
        } finally {
            // Close all connections and resources
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (st != null) st.close();
                if (conn != null) conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
            out.println("</body></html>");
        }
    }
}
