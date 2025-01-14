<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Promotion Page</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <h1>Promotion Page</h1>
    </header>
    
    <section>
        <h2>Active Promotions</h2>
        <table>
            <thead>
                <tr>
                    <th>Promo Code</th>
                    <th>Description</th>
                    <th>Discount</th>
                    <th>Expiry Date</th>
                </tr>
            </thead>
            <tbody>
                <!-- Here you can dynamically generate content using JSP -->
                <tr>
                    <td>SUMMER20</td>
                    <td>20% off on all items</td>
                    <td>20%</td>
                    <td>2024-08-31</td>
                </tr>
                <tr>
                    <td>WINTER30</td>
                    <td>30% off on select items</td>
                    <td>30%</td>
                    <td>2024-12-31</td>
                </tr>
            </tbody>
        </table>
    </section>

    <footer>
        <p>&copy; 2024 Promotions Inc.</p>
    </footer>
</body>
</html>
