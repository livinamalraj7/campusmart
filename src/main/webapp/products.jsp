<%@ page contentType="text/html;charset=UTF-8" %>

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

        .cart-btn {
            background: #2563eb;
            padding: 9px 16px;
            border-radius: 6px;
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

        /* FILTER */

        .filter-section {
            width: 86%;
            margin: 0 auto 30px;

            display: flex;
            justify-content: center;
            gap: 12px;

            flex-wrap: wrap;
        }

        .filter-btn {
            padding: 9px 18px;

            border: 1px solid #cbd5e1;

            background: white;

            border-radius: 20px;

            cursor: pointer;

            color: #334155;
        }

        .filter-btn:hover {
            background: #2563eb;
            color: white;
        }

        /* PRODUCTS */

        .products-container {
            width: 86%;
            margin: auto;

            display: grid;

            grid-template-columns:
                repeat(auto-fit, minmax(240px, 1fr));

            gap: 25px;

            padding-bottom: 50px;
        }

        .product-card {
            background: white;

            border-radius: 12px;

            padding: 20px;

            box-shadow:
                0 4px 15px rgba(0, 0, 0, 0.08);

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
        }

        .add-btn:hover {
            background: #1d4ed8;
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

            <a href="products.jsp">
                Products
            </a>

            <a href="#">
                Categories
            </a>

            <a href="#">
                🛒 Cart
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


    <!-- FILTERS -->

    <div class="filter-section">

        <button class="filter-btn">
            All
        </button>

        <button class="filter-btn">
            📚 Books
        </button>

        <button class="filter-btn">
            📝 Study Materials
        </button>

        <button class="filter-btn">
            ✏️ Stationery
        </button>

        <button class="filter-btn">
            🧮 Calculators
        </button>

        <button class="filter-btn">
            🎒 Accessories
        </button>

        <button class="filter-btn">
            🔬 Project Materials
        </button>

    </div>


    <!-- PRODUCTS -->

    <div class="products-container">


        <!-- PRODUCT 1 -->

        <div class="product-card">

            <div class="product-image">
                📚
            </div>

            <div class="category">
                BOOKS
            </div>

            <h2>
                Engineering Mathematics
            </h2>

            <p class="description">
                Useful reference book for engineering students.
            </p>

            <div class="product-bottom">

                <span class="price">
                    ₹350
                </span>

                <button class="add-btn">
                    Add to Cart
                </button>

            </div>

        </div>


        <!-- PRODUCT 2 -->

        <div class="product-card">

            <div class="product-image">
                📝
            </div>

            <div class="category">
                STUDY MATERIALS
            </div>

            <h2>
                C Programming Notes
            </h2>

            <p class="description">
                Semester notes and important programming concepts.
            </p>

            <div class="product-bottom">

                <span class="price">
                    ₹100
                </span>

                <button class="add-btn">
                    Add to Cart
                </button>

            </div>

        </div>


        <!-- PRODUCT 3 -->

        <div class="product-card">

            <div class="product-image">
                ✏️
            </div>

            <div class="category">
                STATIONERY
            </div>

            <h2>
                College Stationery Kit
            </h2>

            <p class="description">
                Pens, pencils, notebook and other essentials.
            </p>

            <div class="product-bottom">

                <span class="price">
                    ₹150
                </span>

                <button class="add-btn">
                    Add to Cart
                </button>

            </div>

        </div>


        <!-- PRODUCT 4 -->

        <div class="product-card">

            <div class="product-image">
                🧮
            </div>

            <div class="category">
                CALCULATORS
            </div>

            <h2>
                Scientific Calculator
            </h2>

            <p class="description">
                Scientific calculator suitable for engineering students.
            </p>

            <div class="product-bottom">

                <span class="price">
                    ₹650
                </span>

                <button class="add-btn">
                    Add to Cart
                </button>

            </div>

        </div>


        <!-- PRODUCT 5 -->

        <div class="product-card">

            <div class="product-image">
                🎒
            </div>

            <div class="category">
                ACCESSORIES
            </div>

            <h2>
                College Backpack
            </h2>

            <p class="description">
                Spacious backpack for books, laptop and college items.
            </p>

            <div class="product-bottom">

                <span class="price">
                    ₹900
                </span>

                <button class="add-btn">
                    Add to Cart
                </button>

            </div>

        </div>


        <!-- PRODUCT 6 -->

        <div class="product-card">

            <div class="product-image">
                🔬
            </div>

            <div class="category">
                PROJECT MATERIALS
            </div>

            <h2>
                Mini Project Kit
            </h2>

            <p class="description">
                Basic components and materials for student projects.
            </p>

            <div class="product-bottom">

                <span class="price">
                    ₹450
                </span>

                <button class="add-btn">
                    Add to Cart
                </button>

            </div>

        </div>


    </div>


</body>

</html>