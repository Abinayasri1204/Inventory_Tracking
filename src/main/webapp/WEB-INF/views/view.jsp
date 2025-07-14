<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Inventory List</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f0f8ff;
            padding: 60px;
            text-align: center;
        }

        h2 {
            color: #00796B;
            margin-bottom: 30px;
        }

        table {
            width: 90%;
            margin: auto;
            border-collapse: collapse;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            background-color: white;
        }

        th, td {
            padding: 14px;
            border: 1px solid #ccc;
            text-align: center;
            font-size: 16px;
        }

        th {
            background-color: #00796B;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .actions a {
            margin: 0 8px;
            text-decoration: none;
            color: #00796B;
            font-weight: bold;
        }

        .actions a:hover {
            text-decoration: underline;
        }

        .top-links {
            margin-top: 30px;
        }

        .top-links a {
            margin: 0 10px;
            padding: 10px 20px;
            background-color: #00796B;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            font-size: 15px;
        }

        .top-links a:hover {
            background-color: #004D40;
        }

        form button {
            padding: 6px 14px;
            background-color: #00796B;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }

        form button:hover {
            background-color: #004D40;
        }

        .out-of-stock {
            color: red;
            font-weight: bold;
        }
    </style>
</head>
<body>

    <h2>Inventory Items</h2>
    <c:if test="${not empty message}">
    <p style="color: green; font-weight: bold;">${message}</p>
</c:if>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Item</th>
                <th>Quantity</th>
                <th>Brand</th>
                <th>Price</th>
                <c:if test="${role == 'admin'}">
                    <th>Actions</th>
                </c:if>
                <c:if test="${role == 'user'}">
                    <th>Purchase</th>
                </c:if>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="item" items="${items}">
                <tr>
                    <td>${item.id}</td>
                    <td>${item.item}</td>
                    <td>${item.quantity}</td>
                    <td>${item.brand}</td>
                    <td>${item.price}</td>

                    <c:if test="${role == 'admin'}">
                        <td class="actions">
                            <a href="/items/edit/${item.id}">Edit</a> |
                            <a href="/items/delete/${item.id}">Delete</a>
                        </td>
                    </c:if>

                    <c:if test="${role == 'user'}">
                        <td>
                            <c:if test="${item.quantity > 0}">
                                <form action="/purchase/${item.id}" method="post" style="display:inline;">
                                    <button type="submit">Purchase</button>
                                </form>
                            </c:if>
                            <c:if test="${item.quantity == 0}">
                                <span class="out-of-stock">Out of Stock</span>
                            </c:if>
                        </td>
                    </c:if>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <div class="top-links">
        <c:if test="${role == 'admin'}">
            <a href="/home">Add New Item</a>
        </c:if>
        <a href="/logout">Logout</a>
    </div>

</body>
</html>

