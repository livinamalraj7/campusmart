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
            gap: 20px;
            padding: 20px 0;
            border-bottom: 1px solid #e2e8f0;
        }

        .product-info {
            display: flex;
            align-items: center;
            gap: 20px;
            flex: 1;
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

        .quantity {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .quantity button {
            width: 32px;
            height: 32px;
            border: 1px solid #cbd5e1;
            background: white;
            border-radius: 5px;
            cursor: pointer;
            font-size: 18px;
        }

        .quantity button:hover {
            background: #eff6ff;
        }

        .quantity span {
            min-width: 25px;
            text-align: center;
            font-weight: bold;
        }

        .price {
            min-width: 90px;
            text-align: right;
            font-size: 18px;
            font-weight: bold;
        }

        .remove-btn {
            border: none;
            background: #fee2e2;
            color: #dc2626;
            padding: 8px 12px;
            border-radius: 5px;
            cursor: pointer;
        }

        .remove-btn:hover {
            background: #fecaca;
        }

        .cart-summary {
            margin-top: 30px;
            display: flex;
            justify-content: flex-end;
        }

        .summary-box {
            width: 320px;
        }

        .summary-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 15px;
            font-size: 17px;
        }

        .total {
            font-size: 22px;
            font-weight: bold;
            border-top: 1px solid #ddd;
            padding-top: 15px;
        }

        .checkout-btn {
            width: 100%;
            border: none;
            background: #2563eb;
            color: white;
            padding: 14px;
            margin-top: 20px;
            border-radius: 7px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
        }

        .checkout-btn:hover {
            background: #1d4ed8;
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
                    double price = Double.parseDouble(details[2]);
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


                <div class="quantity">

                    <button type="button"
                            onclick="changeQuantity(this, -1)">
                        −
                    </button>

                    <span class="quantity-value">
                        1
                    </span>

                    <button type="button"
                            onclick="changeQuantity(this, 1)">
                        +
                    </button>

                </div>


                <div class="price"
                     data-price="<%= price %>">

                    ₹<span class="item-total">
                        <%= String.format("%.0f", price) %>
                    </span>

                </div>


                <button type="button"
                        class="remove-btn"
                        onclick="removeItem(this, '<%= name %>')"></button>
                    Remove
                </button>

            </div>

        <%
                }
        %>


            <div class="cart-summary">

                <div class="summary-box">

                    <div class="summary-row">
                        <span>Subtotal</span>
                        <strong id="subtotal">₹0</strong>
                    </div>

                    <div class="summary-row">
                        <span>Delivery</span>
                        <strong>₹0</strong>
                    </div>

                    <div class="summary-row total">
                        <span>Total</span>
                        <strong id="grand-total">₹0</strong>
                    </div>

                    <button class="checkout-btn">
                        Proceed to Checkout
                    </button>

                </div>

            </div>

        <%
            }
        %>

    </div>

</div>


<script>

    function changeQuantity(button, change) {

        const quantityContainer = button.parentElement;

        const quantityElement =
            quantityContainer.querySelector(".quantity-value");

        let quantity =
            parseInt(quantityElement.textContent);

        quantity += change;

        if (quantity < 1) {
            quantity = 1;
        }

        quantityElement.textContent = quantity;

        const cartItem =
            button.closest(".cart-item");

        const priceElement =
            cartItem.querySelector(".price");

        const unitPrice =
            parseFloat(priceElement.dataset.price);

        const itemTotal =
            cartItem.querySelector(".item-total");

        itemTotal.textContent =
            Math.round(unitPrice * quantity);

        calculateTotal();
    }


    function removeItem(button, productName) {

    window.location.href =
        "remove-cart?name=" +
        encodeURIComponent(productName);
}


    function calculateTotal() {

        const cartItems =
            document.querySelectorAll(".cart-item");

        let subtotal = 0;

        cartItems.forEach(function(item) {

            const priceElement =
                item.querySelector(".price");

            const unitPrice =
                parseFloat(priceElement.dataset.price);

            const quantityElement =
                item.querySelector(".quantity-value");

            const quantity =
                parseInt(quantityElement.textContent);

            subtotal += unitPrice * quantity;

        });

        document.getElementById("subtotal").textContent =
            "₹" + Math.round(subtotal);

        document.getElementById("grand-total").textContent =
            "₹" + Math.round(subtotal);
    }


    calculateTotal();

</script>

</body>

</html>