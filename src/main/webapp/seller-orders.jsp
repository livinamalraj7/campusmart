<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="java.util.List" %>
<%@ page import="com.campusmart.servlet.SellerOrdersServlet.SellerOrder" %>

<%
    String userRole =
            (String) session.getAttribute("userRole");

    String userName =
            (String) session.getAttribute("userName");

    if (userRole == null ||
        !"seller".equalsIgnoreCase(userRole)) {

        response.sendRedirect("login.jsp");
        return;
    }

    List<SellerOrder> orders =
            (List<SellerOrder>)
            request.getAttribute("sellerOrders");

    String error =
            request.getParameter("error");
%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<title>Seller Orders - CampusMart</title>

<style>

* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
}

body {
    background: #f5f7fb;
    min-height: 100vh;
    color: #111827;
}


/* ================= NAVBAR ================= */

.navbar {
    background: #111827;
    color: white;

    padding: 16px 40px;

    display: flex;
    justify-content: space-between;
    align-items: center;
}

.logo {
    font-size: 24px;
    font-weight: bold;
}

.nav-right {
    display: flex;
    align-items: center;
    gap: 20px;
}

.welcome {
    font-size: 14px;
}

.logout {
    color: white;
    text-decoration: none;
    font-size: 14px;
}

.logout:hover {
    text-decoration: underline;
}


/* ================= CONTAINER ================= */

.container {
    width: 92%;
    max-width: 1200px;

    margin: 40px auto;
}


/* ================= HEADING ================= */

.heading {
    margin-bottom: 30px;
}

.heading h1 {
    font-size: 30px;
    margin-bottom: 8px;
}

.heading p {
    color: #6b7280;
    font-size: 15px;
}


/* ================= ERROR ================= */

.error-message {
    background: #fee2e2;
    color: #991b1b;

    border: 1px solid #fecaca;

    padding: 12px 15px;

    border-radius: 7px;

    margin-bottom: 20px;

    font-size: 14px;
}


/* ================= ORDER LIST ================= */

.order-list {
    display: flex;
    flex-direction: column;
    gap: 20px;
}


/* ================= ORDER CARD ================= */

.order-card {
    background: white;

    border-radius: 12px;

    padding: 25px;

    box-shadow:
        0 4px 15px rgba(0, 0, 0, 0.08);
}


/* ================= ORDER HEADER ================= */

.order-header {
    display: flex;

    justify-content: space-between;

    align-items: center;

    margin-bottom: 20px;

    padding-bottom: 15px;

    border-bottom: 1px solid #e5e7eb;
}

.order-number {
    font-size: 17px;

    font-weight: bold;
}

.order-date {
    color: #6b7280;

    font-size: 13px;
}


/* ================= ORDER DETAILS ================= */

.order-details {
    display: grid;

    grid-template-columns:
        repeat(auto-fit, minmax(220px, 1fr));

    gap: 18px;
}

.detail-box {
    background: #f9fafb;

    padding: 15px;

    border-radius: 8px;
}

.detail-label {
    color: #6b7280;

    font-size: 12px;

    margin-bottom: 6px;

    text-transform: uppercase;

    letter-spacing: 0.5px;
}

.detail-value {
    color: #111827;

    font-size: 14px;

    font-weight: 600;

    line-height: 1.5;
}


/* ================= PRICE ================= */

.price {
    font-size: 18px;

    font-weight: bold;

    color: #111827;
}


/* ================= QUANTITY ================= */

.quantity {
    font-size: 15px;

    font-weight: bold;
}


/* ================= ADDRESS ================= */

.address-box {
    margin-top: 18px;

    background: #eff6ff;

    border: 1px solid #dbeafe;

    padding: 15px;

    border-radius: 8px;
}

.address-label {
    color: #1e40af;

    font-size: 12px;

    font-weight: bold;

    margin-bottom: 6px;

    text-transform: uppercase;
}

.address-value {
    color: #1e3a8a;

    font-size: 14px;

    line-height: 1.5;
}


/* ================= EMPTY STATE ================= */

.empty-box {
    background: white;

    padding: 60px 20px;

    border-radius: 12px;

    text-align: center;

    box-shadow:
        0 4px 15px rgba(0, 0, 0, 0.08);
}

.empty-icon {
    font-size: 60px;

    margin-bottom: 15px;
}

.empty-box h2 {
    margin-bottom: 8px;
}

.empty-box p {
    color: #6b7280;

    font-size: 14px;
}


/* ================= BACK BUTTON ================= */

