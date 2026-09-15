<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    String userRole = (String) session.getAttribute("userRole");
    String userName = (String) session.getAttribute("userName");

    // Seller-only access
    if (userRole == null ||
        !"seller".equalsIgnoreCase(userRole)) {

        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<title>Seller Dashboard - CampusMart</title>

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


/* ================= MAIN CONTAINER ================= */

.container {
    width: 90%;
    max-width: 1100px;

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


/* ================= SUCCESS MESSAGE ================= */

.success-message {
    background: #dcfce7;

    color: #166534;

    padding: 12px 15px;

    border-radius: 7px;

    margin-bottom: 25px;

    font-size: 14px;

    border: 1px solid #bbf7d0;
}


/* ================= ERROR MESSAGE ================= */

.error-message {
    background: #fee2e2;

    color: #991b1b;

    padding: 12px 15px;

    border-radius: 7px;

    margin-bottom: 25px;

    font-size: 14px;

    border: 1px solid #fecaca;
}


/* ================= DASHBOARD GRID ================= */

.dashboard-grid {
    display: grid;

    grid-template-columns:
        repeat(auto-fit, minmax(220px, 1fr));

    gap: 20px;
}


/* ================= DASHBOARD CARD ================= */

.dashboard-card {
    background: white;

    padding: 25px;

    border-radius: 12px;

    box-shadow:
        0 4px 15px rgba(0, 0, 0, 0.08);

    text-decoration: none;

    color: #111827;

    transition:
        transform 0.2s,
        box-shadow 0.2s;
}

.dashboard-card:hover {
    transform: translateY(-3px);

    box-shadow:
        0 7px 20px rgba(0, 0, 0, 0.12);
}

.card-icon {
    font-size: 35px;

    margin-bottom: 15px;
}

.dashboard-card h2 {
    font-size: 20px;

    margin-bottom: 8px;
}

.dashboard-card p {
    color: #6b7280;

    font-size: 14px;

    line-height: 1.5;
}


/* ================= BACK BUTTON ================= */

.back-shopping {
    display: inline-block;

    margin-top: 30px;

    padding: 11px 18px;

    background: #2563eb;

    color: white;

    text-decoration: none;

    border-radius: 7px;

    font-size: 14px;

    font-weight: bold;
}

.back-shopping:hover {
    background: #1d4ed8;
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

        <a
            href="logout"
            class="logout"
        >
            Logout
        </a>

    </div>

</div>


<!-- ================= MAIN CONTENT ================= -->

<div class="container">


    <!-- ================= HEADING ================= -->

    <div class="heading">

        <h1>
            Seller Dashboard 🏪
        </h1>

        <p>
            Manage your products and orders from here.
        </p>

    </div>


    <!-- ================= MESSAGES ================= -->

    <%
        String success =
                request.getParameter("success");

        String error =
                request.getParameter("error");


        if ("productadded".equals(success)) {
    %>

        <div class="success-message">
            ✅ Product added successfully!
        </div>

    <%
        } else if ("updated".equals(success)) {
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


        if ("server".equals(error)) {
    %>

        <div class="error-message">
            ❌ Something went wrong. Please try again.
        </div>

    <%
        }
    %>


    <!-- ================= DASHBOARD CARDS ================= -->

    <div class="dashboard-grid">


        <!-- ================= ADD PRODUCT ================= -->

        <a
            href="add-product.jsp"
            class="dashboard-card"
        >

            <div class="card-icon">
                ➕
            </div>

            <h2>
                Add Product
            </h2>

            <p>
                Add a new product to your CampusMart store.
            </p>

        </a>


        <!-- ================= MY PRODUCTS ================= -->

        <a
            href="my-products"
            class="dashboard-card"
        >

            <div class="card-icon">
                📦
            </div>

            <h2>
                My Products
            </h2>

            <p>
                View and manage the products you have listed.
            </p>

        </a>


        <!-- ================= ORDERS ================= -->

        <a
            href="seller-orders"
            class="dashboard-card"
        >

            <div class="card-icon">
                📋
            </div>

            <h2>
                Orders
            </h2>

            <p>
                View orders placed for your products.
            </p>

        </a>


        <!-- ================= VIEW STORE ================= -->

        <a
            href="products"
            class="dashboard-card"
        >

            <div class="card-icon">
                🛍️
            </div>

            <h2>
                View Store
            </h2>

            <p>
                Browse the products currently available on CampusMart.
            </p>

        </a>


    </div>


    <!-- ================= BACK TO CAMPUSMART ================= -->

    <a
        href="index.jsp"
        class="back-shopping"
    >
        ← Back to CampusMart
    </a>


</div>


</body>

</html>