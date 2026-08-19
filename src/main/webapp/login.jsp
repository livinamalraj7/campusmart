```jsp
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Login | CampusMart</title>

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

        /* LOGIN AREA */

        .login-container {
            min-height: calc(100vh - 70px);

            display: flex;
            justify-content: center;
            align-items: center;

            padding: 40px 20px;
        }

        .login-card {
            width: 430px;
            max-width: 100%;

            background: white;

            padding: 38px;

            border-radius: 14px;

            box-shadow:
                0 8px 30px rgba(0, 0, 0, 0.10);
        }

        .login-card h1 {
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
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;

            margin-bottom: 7px;

            color: #334155;

            font-weight: bold;
            font-size: 14px;
        }

        .form-group input {
            width: 100%;

            padding: 13px;

            border: 1px solid #cbd5e1;

            border-radius: 7px;

            font-size: 15px;

            outline: none;
        }

        .form-group input:focus {
            border-color: #2563eb;

            box-shadow:
                0 0 0 3px rgba(37, 99, 235, 0.10);
        }

        /* LOGIN BUTTON */

        .login-btn {
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

        .login-btn:hover {
            background: #1d4ed8;
        }

        /* REGISTER LINK */

        .register-text {
            text-align: center;

            margin-top: 22px;

            color: #64748b;

            font-size: 14px;
        }

        .register-text a {
            color: #2563eb;

            text-decoration: none;

            font-weight: bold;
        }

        .register-text a:hover {
            text-decoration: underline;
        }

        /* MOBILE */

        @media (max-width: 500px) {

            .navbar {
                padding: 0 5%;
            }

            .login-card {
                padding: 25px;
            }

            .login-card h1 {
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


    <!-- LOGIN -->

    <main class="login-container">

        <div class="login-card">

            <h1>Welcome Back</h1>

            <p class="subtitle">
                Login to your CampusMart account
            </p>


            <!-- LOGIN FORM -->

            <form action="login" method="post">


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


                <!-- PASSWORD -->

                <div class="form-group">

                    <label for="password">
                        Password
                    </label>

                    <input
                        type="password"
                        id="password"
                        name="password"
                        placeholder="Enter your password"
                        required>

                </div>


                <!-- LOGIN BUTTON -->

                <button
                    type="submit"
                    class="login-btn">

                    Login

                </button>


            </form>


            <!-- REGISTER LINK -->

            <p class="register-text">

                Don't have an account?

                <a href="register.jsp">
                    Create Account
                </a>

            </p>

        </div>

    </main>

</body>

</html>
```