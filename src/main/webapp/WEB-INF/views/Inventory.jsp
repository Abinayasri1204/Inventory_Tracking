<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Inventory</title>
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
            margin: 15px 0 5px;
            display: block;
            text-align: left;
        }

        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
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

        a {
            display: block;
            margin-top: 20px;
            color: #00796B;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="form-box">
        <h2>Add Inventory Item</h2>
        <form action="/submit" method="post">
            <label>Item:</label>
            <input type="text" name="item" required>

            <label>Quantity:</label>
            <input type="number" name="quantity" required>

            <label>Brand:</label>
            <input type="text" name="brand" required>

            <label>Price:</label>
            <input type="number" step="0.01" name="price" required>
             
            <button type="submit">Add Item</button>
        </form>

        <a href="/items">View Items</a>
    </div>
</body>
</html>
