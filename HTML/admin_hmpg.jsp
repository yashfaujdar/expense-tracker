<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <h1>Welcome to the Admin Dashboard</h1>
    </header>

    <nav>
        <ul>
            <li><a href="users.jsp">Manage Users</a></li>
            <li><a href="promotions.jsp">Manage Promotions</a></li>
            <li><a href="reports.jsp">View Reports</a></li>
        </ul>
    </nav>

    <section>
        <h2>Overview</h2>
        <p>Welcome back, Admin! Here's a quick overview of the system.</p>
        <!-- Insert dynamic content here, for example, user stats or report summaries -->
        <%
            // Example: Displaying dynamic statistics
            Integer userCount = (Integer) request.getAttribute("userCount");
            Integer reportCount = (Integer) request.getAttribute("reportCount");

            if (userCount != null && reportCount != null) {
        %>
        <ul>
            <li>Total Users: <%= userCount %></li>
            <li>Total Reports: <%= reportCount %></li>
        </ul>
        <% } else { %>
        <p>No data available at the moment.</p>
        <% } %>
    </section>

    <footer>
        <p>&copy; 2024 Admin Dashboard</p>
    </footer>
</body>
</html>
