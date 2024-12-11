<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Car Sales Jumbotron</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" 
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" 
          crossorigin="anonymous">
    <style>
        body {
            background-color: #f1f1f1; 
            font-family: 'Arial', sans-serif;
            padding: 20px;
        }

        .jumbotron {
            background-color: #ffffff; 
            border-radius: 10px; 
            padding: 30px 20px; 
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1); 
            text-align: center; 
            margin: 40px auto; 
            max-width: 600px;
        }

        .jumbotron h1 {
            font-size: 36px; 
            font-weight: 700;
            color: #333;
            margin-bottom: 15px;
        }

        .jumbotron p {
            font-size: 18px; 
            color: #666; 
            margin-bottom: 20px;
        }

        .jumbotron .btn {
            padding: 10px 20px; 
            font-size: 16px; 
            border-radius: 5px; 
            margin: 5px; 
        }
    </style>
</head>
<body>
    <div class="jumbotron">
        <h1>Car Sales</h1>
        <p>Buy Cars Here</p>
        <a href="login.jsp" class="btn btn-success">Login</a>
        <a href="registration.jsp" class="btn btn-warning">Registration</a>
    </div>
</body>
</html>
