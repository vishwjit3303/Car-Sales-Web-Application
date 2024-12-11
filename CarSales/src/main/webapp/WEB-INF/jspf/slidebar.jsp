<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Professional List Group</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" 
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" 
          crossorigin="anonymous">
    <style>
        body {
            background-color: #f1f1f1; 
            font-family: 'Arial', sans-serif;
            padding: 20px;
        }

        .list-group {
            margin: 40px auto;
            max-width: 400px;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1); 
        }

        .list-group-item {
            font-size: 18px;
            font-weight: 500;
            color: #555; 
            padding: 15px 20px;
            border: none;
            background-color: #ffffff; 
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .list-group-item:hover {
            background-color: #6c757d; 
            color: white; 
            transform: translateX(5px); 
            cursor: pointer;
        }

        .list-group-item a {
            text-decoration: none;
            color: inherit; 
        }

        .list-group-item:hover a {
            text-decoration: none; 
        }
    </style>
</head>
<body>
    <div class="container">
        <ul class="list-group">
            <li class="list-group-item">
                <a href="profile.jsp">My Profile</a>
            </li>

            
            <li class="list-group-item">
                <a href="login.jsp">Logout</a>
            </li>
        </ul>
    </div>
</body>
</html>
