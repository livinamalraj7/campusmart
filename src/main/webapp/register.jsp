<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Register - CampusMart</title>

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
        }

        /* Navbar */

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

        .back-home {
            color: white;
            text-decoration: none;
            font-size: 14px;
        }

        .back-home:hover {
            text-decoration: underline;
        }

        /* Register Container */

        .container {
            width: 100%;
            max-width: 500px;
            margin: 40px auto;
            padding: 0 20px;
        }

        .register-box {
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
        }

        h2 {
            text-align: center;
            margin-bottom: 8px;
            color: #111827;
        }

        .subtitle {
            text-align: center;
            color: #6b7280;
            font-size: 14px;
            margin-bottom: 25px;
        }

        /* Error Message */

        .error-message {
            background: #fee2e2;
            color: #b91c1c;
            border: 1px solid #fecaca;
            padding: 10px;
            border-radius: 7px;
            text-align: center;
            margin-bottom: 20px;
            font-size: 14px;
            font-weight: bold;
        }

        /* Success Message */

        .success-message {
            background: #dcfce7;
            color: #15803d;
            border: 1px solid #bbf7d0;
            padding: 10px;
            border-radius: 7px;
            text-align: center;
            margin-bottom: 20px;
            font-size: 14px;
            font-weight: bold;
        }

        /* Form */

        .form-group {
            margin-bottom: 18px;
        }

        label {
            display: block;
            margin-bottom: 7px;
            color: #374151;
            font-size: 14px;
            font-weight: bold;
        }

        input,
        select {
            width: 100%;
            padding: 11px;
            border: 1px solid #d1d5db;
            border-radius: 7px;
            font-size: 14px;
            outline: none;
        }

        input:focus,
        select:focus {
            border-color: #2563eb;
        }

        .required {
            color: #dc2626;
        }

        /* Password Wrapper */

        .password-wrapper {
            position: relative;
            width: 100%;
        }

        .password-wrapper input {
            width: 100%;
            padding: 11px 45px 11px 11px;
            border: 1px solid #d1d5db;
            border-radius: 7px;
            font-size: 14px;
            outline: none;
        }

        .password-wrapper input:focus {
            border-color: #2563eb;
        }

        /* Show / Hide Password */

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

        /* Register Button */

        .register-btn {
            width: 100%;
            padding: 12px;
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

        .login-link {
            text-align: center;
            margin-top: 20px;
            font-size: 14px;
            color: #6b7280;
        }

        .login-link a {
            color: #2563eb;
            text-decoration: none;
            font-weight: bold;
        }

        .login-link a:hover {
            text-decoration: underline;
        }

        .hint {
            font-size: 12px;
            color: #6b7280;
            margin-top: 5px;
        }

    </style>

</head>

<body>

    <!-- Navbar -->

    <div class="navbar">

        <div class="logo">
            CampusMart
        </div>

        <a href="index.jsp" class="back-home">
            ← Back to Home
        </a>

    </div>


    <!-- Register Section -->

    <div class="container">

        <div class="register-box">

            <h2>Create Account</h2>

            <p class="subtitle">
                Join CampusMart and start shopping
            </p>


            <!-- Validation / Success Messages -->

            <%
                String error = request.getParameter("error");
                String success = request.getParameter("success");
            %>

            <% if ("empty".equals(error)) { %>

                <div class="error-message">
                    Please fill in all the required fields.
                </div>

            <% } else if ("password".equals(error)) { %>

                <div class="error-message">
                    Password must contain at least 6 characters.
                </div>

            <% } else if ("mismatch".equals(error)) { %>

                <div class="error-message">
                    Passwords do not match. Please try again.
                </div>

            <% } else if ("emailduplicate".equals(error)) { %>

                <div class="error-message">
                    This email is already registered.
                    Please use a different email.
                </div>

            <% } else if ("phoneduplicate".equals(error)) { %>

                <div class="error-message">
                    This phone number is already registered.
                    Please use a different phone number.
                </div>

            <% } else if ("duplicate".equals(error)) { %>

                <div class="error-message">
                    Email or phone number is already registered.
                </div>

            <% } else if ("server".equals(error)) { %>

                <div class="error-message">
                    Something went wrong. Please try again later.
                </div>

            <% } else if ("registered".equals(success)) { %>

                <div class="success-message">
                    Registration successful! You can now login.
                </div>

            <% } %>


            <!-- Registration Form -->

            <form action="register" method="post">


                <!-- Name -->

                <div class="form-group">

                    <label for="name">
                        Full Name <span class="required">*</span>
                    </label>

                    <input
                        type="text"
                        id="name"
                        name="name"
                        placeholder="Enter your full name"
                        required>

                </div>


                <!-- Email -->

                <div class="form-group">

                    <label for="email">
                        Email <span class="required">*</span>
                    </label>

                    <input
                        type="email"
                        id="email"
                        name="email"
                        placeholder="Enter your email"
                        required>

                </div>


                <!-- Phone -->

                <div class="form-group">

                    <label for="phone">
                        Phone Number <span class="required">*</span>
                    </label>

                    <input
                        type="tel"
                        id="phone"
                        name="phone"
                        placeholder="Enter 10-digit phone number"
                        pattern="[0-9]{10}"
                        maxlength="10"
                        required>

                    <div class="hint">
                        Enter exactly 10 digits.
                    </div>

                </div>


                <!-- Role -->

                <div class="form-group">

                    <label for="role">
                        Account Type <span class="required">*</span>
                    </label>

                    <select
                        id="role"
                        name="role"
                        required>

                        <option value="">
                            Select account type
                        </option>

                        <option value="customer">
                            Customer
                        </option>

                        <option value="seller">
                            Seller
                        </option>

                    </select>

                </div>


                <!-- Password -->

                <div class="form-group">

                    <label for="password">
                        Password <span class="required">*</span>
                    </label>

                    <div class="password-wrapper">

                        <input
                            type="password"
                            id="password"
                            name="password"
                            placeholder="Enter your password"
                            minlength="6"
                            required>

                        <button
                            type="button"
                            class="toggle-password"
                            id="togglePassword"
                            onclick="togglePasswordVisibility('password', 'togglePassword')"
                            aria-label="Show password">

                            👁️

                        </button>

                    </div>

                    <div class="hint">
                        Password must contain at least 6 characters.
                    </div>

                </div>


                <!-- Confirm Password -->

                <div class="form-group">

                    <label for="confirmPassword">
                        Confirm Password <span class="required">*</span>
                    </label>

                    <div class="password-wrapper">

                        <input
                            type="password"
                            id="confirmPassword"
                            name="confirmPassword"
                            placeholder="Re-enter your password"
                            minlength="6"
                            required>

                        <button
                            type="button"
                            class="toggle-password"
                            id="toggleConfirmPassword"
                            onclick="togglePasswordVisibility('confirmPassword', 'toggleConfirmPassword')"
                            aria-label="Show password">

                            👁️

                        </button>

                    </div>

                </div>


                <!-- Register Button -->

                <button
                    type="submit"
                    class="register-btn">

                    Create Account

                </button>

            </form>


            <!-- Login Link -->

            <div class="login-link">

                Already have an account?

                <a href="login.jsp">
                    Login here
                </a>

            </div>

        </div>

    </div>


    <script>

        function togglePasswordVisibility(
            passwordId,
            buttonId
        ) {

            const passwordInput =
                document.getElementById(passwordId);

            const toggleButton =
                document.getElementById(buttonId);


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