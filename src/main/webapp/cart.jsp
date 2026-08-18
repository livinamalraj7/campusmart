<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Cart | CampusMart</title>

    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        body {
            background: #f1f5fb;
            color: #172d63;
        }

        .navbar {
            height: 70px;
            background: #192b61;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 7%;
        }

        .logo {
            color: white;
            font-size: 28px;
            font-weight: bold;
        }

        .logo span {
            color: #3d7af2;
        }

        .nav-links {
            display: flex;
            gap: 28px;
            align-items: center;
        }

        .nav-links a {
            color: white;
            text-decoration: none;
            font-size: 15px;
        }

        .nav-links a:hover {
            color: #93c5fd;
        }

        .login-btn {
            background: #2563eb;
            padding: 9px 18px;
            border-radius: 6px;
        }

        .cart-container {
            width: 85%;
            max-width: 1100px;
            margin: 50px auto;
        }

        .cart-title {
            text-align: center;
            margin-bottom: 35px;
        }

        .cart-title h1 {
            font-size: 40px;
            margin-bottom: 10px;
        }

        .cart-title p {
            color: #5d7098;
            font-size: 17px;
        }

        .cart-content {
            background: white;
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.08);
        }

        .cart-item {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 20px 0;
            border-bottom: 1px solid #e2e8f0;
        }

        .product-info {
            display: flex;
            align-items: center;
            gap: 20px;
        }

        .product-icon {
            width: 80px;
            height: 80px;
            background: #edf4ff;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 40px;
        }

        .product-info h3 {
            margin-bottom: 7px;
        }

        .product-info p {
            color: #64748b;
        }

        .price {
            font-size: 18px;
            font-weight: bold;
        }

        .empty-cart {
            text-align: center;
            padding: 50px;
            color: #64748b;
            font-size: 18px;
        }
    </style>
</head>

<body>

<nav class="navbar">

    <div class="logo">
        🎓 Campus<span>Mart</span>
    </div>

    <div class="nav-links">
        <a href="index.jsp">Home</a>
        <a href="products.jsp">Products</a>
        <a href="products.jsp">Categories</a>
        <a href="cart">Cart 🛒</a>
        <a href="login.jsp" class="login-btn">Login</a>
    </div>

</nav>


<div class="cart-container">

    <div class="cart-title">
        <h1>🛒 Your Cart</h1>
        <p>Review your selected campus essentials</p>
    </div>


    <div class="cart-content">

        <%
            List<String> cart =
                    (List<String>) session.getAttribute("cart");

            if (cart == null || cart.isEmpty()) {
        %>

            <div class="empty-cart">
                Your cart is empty 🛒
            </div>

        <%
            } else {

                for (String product : cart) {

                    String[] details = product.split("\\|");

                    String name = details[0];
                    String category = details[1];
                    String price = details[2];
                    String icon = details.length > 3 ? details[3] : "🛒";
        %>

            <div class="cart-item">

                <div class="product-info">

                    <div class="product-icon">
                        <%= icon %>
                    </div>

                    <div>
                        <h3>
                            <%= name %>
                        </h3>

                        <p>
                            <%= category %>
                        </p>
                    </div>

                </div>

                <div class="price">
                    ₹<%= price %>
                </div>

            </div>

        <%
                }
            }
        %>

    </div>

</div>

</body>
</html>