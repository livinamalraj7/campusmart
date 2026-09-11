<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>Cart - CampusMart</title>

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f5f7fb;
            color: #222;
        }

        /* NAVBAR */

        .navbar {
            background: #111827;
            color: white;
            padding: 15px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
        }

        .logo {
            font-size: 24px;
            font-weight: bold;
        }

        .nav-links {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
        }

        .nav-links a {
            color: white;
            text-decoration: none;
            font-size: 15px;
        }

        .nav-links a:hover {
            text-decoration: underline;
        }

        /* MAIN */

        .container {
            width: 90%;
            max-width: 1100px;
            margin: 40px auto;
        }

        h1 {
            margin-bottom: 25px;
        }

        /* ERROR MESSAGE */

        .error-message {
            background: #fff3cd;
            color: #856404;
            border: 1px solid #ffe69c;
            padding: 12px 16px;
            border-radius: 8px;
            margin-bottom: 20px;
        }

        /* EMPTY CART */

        .empty-cart {
            background: white;
            padding: 50px 20px;
            text-align: center;
            border-radius: 12px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.08);
        }

        .empty-cart p {
            font-size: 18px;
            margin-bottom: 20px;
        }

        .shop-btn {
            display: inline-block;
            background: #2563eb;
            color: white;
            text-decoration: none;
            padding: 11px 20px;
            border-radius: 7px;
        }

        .shop-btn:hover {
            background: #1d4ed8;
        }

        /* CART ITEM */

        .cart-item {
            background: white;
            padding: 20px;
            margin-bottom: 15px;
            border-radius: 12px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 20px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.07);
        }

        .product-info {
            display: flex;
            align-items: center;
            gap: 15px;
            flex: 1;
        }

        .product-icon {
            font-size: 42px;
            width: 65px;
            text-align: center;
        }

        .product-name {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 6px;
        }

        .product-category {
            color: #666;
            font-size: 14px;
            margin-bottom: 5px;
        }

        .product-price {
            color: #2563eb;
            font-weight: bold;
        }

        /* QUANTITY */

        .quantity-section {
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .quantity-btn {
            width: 32px;
            height: 32px;
            border: none;
            background: #e5e7eb;
            border-radius: 6px;
            font-size: 18px;
            cursor: pointer;
        }

        .quantity-btn:hover {
            background: #d1d5db;
        }

        .quantity {
            min-width: 25px;
            text-align: center;
            font-weight: bold;
        }

        /* ITEM TOTAL */

        .item-total {
            min-width: 100px;
            text-align: right;
            font-weight: bold;
        }

        /* REMOVE */

        .remove-btn {
            background: #dc2626;
            color: white;
            border: none;
            padding: 8px 12px;
            border-radius: 6px;
            cursor: pointer;
        }

        .remove-btn:hover {
            background: #b91c1c;
        }

        /* SUMMARY */

        .summary {
            background: white;
            margin-top: 25px;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.07);
            max-width: 450px;
            margin-left: auto;
        }

        .summary-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 12px;
            font-size: 16px;
        }

        .total-row {
            border-top: 1px solid #ddd;
            padding-top: 15px;
            margin-top: 15px;
            font-size: 20px;
            font-weight: bold;
        }

        .checkout-btn {
            width: 100%;
            background: #16a34a;
            color: white;
            border: none;
            padding: 13px;
            border-radius: 7px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 15px;
        }

        .checkout-btn:hover {
            background: #15803d;
        }

        /* RESPONSIVE */

        @media (max-width: 700px) {

            .navbar {
                padding: 15px 20px;
            }

            .container {
                width: 94%;
            }

            .cart-item {
                flex-direction: column;
                align-items: flex-start;
            }

            .item-total {
                text-align: left;
            }

            .summary {
                max-width: 100%;
            }
        }

    </style>

</head>

<body>

<!-- NAVBAR -->

<div class="navbar">

    <div class="logo">
        CampusMart
    </div>

    <div class="nav-links">

        <a href="index.jsp">Home</a>

        <a href="products">Products</a>

        <a href="products">Categories</a>

        <a href="cart.jsp">Cart</a>

        <a href="my-orders.jsp">My Orders</a>

        <a href="logout">Logout</a>

    </div>

</div>


<!-- MAIN CONTENT -->

