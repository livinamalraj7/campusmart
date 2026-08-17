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
            background: #f1f5f9;
            min-height: 100vh;
        }

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

        .login-container {
            min-height: calc(100vh - 70px);

            display: flex;
            justify-content: center;
            align-items: center;

            padding: 40px 20px;
        }

        .login-card {
            width: 420px;

            background: white;

            padding: 35px;

            border-radius: 12px;

            box-shadow: 0 5px 25px rgba(0, 0, 0, 0.10);
        }

        .login-card h1 {
            text-align: center;
            color: #172554;
            margin-bottom: 8px;
        }

        .subtitle {
            text-align: center;
            color: #64748b;
            margin-bottom: 25px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;

            color: #334155;

            font-weight: bold;

            margin-bottom: 7px;
        }

        .form-group input {
            width: 100%;

            padding: 12px;

            border: 1px solid #cbd5e1;

            border-radius: 7px;

            font-size: 15px;

            outline: none;
        }

        .form-group input:focus {
            border-color: #2563eb;
        }

        .login-btn {
            width: 100%;

            padding: 13px;

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

        .register-text {
            text-align: center;

            margin-top: 20px;

            color: #64748b;
        }

        .register-text a {
            color: #2563eb;

            text-decoration: none;

            font-weight: bold;
        }

        .register-text a:hover {
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


    <!-- LOGIN -->

    <div class="login-container">

        <div class="login-card">

            <h1>Welcome Back!</h1>

            <p class="subtitle">
                Login to your CampusMart account
            </p>


            <form>

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


                <div class="form-group">

                    <label for="password">
                        Password
                    </label>

                    <input
                        type="password"
                        id="password"
                        name="password"
                        placeholder="Enter your password"
                        required
                    >

                </div>


                <button
                    type="submit"
                    class="login-btn">

                    Login

                </button>

            </form>


            <p class="register-text">

                Don't have an account?

                <a href="register.jsp">
                    Create one
                </a>

            </p>

        </div>

    </div>


</body>

</html>