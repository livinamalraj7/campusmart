<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="java.util.List" %>
<%@ page import="com.campusmart.model.Product" %>

<%
    String userRole =
            (String) session.getAttribute("userRole");

    String userName =
            (String) session.getAttribute("userName");

    // Seller-only access
    if (userRole == null ||
        !"seller".equalsIgnoreCase(userRole)) {

        response.sendRedirect("login.jsp");
        return;
    }

    List<Product> products =
            (List<Product>) request.getAttribute("products");

    String success =
            request.getParameter("success");

    String error =
            request.getParameter("error");
%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<title>My Products - CampusMart</title>

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

/* Navbar */

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


/* Main Container */

.container {
    width: 90%;
    max-width: 1100px;
    margin: 40px auto;
}


/* Heading */

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


/* Messages */

.success-message {
    background: #dcfce7;
    color: #166534;

    border: 1px solid #bbf7d0;

    padding: 12px 15px;

    border-radius: 7px;

    margin-bottom: 20px;

    font-size: 14px;
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


/* Product Grid */

.product-grid {
    display: grid;

    grid-template-columns:
        repeat(auto-fit, minmax(240px, 1fr));

    gap: 20px;
}


/* Product Card */

.product-card {
    background: white;

    border-radius: 12px;

    padding: 20px;

    box-shadow:
        0 4px 15px rgba(0, 0, 0, 0.08);
}


/* Product Image / Emoji */

.product-icon {
    width: 100%;
    height: 150px;

    display: flex;
    align-items: center;
    justify-content: center;

    background: #f3f4f6;

    border-radius: 10px;

    font-size: 65px;

    margin-bottom: 18px;
}


/* Product Information */

.product-card h2 {
    font-size: 20px;
    margin-bottom: 8px;
}

.category {
    color: #6b7280;

    font-size: 13px;

    margin-bottom: 10px;
}

.price {
    font-size: 20px;

    font-weight: bold;

    margin-bottom: 10px;
}

.description {
    color: #6b7280;

    font-size: 14px;

    line-height: 1.5;

    margin-bottom: 18px;
}


/* Action Buttons */

.action-buttons {
    display: flex;
    gap: 10px;
}

.edit-btn,
.delete-btn {
    flex: 1;

    padding: 10px;

    border-radius: 7px;

    text-align: center;

    text-decoration: none;

    font-size: 14px;

    font-weight: bold;

    border: none;

    cursor: pointer;
}

.edit-btn {
    background: #2563eb;
    color: white;
}

.edit-btn:hover {
    background: #1d4ed8;
}

.delete-btn {
    background: #fee2e2;
    color: #b91c1c;
}

.delete-btn:hover {
    background: #fecaca;
}


/* Empty State */

.empty-box {
    background: white;

    padding: 50px 20px;

    border-radius: 12px;

    text-align: center;

    box-shadow:
        0 4px 15px rgba(0, 0, 0, 0.08);
}

.empty-icon {
    font-size: 55px;
    margin-bottom: 15px;
}

.empty-box h2 {
    margin-bottom: 8px;
}

.empty-box p {
    color: #6b7280;

    margin-bottom: 20px;
}

.add-btn {
    display: inline-block;

    padding: 11px 18px;

    background: #2563eb;

    color: white;

    text-decoration: none;

    border-radius: 7px;

    font-size: 14px;

    font-weight: bold;
}

.add-btn:hover {
    background: #1d4ed8;
}


/* Back Button */

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


<!-- ================= MAIN CONTENT ================= -->

<div class="container">


    <div class="heading">

        <h1>
            📦 My Products
        </h1>

        <p>
            Manage the products you have listed on CampusMart.
        </p>

    </div>


    <!-- ================= SUCCESS / ERROR MESSAGES ================= -->

    <%
        if ("updated".equals(success)) {
    %>

        <div class="success-message">
            ✅ Product updated successfully!
        </div>

    <%
        } else if ("deleted".equals(success)) {
    %>

        <div class="success-message">
            ✅ Product deleted successfully!
        </div>

    <%
        }

        if ("invalid".equals(error)) {
    %>

        <div class="error-message">
            ❌ Invalid product.
        </div>

    <%
        } else if ("notfound".equals(error)) {
    %>

        <div class="error-message">
            ❌ Product not found or you do not have permission to manage it.
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


    <!-- ================= PRODUCT LIST ================= -->

    <%
        if (products == null ||
            products.isEmpty()) {
    %>

        <div class="empty-box">

            <div class="empty-icon">
                📦
            </div>

            <h2>
                No Products Yet
            </h2>

            <p>
                You haven't added any products to CampusMart.
            </p>

            <a
                href="add-product.jsp"
                class="add-btn"
            >
                ➕ Add Your First Product
            </a>

        </div>

    <%
        } else {
    %>


        <div class="product-grid">


        <%
            for (Product product : products) {

                String image =
                        product.getImage();

                if (image == null ||
                    image.trim().isEmpty()) {

                    image = "📦";
                }
        %>


            <!-- ================= PRODUCT CARD ================= -->

            <div class="product-card">


                <div class="product-icon">
                    <%= image %>
                </div>


                <h2>
                    <%= product.getName() %>
                </h2>


                <div class="category">
                    <%= product.getCategory() %>
                </div>


                <div class="price">
                    ₹<%= String.format(
                        "%.2f",
                        product.getPrice()
                    ) %>
                </div>


                <div class="description">
                    <%= product.getDescription() %>
                </div>


                <!-- ================= ACTIONS ================= -->

                <div class="action-buttons">


                    <!-- EDIT -->

                    <a
                        href="edit-product?id=<%= product.getId() %>"
                        class="edit-btn"
                    >
                        ✏️ Edit
                    </a>


                    <!-- DELETE -->

                    <form
                        action="delete-product"
                        method="post"
                        style="flex: 1; margin: 0;"
                        onsubmit="return confirmDelete();"
                    >

                        <input
                            type="hidden"
                            name="id"
                            value="<%= product.getId() %>"
                        >

                        <button
                            type="submit"
                            class="delete-btn"
                            style="width: 100%;"
                        >
                            🗑️ Delete
                        </button>

                    </form>


                </div>


            </div>


        <%
            }
        %>


        </div>


    <%
        }
    %>


    <!-- ================= BACK TO DASHBOARD ================= -->

    <a
        href="seller-dashboard.jsp"
        class="back-dashboard"
    >
        ← Back to Dashboard
    </a>


</div>


<script>

function confirmDelete() {

    return confirm(
        "Are you sure you want to delete this product?"
    );

}

</script>


</body>

</html>