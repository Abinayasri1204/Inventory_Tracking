<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>${role} Login</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f0f8ff;
            text-align: center;
            padding: 100px;
        }

        .form-box {
            background-color: white;
            display: inline-block;
            padding: 40px 50px;
            border-radius: 12px;
            box-shadow: 0 8px 18px rgba(0, 0, 0, 0.2);
        }

        h2 {
            color: #00796B;
            margin-bottom: 20px;
        }

        label {
            font-size: 18px;
            margin: 15px;
            display: block;
            text-align: left;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0 20px 0;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 16px;
        }

        button {
            margin-top: 10px;
            padding: 12px 28px;
            font-size: 16px;
            background-color: #00796B;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
        }

        button:hover {
            background-color: #004D40;
        }

        .error {
            color: red;
            margin-top: 15px;
        }
    </style>
</head>
<body>
    <div class="form-box">
        <h2>Login as ${role}</h2>

        <form action="/login" method="post">
            <label>Username:</label>
            <input type="text" name="username" required>

            <label>Password:</label>
            <input type="password" name="password" required>

            <button type="submit">Login</button>
        </form>

        <p class="error">${error}</p>
    </div>
</body>
</html>

