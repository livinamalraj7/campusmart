<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>CampusMart | Your Campus Marketplace</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            background: #f5f7fb;
            color: #222;
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
            gap: 25px;
            list-style: none;
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

        /* HERO */

        .hero {
            min-height: 430px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 60px 7%;
            background: linear-gradient(135deg, #dbeafe, #eff6ff);
        }

        .hero-text {
            max-width: 600px;
        }

        .hero-text h1 {
            font-size: 48px;
            color: #172554;
            margin-bottom: 18px;
        }

        .hero-text h1 span {
            color: #2563eb;
        }

        .hero-text p {
            font-size: 18px;
            color: #475569;
            line-height: 1.6;
            margin-bottom: 25px;
        }

        .shop-btn {
            display: inline-block;
            background: #2563eb;
            color: white;
            text-decoration: none;
            padding: 13px 25px;
            border-radius: 7px;
            font-weight: bold;
        }

        .shop-btn:hover {
            background: #1d4ed8;
        }

        .hero-icon {
            font-size: 150px;
        }

        /* CATEGORIES */

        .section {
            padding: 50px 7%;
        }

        .section-title {
            text-align: center;
            margin-bottom: 30px;
        }

        .section-title h2 {
            font-size: 30px;
            color: #172554;
        }

        .section-title p {
            color: #64748b;
            margin-top: 8px;
        }

        .categories {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
        }

        .category {
            background: white;
            padding: 25px;
            text-align: center;
            border-radius: 10px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.08);
            transition: 0.2s;

            text-decoration: none;
            color: inherit;
            display: block;
        }

        .category:hover {
            transform: translateY(-5px);
        }

        .category-icon {
            font-size: 45px;
            margin-bottom: 12px;
        }

        .category h3 {
            color: #172554;
            margin-bottom: 7px;
        }

        .category p {
            color: #64748b;
            font-size: 14px;
        }

        /* FEATURES */

        .features {
            background: white;
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 25px;
        }

        .feature {
            text-align: center;
            padding: 25px;
        }

        .feature-icon {
            font-size: 40px;
            margin-bottom: 10px;
        }

        .feature h3 {
            color: #172554;
            margin-bottom: 8px;
        }

        .feature p {
            color: #64748b;
            line-height: 1.5;
        }

        /* FOOTER */

        footer {
            background: #172554;
            color: white;
            text-align: center;
            padding: 25px;
        }

        footer p {
            color: #cbd5e1;
            margin-top: 8px;
        }

        @media (max-width: 800px) {

            .hero {
                text-align: center;
                flex-direction: column;
            }

            .hero-text h1 {
                font-size: 38px;
            }

            .categories {
                grid-template-columns: repeat(2, 1fr);
            }

            .features {
                grid-template-columns: 1fr;
            }

            .nav-links {
                display: none;
            }
        }
    </style>
</head>

<body>

<!-- NAVBAR -->

<nav class="navbar">

    <div class="logo">
        🎓 Campus<span>Mart</span>
    </div>

    <ul class="nav-links">

        <li>
            <a href="${pageContext.request.contextPath}/index.jsp">
                Home
            </a>
        </li>

        <li>
            <a href="/campusmart/products">
    Products
</a>
        </li>

        <li>
            <a href="${pageContext.request.contextPath}/products">
                Categories
            </a>
        </li>

        <li>
            <a href="${pageContext.request.contextPath}/cart">
                Cart 🛒
            </a>
        </li>

        <li>
            <a href="${pageContext.request.contextPath}/my-orders">
                My Orders
            </a>
        </li>

        <li>
            <a href="${pageContext.request.contextPath}/logout" class="login-btn">
                Logout
            </a>
        </li>

    </ul>

</nav>


<!-- HERO -->

<section class="hero">

    <div class="hero-text">

        <h1>
            Everything You Need,
            <span>Right on Campus.</span>
        </h1>

        <p>
            CampusMart is a student-focused marketplace where
            college students can buy and sell books, notes,
            stationery, calculators, project materials and
            college accessories.
        </p>

        <!-- FIXED EXPLORE BUTTON -->

        <a href="/campusmart/products"
   class="shop-btn">
    Explore CampusMart →
</a>

    </div>

    <div class="hero-icon">
        🎓
    </div>

</section>


<!-- CATEGORIES -->

<section class="section">

    <div class="section-title">

        <h2>Shop by Category</h2>

        <p>
            Find everything you need for your campus life
        </p>

    </div>


    <div class="categories">

        <a href="products?category=Books"
   class="category">

    <div class="category-icon">📚</div>

    <h3>Books</h3>

    <p>
        Textbooks & reference books
    </p>

</a>


        <a href="products?category=Study%20Materials" class="category">

            <div class="category-icon">📝</div>

            <h3>Study Materials</h3>

            <p>
                Notes and study resources
            </p>

        </a>


        <a href="products?category=Stationery" class="category">

            <div class="category-icon">✏️</div>

            <h3>Stationery</h3>

            <p>
                Pens, notebooks and more
            </p>

        </a>


        <a href="products?category=Electronics" class="category">

            <div class="category-icon">🧮</div>

            <h3>Calculators</h3>

            <p>
                Scientific and academic calculators
            </p>

        </a>


        <a href="products?category=Accessories" class="category">

            <div class="category-icon">🎒</div>

            <h3>Accessories</h3>

            <p>
                Bags and college essentials
            </p>

        </a>


        <a href="products?category=Project%20Materials" class="category">

            <div class="category-icon">🔬</div>

            <h3>Project Materials</h3>

            <p>
                Materials for academic projects
            </p>

        </a>


        <a href="products?category=Merchandise" class="category">

            <div class="category-icon">👕</div>

            <h3>Merchandise</h3>

            <p>
                College merchandise
            </p>

        </a>


        <a href="products" class="category">

            <div class="category-icon">🛍️</div>

            <h3>More</h3>

            <p>
                Explore more campus products
            </p>

        </a>

    </div>

</section>


<!-- FEATURES -->

<section class="section">

    <div class="section-title">

        <h2>Why CampusMart?</h2>

    </div>


    <div class="features">

        <div class="feature">

            <div class="feature-icon">🎓</div>

            <h3>Made for Students</h3>

            <p>
                A marketplace designed specifically
                for college students.
            </p>

        </div>


        <div class="feature">

            <div class="feature-icon">🤝</div>

            <h3>Student Sellers</h3>

            <p>
                Students can sell useful products
                directly to other students.
            </p>

        </div>


        <div class="feature">

            <div class="feature-icon">🛒</div>

            <h3>Easy Shopping</h3>

            <p>
                Browse products, add them to your cart
                and place orders easily.
            </p>

        </div>

    </div>

</section>


<!-- FOOTER -->

<footer>

    <h3>🎓 CampusMart</h3>

    <p>
        Your Campus. Your Marketplace.
    </p>

    <p>
        © 2026 CampusMart
    </p>

</footer>

</body>

</html>