<div class="container">

    <h1>🛒 Your Cart</h1>

    <%

        List<String> cart =
                (List<String>) session.getAttribute("cart");

        boolean hasCartError = false;

        Map<String, Integer> quantityMap =
                new HashMap<>();

        Map<String, String[]> productMap =
                new HashMap<>();

        double subtotal = 0.0;

        int totalItems = 0;


        /*
         * PROCESS CART
         */

        if (cart != null && !cart.isEmpty()) {

            for (String item : cart) {

                try {

                    if (item == null || item.trim().isEmpty()) {

                        hasCartError = true;
                        continue;
                    }

                    String[] details =
                            item.split("\\|", -1);

                    /*
                     * A valid cart item needs:
                     * name | category | price | icon
                     */

                    if (details.length < 3 ||
                        details[0] == null ||
                        details[0].trim().isEmpty()) {

                        hasCartError = true;
                        continue;
                    }

                    String productName =
                            details[0];

                    double price =
                            Double.parseDouble(details[2]);

                    /*
                     * Invalid price
                     */

                    if (price < 0) {

                        hasCartError = true;
                        continue;
                    }

                    /*
                     * Store product information
                     */

                    productMap.put(
                            productName,
                            details
                    );

                    /*
                     * Increase quantity
                     */

                    int quantity =
                            quantityMap.getOrDefault(
                                    productName,
                                    0
                            );

                    quantityMap.put(
                            productName,
                            quantity + 1
                    );

                    /*
                     * Calculate totals
                     */

                    subtotal += price;

                    totalItems++;

                } catch (Exception e) {

                    /*
                     * Ignore malformed cart item
                     * instead of crashing the page.
                     */

                    hasCartError = true;
                }
            }
        }

    %>


    <!-- CART WARNING -->

    <% if (hasCartError) { %>

        <div class="error-message">

            Some items in your cart could not be displayed.
            Please remove them and add the products again.

        </div>

    <% } %>


    <%

        if (quantityMap.isEmpty()) {

    %>

        <!-- EMPTY CART -->

        <div class="empty-cart">

            <p>
                Your cart is empty 🛒
            </p>

            <a href="products" class="shop-btn">
                Continue Shopping
            </a>

        </div>


    <%

        } else {

            /*
             * DISPLAY PRODUCTS
             */

            for (String productName :
                    quantityMap.keySet()) {

                String[] details =
                        productMap.get(productName);

                int quantity =
                        quantityMap.get(productName);

                String category =
                        details.length > 1
                        ? details[1]
                        : "";

                double price = 0.0;

                try {

                    price =
                            Double.parseDouble(details[2]);

                } catch (Exception e) {

                    continue;
                }

                String icon =
                        details.length > 3
                        ? details[3]
                        : "🛍️";

                double itemTotal =
                        price * quantity;

    %>


        <!-- CART ITEM -->

        <div class="cart-item">


            <!-- PRODUCT INFO -->

            <div class="product-info">

                <div class="product-icon">

                    <%= icon %>

                </div>


                <div>

                    <div class="product-name">

                        <%= productName %>

                    </div>


                    <div class="product-category">

                        <%= category %>

                    </div>


                    <div class="product-price">

                        ₹<%= String.format("%.2f", price) %>

                    </div>

                </div>

            </div>


            <!-- QUANTITY -->

            <div class="quantity-section">


                <!-- DECREASE -->

                <form action="cart"
                      method="get"
                      style="display:inline;">

                    <input type="hidden"
                           name="action"
                           value="change">

                    <input type="hidden"
                           name="productName"
                           value="<%= productName %>">

                    <input type="hidden"
                           name="change"
                           value="-1">

                    <button type="submit"
                            class="quantity-btn">

                        −

                    </button>

                </form>


                <span class="quantity">

                    <%= quantity %>

                </span>


                <!-- INCREASE -->

                <form action="cart"
                      method="get"
                      style="display:inline;">

                    <input type="hidden"
                           name="action"
                           value="change">

                    <input type="hidden"
                           name="productName"
                           value="<%= productName %>">

                    <input type="hidden"
                           name="change"
                           value="1">

                    <button type="submit"
                            class="quantity-btn">

                        +

                    </button>

                </form>

            </div>


            <!-- ITEM TOTAL -->

            <div class="item-total">

                ₹<%= String.format("%.2f", itemTotal) %>

            </div>


            <!-- REMOVE -->

            <button type="button"
                    class="remove-btn"
                    onclick="removeItem('<%= productName %>')">

                Remove

            </button>

        </div>


    <%

            }

    %>


        <!-- SUMMARY -->

        <div class="summary">


            <div class="summary-row">

                <span>
                    Items
                </span>

                <span>
                    <%= totalItems %>
                </span>

            </div>


            <div class="summary-row">

                <span>
                    Subtotal
                </span>

                <span>
                    ₹<%= String.format("%.2f", subtotal) %>
                </span>

            </div>


            <div class="summary-row">

                <span>
                    Delivery
                </span>

                <span>
                    Free
                </span>

            </div>


            <div class="summary-row total-row">

                <span>
                    Total
                </span>

                <span>
                    ₹<%= String.format("%.2f", subtotal) %>
                </span>

            </div>


            <!-- CHECKOUT -->

            <form action="order"
                  method="post">

                <button type="submit"
                        class="checkout-btn">

                    Proceed to Checkout

                </button>

            </form>

        </div>


    <%

        }

    %>

</div>


<!-- JAVASCRIPT -->

<script>

    function removeItem(productName) {

        if (confirm("Remove this item from your cart?")) {

            window.location.href =
                "remove-cart?name=" +
                encodeURIComponent(productName);

        }

    }

</script>


</body>
</html>