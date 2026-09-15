<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    String userRole = (String) session.getAttribute("userRole");

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

    <title>Add Product - CampusMart</title>

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

        .back {
            color: white;
            text-decoration: none;
            font-size: 14px;
        }

        .back:hover {
            text-decoration: underline;
        }

        .container {
            width: 90%;
            max-width: 700px;
            margin: 40px auto;
        }

        .card {
            background: white;
            padding: 30px;
            border-radius: 12px;

            box-shadow:
                0 4px 15px rgba(0, 0, 0, 0.08);
        }

        h1 {
            font-size: 28px;
            margin-bottom: 8px;
        }

        .subtitle {
            color: #6b7280;
            font-size: 14px;
            margin-bottom: 28px;
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
            padding: 12px;

            border: 1px solid #cbd5e1;
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
            min-height: 100px;
            resize: vertical;
        }

        .submit-btn {
            width: 100%;

            padding: 13px;

            background: #2563eb;
            color: white;

            border: none;
            border-radius: 7px;

            font-size: 15px;
            font-weight: bold;

            cursor: pointer;
        }

        .submit-btn:hover {
            background: #1d4ed8;
        }

        .cancel {
            display: block;

            text-align: center;

            margin-top: 15px;

            color: #2563eb;
            text-decoration: none;

            font-size: 14px;
        }

        .cancel:hover {
            text-decoration: underline;
        }

    </style>

</head>

<body>


    <!-- Navbar -->

    <div class="navbar">

        <div class="logo">
            CampusMart Seller
        </div>

        <a
            href="seller-dashboard.jsp"
            class="back">

            ← Dashboard

        </a>

    </div>


    <!-- Add Product Form -->

    <div class="container">

        <div class="card">

            <h1>
                Add Product ➕
            </h1>

            <p class="subtitle">
                Add a new product to your CampusMart store.
            </p>


            <form
                action="add-product"
                method="post"
                  accept-charset="UTF-8">


                <!-- Product Name -->

                <div class="form-group">

                    <label for="name">
                        Product Name
                    </label>

                    <input
                        type="text"
                        id="name"
                        name="name"
                        placeholder="Enter product name"
                        maxlength="150"
                        required>

                </div>


                <!-- Category -->

                <div class="form-group">

                    <label for="category">
                        Category
                    </label>

                    <select
                        id="category"
                        name="category"
                        required>

                        <option value="">
                            Select a category
                        </option>

                        <option value="Books">
                            Books
                        </option>

                        <option value="Study Materials">
                            Study Materials
                        </option>

                        <option value="Stationery">
                            Stationery
                        </option>

                        <option value="Electronics">
                            Electronics
                        </option>

                        <option value="Accessories">
                            Accessories
                        </option>

                        <option value="Project Materials">
                            Project Materials
                        </option>

                        <option value="Merchandise">
                            Merchandise
                        </option>

                        <option value="Lab Essentials">
                            Lab Essentials
                        </option>

                    </select>

                </div>


                <!-- Price -->

                <div class="form-group">

                    <label for="price">
                        Price (₹)
                    </label>

                    <input
                        type="number"
                        id="price"
                        name="price"
                        placeholder="Enter product price"
                        min="0.01"
                        step="0.01"
                        required>

                </div>


                <!-- Description -->

                <div class="form-group">

                    <label for="description">
                        Description
                    </label>

                    <textarea
                        id="description"
                        name="description"
                        placeholder="Describe your product"
                        maxlength="500"
                        required></textarea>

                </div>


                <!-- Image / Emoji -->

                <div class="form-group">

                    <label for="image">
                        Product Image / Emoji
                    </label>

                    <input
                        type="text"
                        id="image"
                        name="image"
                        placeholder="Example: 📘"
                        maxlength="255">

                </div>


                <button
                    type="submit"
                    class="submit-btn">

                    Add Product

                </button>


            </form>


            <a
                href="seller-dashboard.jsp"
                class="cancel">

                Cancel

            </a>

        </div>

    </div>

</body>

</html>