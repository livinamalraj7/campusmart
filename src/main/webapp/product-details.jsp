<%@ page import="com.campusmart.model.Product" %>

<%
    Product product = (Product) request.getAttribute("product");

    if (product == null) {
        response.sendRedirect("products");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title><%= product.getName() %> | CampusMart</title>

    <style>

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        body {
            background-color: #f5f7fb;
            color: #222;
        }

        /* NAVBAR */

        .navbar {
            background-color: #1e3a8a;
            color: white;
            padding: 18px 50px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar h1 {
            font-size: 26px;
        }

        .navbar a {
            color: white;
            text-decoration: none;
            margin-left: 20px;
            font-size: 15px;
        }

        .navbar a:hover {
            text-decoration: underline;
        }

        /* MAIN CONTAINER */

        .container {
            max-width: 1000px;
            margin: 50px auto;
            padding: 20px;
        }

        /* PRODUCT DETAILS */

        .product-details {
            background: white;
            border-radius: 12px;
            padding: 35px;
            display: flex;
            gap: 45px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
        }

        /* PRODUCT VISUAL */

        .product-image {
            width: 350px;
            height: 350px;
            flex-shrink: 0;
            border-radius: 10px;
            background-color: #f1f5f9;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
        }

        .product-icon {
            font-size: 150px;
            line-height: 1;
        }

        .no-image {
            color: #777;
            font-size: 18px;
        }

        /* PRODUCT INFORMATION */

        .product-info {
            flex: 1;
            padding-top: 10px;
        }

        .product-info h2 {
            font-size: 32px;
            margin-bottom: 15px;
        }

        .category {
            display: inline-block;
            background-color: #e0e7ff;
            color: #3730a3;
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 14px;
            margin-bottom: 20px;
        }

        .price {
            font-size: 28px;
            font-weight: bold;
            color: #16a34a;
            margin-bottom: 20px;
        }

        .description {
            font-size: 16px;
            line-height: 1.6;
            color: #555;
            margin-bottom: 30px;
        }

        /* BUTTONS */

        .buttons {
            display: flex;
            gap: 15px;
            flex-wrap: wrap;
        }

        .btn {
            display: inline-block;
            padding: 12px 22px;
            border-radius: 6px;
            text-decoration: none;
            font-size: 15px;
            cursor: pointer;
        }

        .cart-btn {
            background-color: #2563eb;
            color: white;
        }

        .cart-btn:hover {
            background-color: #1d4ed8;
        }

        .back-btn {
            background-color: #e5e7eb;
            color: #333;
        }

        .back-btn:hover {
            background-color: #d1d5db;
        }

        /* MOBILE */

        @media (max-width: 768px) {

            .product-details {
                flex-direction: column;
            }

            .product-image {
                width: 100%;
                height: 300px;
            }

            .product-icon {
                font-size: 120px;
            }

            .navbar {
                padding: 15px 20px;
            }

            .container {
                margin: 20px auto;
            }

            .product-info h2 {
                font-size: 26px;
            }

        }

    </style>

</head>

<body>

    <!-- NAVBAR -->

    <div class="navbar">

        <h1>CampusMart</h1>

        <div>

            <a href="index.jsp">Home</a>

            <a href="products">Products</a>

            <a href="cart.jsp">Cart</a>

        </div>

    </div>


    <!-- MAIN -->

    <div class="container">

        <div class="product-details">


            <!-- PRODUCT ICON -->

            <div class="product-image">

                <%
                    if (product.getImage() != null &&
                        !product.getImage().trim().isEmpty()) {
                %>

                    <div class="product-icon">

                        <%= product.getImage() %>

                    </div>

                <%
                    } else {
                %>

                    <div class="no-image">

                        No Image Available

                    </div>

                <%
                    }
                %>

            </div>


            <!-- PRODUCT INFORMATION -->

            <div class="product-info">

                <h2>

                    <%= product.getName() %>

                </h2>


                <span class="category">

                    <%= product.getCategory() %>

                </span>


                <div class="price">

                    &#8377;<%= String.format("%.2f",
                            product.getPrice()) %>

                </div>


                <div class="description">

                    <%= product.getDescription() %>

                </div>


                <div class="buttons">


                    <!-- ADD TO CART -->

                    <a href="cart?name=<%= java.net.URLEncoder.encode(product.getName(), "UTF-8") %>&category=<%= java.net.URLEncoder.encode(product.getCategory(), "UTF-8") %>&price=<%= product.getPrice() %>&icon=<%= java.net.URLEncoder.encode(product.getImage() == null ? "" : product.getImage(), "UTF-8") %>"
                       class="btn cart-btn">

                        Add to Cart

                    </a>


                    <!-- BACK -->

                    <a href="products"
                       class="btn back-btn">

                        &#8592; Back to Products

                    </a>

                </div>

            </div>

        </div>

    </div>

</body>
</html>