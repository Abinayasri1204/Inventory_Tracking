<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Select Role</title>
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
        .login{
         color: #00796B;
            margin-bottom: 50px;
            margin-top:25px;
        }

        h2 {
            color: #00796B;
            margin-bottom: 20px;
        }

        label {
            font-size: 18px;
            margin: 15px;
        }

        input[type="radio"] {
            transform: scale(1.4);
            margin-right: 8px;
        }

        button {
            margin-top: 25px;
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
    </style>
</head>
<body>

     <h2>Inventory Tracking System </h2>
<div class="form-box">
    <h2 class="login">Login Role</h2>
    <form action="/selectRole" method="post">
        <label>
            <input type="radio" name="role" value="admin" required /> Admin
        </label>
        <label>
            <input type="radio" name="role" value="user" required /> User
        </label>
        <br><br>
        <button type="submit">Next</button>
    </form>
</div>

</body>
</html>
