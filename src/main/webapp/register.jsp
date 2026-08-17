<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Register | CampusMart</title>

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            background: #f1f5f9;
            min-height: 100vh;
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

        .home-link {
            color: white;
            text-decoration: none;
        }

        .home-link:hover {
            color: #93c5fd;
        }

        /* REGISTER AREA */

        .register-container {
            min-height: calc(100vh - 70px);

            display: flex;
            justify-content: center;
            align-items: center;

            padding: 40px 20px;
        }

        .register-card {
            width: 450px;

            background: white;

            padding: 35px;

            border-radius: 12px;

            box-shadow: 0 5px 25px rgba(0, 0, 0, 0.10);
        }

        .register-card h1 {
            text-align: center;
            color: #172554;
            margin-bottom: 8px;
        }

        .subtitle {
            text-align: center;
            color: #64748b;
            margin-bottom: 25px;
        }

        /* FORM */

        .form-group {
            margin-bottom: 18px;
        }

        .form-group label {
            display: block;

            color: #334155;

            font-weight: bold;

            margin-bottom: 7px;
        }

        .form-group input,
        .form-group select {
            width: 100%;

            padding: 12px;

            border: 1px solid #cbd5e1;

            border-radius: 7px;

            font-size: 15px;

            outline: none;
        }

        .form-group input:focus,
        .form-group select:focus {
            border-color: #2563eb;
        }

        /* BUTTON */

        .register-btn {
            width: 100%;

            padding: 13px;

            background: #2563eb;

            color: white;

            border: none;

            border-radius: 7px;

            font-size: 16px;

            font-weight: bold;

            cursor: pointer;

            margin-top: 5px;
        }

        .register-btn:hover {
            background: #1d4ed8;
        }

        /* LOGIN LINK */

        .login-text {
            text-align: center;

            margin-top: 20px;

            color: #64748b;
        }

        .login-text a {
            color: #2563eb;

            text-decoration: none;

            font-weight: bold;
        }

        .login-text a:hover {
            text-decoration: underline;
        }

    </style>

</head>


<body>


    <!-- NAVBAR -->

    <nav class="navbar">

        <div class="logo">
            🎓 Campus<span>Mart</span>
        </div>

        <a href="index.jsp" class="home-link">
            ← Back to Home
        </a>

    </nav>


    <!-- REGISTER FORM -->

    <div class="register-container">

        <div class="register-card">

            <h1>Create Account</h1>

            <p class="subtitle">
                Join the CampusMart community
            </p>


            <form>

                <!-- NAME -->

                <div class="form-group">

                    <label for="name">
                        Full Name
                    </label>

                    <input
                        type="text"
                        id="name"
                        name="name"
                        placeholder="Enter your full name"
                        required
                    >

                </div>


                <!-- EMAIL -->

                <div class="form-group">

                    <label for="email">
                        Email
                    </label>

                    <input
                        type="email"
                        id="email"
                        name="email"
                        placeholder="Enter your email"
                        required
                    >

                </div>


                <!-- PHONE -->

                <div class="form-group">

                    <label for="phone">
                        Phone Number
                    </label>

                    <input
                        type="tel"
                        id="phone"
                        name="phone"
                        placeholder="Enter your phone number"
                        required
                    >

                </div>


                <!-- ROLE -->

                <div class="form-group">

                    <label for="role">
                        Account Type
                    </label>

                    <select id="role" name="role">

                        <option value="customer">
                            Student / Customer
                        </option>

                        <option value="seller">
                            Seller
                        </option>

                    </select>

                </div>


                <!-- PASSWORD -->

                <div class="form-group">

                    <label for="password">
                        Password
                    </label>

                    <input
                        type="password"
                        id="password"
                        name="password"
                        placeholder="Create a password"
                        required
                    >

                </div>


                <!-- CONFIRM PASSWORD -->

                <div class="form-group">

                    <label for="confirmPassword">
                        Confirm Password
                    </label>

                    <input
                        type="password"
                        id="confirmPassword"
                        name="confirmPassword"
                        placeholder="Confirm your password"
                        required
                    >

                </div>


                <!-- BUTTON -->

                <button
                    type="submit"
                    class="register-btn">
                    Create Account
                </button>

            </form>


            <p class="login-text">

                Already have an account?

                <a href="login.jsp">
                    Login here
                </a>

            </p>

        </div>

    </div>


</body>

</html>