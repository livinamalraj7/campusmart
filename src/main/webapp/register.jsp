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
            min-height: 100vh;
            background: #f1f5f9;
            color: #172554;
        }

        /* NAVBAR */

        .navbar {
            height: 70px;
            background: #172554;

            display: flex;
            align-items: center;
            justify-content: space-between;

            padding: 0 7%;
        }

        .logo {
            color: white;
            font-size: 27px;
            font-weight: bold;
        }

        .logo span {
            color: #60a5fa;
        }

        .home-link {
            color: white;
            text-decoration: none;
            font-size: 15px;
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
            width: 460px;
            max-width: 100%;

            background: white;

            padding: 35px;

            border-radius: 14px;

            box-shadow:
                0 8px 30px rgba(0, 0, 0, 0.10);
        }

        .register-card h1 {
            text-align: center;
            font-size: 32px;
            margin-bottom: 8px;
        }

        .subtitle {
            text-align: center;
            color: #64748b;
            margin-bottom: 28px;
        }

        /* FORM */

        .form-group {
            margin-bottom: 18px;
        }

        .form-group label {
            display: block;

            margin-bottom: 7px;

            color: #334155;

            font-weight: bold;
            font-size: 14px;
        }

        .form-group input,
        .form-group select {

            width: 100%;

            padding: 12px 13px;

            border: 1px solid #cbd5e1;

            border-radius: 7px;

            font-size: 15px;

            background: white;

            outline: none;
        }

        .form-group input:focus,
        .form-group select:focus {
            border-color: #2563eb;

            box-shadow:
                0 0 0 3px rgba(37, 99, 235, 0.10);
        }

        /* REGISTER BUTTON */

        .register-btn {

            width: 100%;

            padding: 13px;

            margin-top: 5px;

            background: #2563eb;

            color: white;

            border: none;

            border-radius: 7px;

            font-size: 16px;

            font-weight: bold;

            cursor: pointer;
        }

        .register-btn:hover {
            background: #1d4ed8;
        }

        /* LOGIN */

        .login-text {
            text-align: center;

            margin-top: 22px;

            color: #64748b;

            font-size: 14px;
        }

        .login-text a {
            color: #2563eb;

            text-decoration: none;

            font-weight: bold;
        }

        .login-text a:hover {
            text-decoration: underline;
        }

        /* MOBILE */

        @media (max-width: 500px) {

            .navbar {
                padding: 0 5%;
            }

            .register-card {
                padding: 25px;
            }

            .register-card h1 {
                font-size: 27px;
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

        <a href="index.jsp" class="home-link">
            ← Back to Home
        </a>

    </nav>


    <!-- REGISTER -->

    <main class="register-container">

        <div class="register-card">

            <h1>Create Account</h1>

            <p class="subtitle">
                Join the CampusMart community
            </p>


            <!-- IMPORTANT: THE FORM STARTS HERE -->

            <form action="register" method="post">


                <!-- FULL NAME -->

                <div class="form-group">

                    <label for="name">
                        Full Name
                    </label>

                    <input
                        type="text"
                        id="name"
                        name="name"
                        placeholder="Enter your full name"
                        required>

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
                        required>

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
                        pattern="[0-9]{10}"
                        maxlength="10"
                        required>

                </div>


                <!-- ACCOUNT TYPE -->

                <div class="form-group">

                    <label for="role">
                        Account Type
                    </label>

                    <select
                        id="role"
                        name="role"
                        required>

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
                        minlength="6"
                        required>

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
                        minlength="6"
                        required>

                </div>


                <!-- SUBMIT BUTTON -->

                <button
                    type="submit"
                    class="register-btn">

                    Create Account

                </button>


            </form>

            <!-- FORM ENDS HERE -->


            <p class="login-text">

                Already have an account?

                <a href="login.jsp">
                    Login here
                </a>

            </p>

        </div>

    </main>

</body>

</html>