<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.campusmart.model.Order" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>My Orders | CampusMart</title>

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            background: #f1f5f9;
            color: #172554;
        }

        .navbar {
            background: #172554;
            color: white;
            padding: 18px 7%;

            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .logo {
            font-size: 26px;
            font-weight: bold;
        }

        .logo span {
            color: #60a5fa;
        }

        .nav-links {
            display: flex;
            align-items: center;
            gap: 28px;
        }

        .nav-links a {
            color: white;
            text-decoration: none;
            font-size: 15px;
        }

        .nav-links a:hover {
            color: #93c5fd;
        }

        .page-header {
            text-align: center;
            padding: 50px 20px 30px;
        }

        .page-header h1 {
            font-size: 38px;
            margin-bottom: 10px;
        }

        .page-header p {
            color: #64748b;
            font-size: 17px;
        }

        .orders-container {
            width: 86%;
            max-width: 1100px;
            margin: auto;
            padding-bottom: 50px;
        }

        .orders-box {
            background: white;
            border-radius: 12px;
            padding: 25px;

            box-shadow:
                0 4px 15px rgba(0, 0, 0, 0.08);
        }

        .order-card {
            border: 1px solid #e2e8f0;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 18px;

            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 20px;
        }

        .order-info h2 {
            font-size: 20px;
            margin-bottom: 8px;
        }

        .category {
            color: #2563eb;
            font-size: 13px;
            font-weight: bold;
            margin-bottom: 8px;
            text-transform: uppercase;
        }

        .order-date {
            color: #64748b;
            font-size: 14px;
        }

        .order-right {
            text-align: right;
            min-width: 130px;
        }

        .price {
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 6px;
        }

        .quantity {
            color: #64748b;
            font-size: 14px;
        }

        .empty-orders {
            text-align: center;
            padding: 60px 20px;
            color: #64748b;
        }

        .empty-orders h2 {
            color: #172554;
            margin-bottom: 10px;
        }

        .shop-btn {
            display: inline-block;
            margin-top: 20px;

            background: #2563eb;
            color: white;

            text-decoration: none;

            padding: 11px 18px;
            border-radius: 6px;

            font-weight: bold;
        }

        .shop-btn:hover {
            background: #1d4ed8;
        }

        .error-message {
            text-align: center;
            padding: 40px;
            color: #dc2626;
        }

        @media (max-width: 700px) {

            .navbar {
                flex-direction: column;
                gap: 15px;
            }

            .nav-links {
                gap: 15px;
                flex-wrap: wrap;
                justify-content: center;
            }

            .order-card {
                flex-direction: column;
                align-items: flex-start;
            }

            .order-right {
                text-align: left;
            }
        }

    </style>

</head>

<body>

<nav class="navbar">

    <div class="logo">
        🎓 Campus<span>Mart</span>
    </div>

    <div class="nav-links">

        <a href="index.jsp">
            Home
        </a>

        <a href="products">
            Products
        </a>

        <a href="cart">
            🛒 Cart
        </a>

        <a href="my-orders">
            My Orders
        </a>

        <a href="login.jsp">
            Login
        </a>

    </div>

</nav>


<section class="page-header">

    <h1>📦 My Orders</h1>

    <p>
        View your previous CampusMart orders.
    </p>

</section>


<div class="orders-container">

    <div class="orders-box">

        <%
            String error =
                    (String) request.getAttribute("error");

            if (error != null) {
        %>

            <div class="error-message">

                <h2>
                    Something went wrong
                </h2>

                <p>
                    <%= error %>
                </p>

            </div>

        <%
            } else {

                List<Order> orders =
                        (List<Order>) request.getAttribute("orders");

                if (orders == null || orders.isEmpty()) {
        %>

                    <div class="empty-orders">

                        <h2>
                            No Orders Yet
                        </h2>

                        <p>
                            You haven't placed any orders yet.
                        </p>

                        <a href="products"
                           class="shop-btn">

                            Start Shopping

                        </a>

                    </div>

        <%
                } else {

                    for (Order order : orders) {
        %>

                        <div class="order-card">

                            <div class="order-info">

                                <div class="category">
                                    <%= order.getCategory() %>
                                </div>

                                <h2>
                                    <%= order.getProductName() %>
                                </h2>

                                <div class="order-date">

                                    Order #<%= order.getId() %>
                                    &nbsp; | &nbsp;

                                    <%= order.getOrderDate() %>

                                </div>

                            </div>


                            <div class="order-right">

                                <div class="price">

                                    ₹<%= String.format(
                                            "%.0f",
                                            order.getPrice()
                                    ) %>

                                </div>

                                <div class="quantity">

                                    Quantity:
                                    <%= order.getQuantity() %>

                                </div>

                            </div>

                        </div>

        <%
                    }
                }
            }
        %>

    </div>

</div>

</body>

</html>