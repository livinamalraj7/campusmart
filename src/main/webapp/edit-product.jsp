<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="com.campusmart.model.Product" %>

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

    Product product =
            (Product) request.getAttribute("product");

    if (product == null) {

        response.sendRedirect("my-products?error=notfound");
        return;
    }

    String error =
            request.getParameter("error");
%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<title>Edit Product - CampusMart</title>

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

.container {
    width: 90%;
    max-width: 700px;

    margin: 40px auto;
}

.heading {
    margin-bottom: 25px;
}

.heading h1 {
    font-size: 30px;
    margin-bottom: 8px;
}

.heading p {
    color: #6b7280;
    font-size: 15px;
}

.error-message {
    background: #fee2e2;
    color: #991b1b;

    border: 1px solid #fecaca;

    padding: 12px 15px;

    border-radius: 7px;

    margin-bottom: 20px;

    font-size: 14px;
}

.form-card {
    background: white;

    padding: 30px;

    border-radius: 12px;

    box-shadow:
        0 4px 15px rgba(0, 0, 0, 0.08);
}

.form-group {
    margin-bottom: 20px;
}

label {
    display: block;

    font-size: 14px;

    font-weight: bold;

    margin-bottom: 7px;
}

input,
select,
textarea {
    width: 100%;

    padding: 11px 12px;

    border: 1px solid #d1d5db;

    border-radius: 7px;

    font-size: 14px;

    outline: none;
}

input:focus,
select:focus,
textarea:focus {
    border-color: #2563eb;
}

textarea {
    min-height: 120px;

    resize: vertical;
}

.form-actions {
    display: flex;

    gap: 12px;

    margin-top: 25px;
}

.update-btn,
.cancel-btn {
    flex: 1;

    padding: 12px;

    border-radius: 7px;

    text-align: center;

    text-decoration: none;

    font-size: 14px;

    font-weight: bold;

    border: none;

    cursor: pointer;
}

.update-btn {
    background: #2563eb;
    color: white;
}

.update-btn:hover {
    background: #1d4ed8;
}

.cancel-btn {
    background: #e5e7eb;
    color: #111827;
}

.cancel-btn:hover {
    background: #d1d5db;
}

</style>

</head>

<body>


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


<div class="container">

    <div class="heading">

        <h1>
            ✏️ Edit Product
        </h1>

        <p>
            Update the details of your product.
        </p>

    </div>


    <%
        if ("empty".equals(error)) {
    %>

        <div class="error-message">
            ❌ Please fill in all required fields.
        </div>

    <%
        } else if ("price".equals(error)) {
    %>

        <div class="error-message">
            ❌ Please enter a valid price greater than 0.
        </div>

    <%
        } else if ("server".equals(error)) {
    %>

        <div class="error-message">
            ❌ Something went wrong. Please try again.
        </div>

    <%
        }
    %>


    <div class="form-card">

        <form action="update-product" method="post">

            <input
                type="hidden"
                name="id"
                value="<%= product.getId() %>"
            >


            <div class="form-group">

                <label for="name">
                    Product Name
                </label>

                <input
                    type="text"
                    id="name"
                    name="name"
                    maxlength="150"
                    value="<%= product.getName() %>"
                    required
                >

            </div>


            <div class="form-group">

                <label for="category">
                    Category
                </label>

                <select
                    id="category"
                    name="category"
                    required
                >

                    <option value="">
                        Select Category
                    </option>

                    <option value="Books"
                        <%= "Books".equals(product.getCategory()) ? "selected" : "" %>>
                        Books
                    </option>

                    <option value="Study Materials"
                        <%= "Study Materials".equals(product.getCategory()) ? "selected" : "" %>>
                        Study Materials
                    </option>

                    <option value="Stationery"
                        <%= "Stationery".equals(product.getCategory()) ? "selected" : "" %>>
                        Stationery
                    </option>

                    <option value="Electronics"
                        <%= "Electronics".equals(product.getCategory()) ? "selected" : "" %>>
                        Electronics
                    </option>

                    <option value="Accessories"
                        <%= "Accessories".equals(product.getCategory()) ? "selected" : "" %>>
                        Accessories
                    </option>

                    <option value="Project Materials"
                        <%= "Project Materials".equals(product.getCategory()) ? "selected" : "" %>>
                        Project Materials
                    </option>

                    <option value="Merchandise"
                        <%= "Merchandise".equals(product.getCategory()) ? "selected" : "" %>>
                        Merchandise
                    </option>

                    <option value="Lab Essentials"
                        <%= "Lab Essentials".equals(product.getCategory()) ? "selected" : "" %>>
                        Lab Essentials
                    </option>

                </select>

            </div>


            <div class="form-group">

                <label for="price">
                    Price (₹)
                </label>

                <input
                    type="number"
                    id="price"
                    name="price"
                    min="0.01"
                    step="0.01"
                    value="<%= product.getPrice() %>"
                    required
                >

            </div>


            <div class="form-group">

                <label for="description">
                    Description
                </label>

                <textarea
                    id="description"
                    name="description"
                    maxlength="500"
                    required
                ><%= product.getDescription() %></textarea>

            </div>


            <div class="form-group">

                <label for="image">
                    Product Emoji
                </label>

                <input
                    type="text"
                    id="image"
                    name="image"
                    maxlength="255"
                    value="<%= product.getImage() == null ? "" : product.getImage() %>"
                    placeholder="Example: 📘"
                >

            </div>


            <div class="form-actions">

                <a
                    href="my-products"
                    class="cancel-btn"
                >
                    Cancel
                </a>

                <button
                    type="submit"
                    class="update-btn"
                >
                    💾 Update Product
                </button>

            </div>

        </form>

    </div>

</div>

</body>

</html>