.back-dashboard {
    display: inline-block;

    margin-top: 30px;

    padding: 11px 18px;

    background: #111827;

    color: white;

    text-decoration: none;

    border-radius: 7px;

    font-size: 14px;

    font-weight: bold;
}

.back-dashboard:hover {
    background: #1f2937;
}


/* ================= MOBILE ================= */

@media (max-width: 600px) {

    .navbar {
        padding: 15px 20px;
    }

    .logo {
        font-size: 20px;
    }

    .welcome {
        display: none;
    }

    .container {
        width: 94%;
    }

    .order-header {
        flex-direction: column;

        align-items: flex-start;

        gap: 6px;
    }

}

</style>

</head>


<body>


<!-- ================= NAVBAR ================= -->

<div class="navbar">

    <div class="logo">
        CampusMart Seller
    </div>

    <div class="nav-right">

        <div class="welcome">
            Welcome, <%= userName %>
        </div>

        <a href="logout" class="logout">
            Logout
        </a>

    </div>

</div>


<!-- ================= MAIN ================= -->

<div class="container">


    <div class="heading">

        <h1>
            📋 Seller Orders
        </h1>

        <p>
            View orders placed for your products.
        </p>

    </div>


    <!-- ================= ERROR ================= -->

    <%
        if ("server".equals(error)) {
    %>

        <div class="error-message">
            ❌ Something went wrong while loading orders.
        </div>

    <%
        }
    %>


    <!-- ================= ORDERS ================= -->

    <%
        if (orders == null ||
            orders.isEmpty()) {
    %>


        <div class="empty-box">

            <div class="empty-icon">
                📋
            </div>

            <h2>
                No Orders Yet
            </h2>

            <p>
                There are no orders for your products yet.
            </p>

        </div>


    <%
        } else {
    %>


        <div class="order-list">


        <%
            for (SellerOrder order : orders) {

                double total =
                        order.getPrice()
                        * order.getQuantity();
        %>


            <!-- ================= ORDER CARD ================= -->

            <div class="order-card">


                <div class="order-header">

                    <div class="order-number">
                        Order #<%= order.getId() %>
                    </div>

                    <div class="order-date">

                        <%
                            if (order.getOrderDate() != null) {
                        %>

                            <%= order.getOrderDate() %>

                        <%
                            } else {
                        %>

                            Date unavailable

                        <%
                            }
                        %>

                    </div>

                </div>


                <div class="order-details">


                    <!-- CUSTOMER -->

                    <div class="detail-box">

                        <div class="detail-label">
                            Customer
                        </div>

                        <div class="detail-value">
                            <%= order.getUserEmail() %>
                        </div>

                    </div>


                    <!-- PRODUCT -->

                    <div class="detail-box">

                        <div class="detail-label">
                            Product
                        </div>

                        <div class="detail-value">
                            <%= order.getProductName() %>
                        </div>

                    </div>


                    <!-- CATEGORY -->

                    <div class="detail-box">

                        <div class="detail-label">
                            Category
                        </div>

                        <div class="detail-value">
                            <%= order.getCategory() %>
                        </div>

                    </div>


                    <!-- PRICE -->

                    <div class="detail-box">

                        <div class="detail-label">
                            Price
                        </div>

                        <div class="price">
                            ₹<%= String.format(
                                "%.2f",
                                order.getPrice()
                            ) %>
                        </div>

                    </div>


                    <!-- QUANTITY -->

                    <div class="detail-box">

                        <div class="detail-label">
                            Quantity
                        </div>

                        <div class="quantity">
                            <%= order.getQuantity() %>
                        </div>

                    </div>


                    <!-- TOTAL -->

                    <div class="detail-box">

                        <div class="detail-label">
                            Order Total
                        </div>

                        <div class="price">
                            ₹<%= String.format(
                                "%.2f",
                                total
                            ) %>
                        </div>

                    </div>


                </div>


                <!-- ================= ADDRESS ================= -->

                <div class="address-box">

                    <div class="address-label">
                        📍 Delivery Address
                    </div>

                    <div class="address-value">

                        <%
                            String address =
                                    order.getDeliveryAddress();

                            if (address == null ||
                                address.trim().isEmpty()) {
                        %>

                            Address not available

                        <%
                            } else {
                        %>

                            <%= address %>

                        <%
                            }
                        %>

                    </div>

                </div>


            </div>


        <%
            }
        %>


        </div>


    <%
        }
    %>


    <!-- ================= BACK ================= -->

    <a
        href="seller-dashboard.jsp"
        class="back-dashboard"
    >
        ← Back to Dashboard
    </a>


</div>


</body>

</html>