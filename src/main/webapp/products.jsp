<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="com.campusmart.model.Product" %>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>Products | CampusMart</title>

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

/* NAVBAR */

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

/* PAGE HEADER */

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

/* PRODUCTS */

.products-container {
    width: 86%;
    margin: auto;

    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));

    gap: 25px;
    padding-bottom: 50px;
}

.product-card {
    background: white;

    border-radius: 12px;
    padding: 20px;

    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);

    transition: transform 0.2s;
}

.product-card:hover {
    transform: translateY(-5px);
}

.product-image {
    height: 150px;

    display: flex;
    align-items: center;
    justify-content: center;

    font-size: 70px;

    background: #eff6ff;
    border-radius: 10px;

    margin-bottom: 18px;
}

.category {
    color: #2563eb;

    font-size: 13px;
    font-weight: bold;

    margin-bottom: 7px;

    text-transform: uppercase;
}

.product-card h2 {
    font-size: 20px;
    margin-bottom: 8px;
}

.description {
    color: #64748b;

    font-size: 14px;
    line-height: 1.5;

    min-height: 42px;
}

.product-bottom {
    display: flex;

    align-items: center;
    justify-content: space-between;

    margin-top: 18px;
}

.price {
    font-size: 20px;

    font-weight: bold;

    color: #172554;
}

.add-btn {
    background: #2563eb;

    color: white;

    border: none;

    padding: 9px 14px;

    border-radius: 6px;

    cursor: pointer;

    font-weight: bold;

    text-decoration: none;

    display: inline-block;
}

.add-btn:hover {
    background: #1d4ed8;
}

.empty-message {
    text-align: center;

    grid-column: 1 / -1;

    padding: 50px;

    color: #64748b;
}

</style>

</head>

<body>

<!-- NAVBAR -->

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
        📦 My Orders
    </a>

    <a href="login.jsp">
        Login
    </a>

</div>

</nav>


<!-- PAGE HEADER -->

<section class="page-header">

    <h1>CampusMart Products</h1>

    <p>
        Find everything you need for your college life.
    </p>

</section>


<!-- PRODUCTS -->

<div class="products-container">

<%
    List<Product> products =
        (List<Product>) request.getAttribute("products");

    if (products != null && !products.isEmpty()) {

        for (Product product : products) {

            String name = URLEncoder.encode(
                product.getName(), "UTF-8"
            );

            String category = URLEncoder.encode(
                product.getCategory(), "UTF-8"
            );

            String image = URLEncoder.encode(
                product.getImage(), "UTF-8"
            );

            String price = String.valueOf(
                product.getPrice()
            );
%>

    <!-- PRODUCT CARD -->

    <div class="product-card">

        <div class="product-image">
            <%= product.getImage() %>
        </div>

        <div class="category">
            <%= product.getCategory() %>
        </div>

        <h2>
            <%= product.getName() %>
        </h2>

        <p class="description">
            <%= product.getDescription() %>
        </p>

        <div class="product-bottom">

            <span class="price">
                ₹<%= String.format("%.0f", product.getPrice()) %>
            </span>

            <!-- ADD TO CART -->

            <a
                href="cart?name=<%= name %>&category=<%= category %>&price=<%= price %>&icon=<%= image %>"
                class="add-btn">

                Add to Cart

            </a>

        </div>

    </div>

<%
        }

    } else {
%>

    <div class="empty-message">

        <h2>No products available</h2>

        <p>
            Please check back later.
        </p>

    </div>

<%
    }
%>

</div>

</body>

</html>