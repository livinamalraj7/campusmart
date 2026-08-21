<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>Order Successful | CampusMart</title>

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

.success-container {
    min-height: 100vh;

    display: flex;
    align-items: center;
    justify-content: center;

    padding: 20px;
}

.success-card {
    background: white;

    width: 100%;
    max-width: 500px;

    text-align: center;

    padding: 50px 35px;

    border-radius: 15px;

    box-shadow: 0 5px 20px rgba(0, 0, 0, 0.08);
}

.success-icon {
    font-size: 70px;
    margin-bottom: 20px;
}

.success-card h1 {
    font-size: 32px;
    margin-bottom: 12px;
}

.success-card p {
    color: #64748b;
    font-size: 16px;
    line-height: 1.6;
    margin-bottom: 30px;
}

.home-btn {
    display: inline-block;

    background: #2563eb;

    color: white;

    text-decoration: none;

    padding: 12px 22px;

    border-radius: 7px;

    font-weight: bold;
}

.home-btn:hover {
    background: #1d4ed8;
}

</style>

</head>

<body>

<div class="success-container">

    <div class="success-card">

        <div class="success-icon">
            🎉
        </div>

        <h1>
            Order Placed Successfully!
        </h1>

        <p>
            Thank you for shopping with CampusMart.
            Your order has been received successfully.
        </p>

        <a href="products" class="home-btn">
            Continue Shopping
        </a>

    </div>

</div>

</body>

</html>