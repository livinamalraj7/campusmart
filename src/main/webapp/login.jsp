<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">

    <title>CampusMart - Login</title>

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

            font-size: 32px;
            font-weight: bold;

            color: #2563eb;

            margin-bottom: 8px;
        }

        .subtitle {
            text-align: center;

            color: #64748b;

            font-size: 14px;

            margin-bottom: 30px;
        }

        .error-message {
            background: #fee2e2;

            color: #b91c1c;

            padding: 10px 12px;

            border-radius: 7px;

            font-size: 14px;

            margin-bottom: 20px;

            text-align: center;
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

        /* EMAIL INPUT */

        .form-group > input {
            width: 100%;

            padding: 12px;

            border: 1px solid #cbd5e1;

            border-radius: 7px;

            font-size: 15px;

            outline: none;
        }

        .form-group > input:focus {
            border-color: #2563eb;
        }

        /* PASSWORD */

        .password-wrapper {
            position: relative;

            width: 100%;
        }

        .password-wrapper input {
            width: 100%;

            padding: 12px 45px 12px 12px;

            border: 1px solid #cbd5e1;

            border-radius: 7px;

            font-size: 15px;

            outline: none;
        }

        .password-wrapper input:focus {
            border-color: #2563eb;
        }

        /* SHOW / HIDE PASSWORD BUTTON */

        .toggle-password {
            position: absolute;

            right: 12px;

            top: 50%;

            transform: translateY(-50%);

            border: none;

            background: transparent;

            cursor: pointer;

            font-size: 18px;

            padding: 3px;
        }

        .toggle-password:hover {
            opacity: 0.7;
        }

        /* LOGIN BUTTON */

        .login-btn {
            width: 100%;

            padding: 12px;

            border: none;

            border-radius: 7px;

            background: #2563eb;

            color: white;

            font-size: 16px;

            font-weight: bold;

            cursor: pointer;

            margin-top: 5px;
        }

        .login-btn:hover {
            background: #1d4ed8;
        }

        .register-link {
            text-align: center;

            margin-top: 20px;

            font-size: 14px;

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

    </style>
</head>

<body>

    <div class="login-container">

        <div class="logo">
            🛒 CampusMart
        </div>

        <div class="subtitle">
            Login to your account
        </div>

        <%
            String error = request.getParameter("error");

            if ("invalid".equals(error)) {
        %>

            <div class="error-message">
                Invalid email or password. Please try again.
            </div>

        <%
            } else if ("server".equals(error)) {
        %>

            <div class="error-message">
                Something went wrong. Please try again later.
            </div>

        <%
            }
        %>

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

                <div class="password-wrapper">

                    <input
                        type="password"
                        id="password"
                        name="password"
                        placeholder="Enter your password"
                        required>

                    <button
                        type="button"
                        class="toggle-password"
                        id="togglePassword"
                        onclick="togglePasswordVisibility()"
                        aria-label="Show password">

                        👁️

                    </button>

                </div>

            </div>


            <!-- LOGIN -->

            <button
                type="submit"
                class="login-btn">

                Login

            </button>

        </form>


        <div class="register-link">

            Don't have an account?
            <a href="register.jsp">
                Register
            </a>

        </div>

    </div>


    <script>

        function togglePasswordVisibility() {

            const passwordInput =
                document.getElementById("password");

            const toggleButton =
                document.getElementById("togglePassword");


            if (passwordInput.type === "password") {

                passwordInput.type = "text";

                toggleButton.textContent = "🙈";

                toggleButton.setAttribute(
                    "aria-label",
                    "Hide password"
                );

            } else {

                passwordInput.type = "password";

                toggleButton.textContent = "👁️";

                toggleButton.setAttribute(
                    "aria-label",
                    "Show password"
                );

            }
        }

    </script>

</body>
</html>