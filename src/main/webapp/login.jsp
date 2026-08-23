<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

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
            background: linear-gradient(135deg, #dbeafe, #eff6ff);
            display: flex;
            align-items: center;
            justify-content: center;
            color: #172554;
        }

        .login-container {
            width: 90%;
            max-width: 420px;
            background: white;
            padding: 40px;
            border-radius: 14px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.12);
        }

        .logo {
            text-align: center;
            font-size: 30px;
            font-weight: bold;
            margin-bottom: 8px;
        }

        .logo span {
            color: #2563eb;
        }

        .subtitle {
            text-align: center;
            color: #64748b;
            margin-bottom: 30px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 7px;
            font-weight: bold;
            color: #172554;
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
            border: none;
            background: #2563eb;
            color: white;
            padding: 13px;
            border-radius: 7px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
        }

        .login-btn:hover {
            background: #1d4ed8;
        }

        .register-link {
            text-align: center;
            margin-top: 22px;
            color: #64748b;
        }

        .register-link a {
            color: #2563eb;
            text-decoration: none;
            font-weight: bold;
        }

        .register-link a:hover {
            text-decoration: underline;
        }

        .home-link {
            text-align: center;
            margin-top: 15px;
        }

        .home-link a {
            color: #475569;
            text-decoration: none;
            font-size: 14px;
        }

        .home-link a:hover {
            color: #2563eb;
        }

    </style>

</head>

<body>

    <div class="login-container">

        <div class="logo">
            🎓 Campus<span>Mart</span>
        </div>

        <p class="subtitle">
            Login to your CampusMart account
        </p>

        <form action="login" method="post">

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

            <button type="submit" class="login-btn">
                Login
            </button>

        </form>

        <div class="register-link">

            Don't have an account?

            <a href="register.jsp">
                Register
            </a>

        </div>

        <div class="home-link">

            <a href="index.jsp">
                ← Back to Home
            </a>

        </div>

    </div>

</body>

</html>