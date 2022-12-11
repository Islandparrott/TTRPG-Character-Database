<?php
/* For some reason, new accounts don't work. I have 2 accounts which *do* work, 
 * u: admin p: admin
 * u: island p: island
 * 
 * I believe it has something to do with the hashing of the password, though I have no idea what's wrong with it.
 */

session_start();

if(isset($_SESSION["loggedin"]) && $_SESSION["loggedin"] === true){
    header("location: index.php");
    exit;
}

require_once("../config.php");

if(isset($_POST['login']))
{   
    $username = $_POST['username'];
    $password = $_POST['password'];

    $usrsql = "SELECT Username, 'Password' FROM Account WHERE Username = '$username'";
    $result = $connection->query($usrsql);
    if ($result->num_rows > 0) 
        while($row = $result->fetch_assoc()) 
        {  
            if(password_verify($password, $row["Password"]))
            {   session_start();
                
                $_SESSION["loggedin"] = true;
                $_SESSION["username"] = $row["Username"];   
                
                header("location: index.php");
            } else 
                echo " Password not verified ";
        }
}

if(isset($_POST['register']))
{   if(!preg_match('/^[a-zA-Z0-9_]+$/', $_POST["username"]))
    {   echo "Username can only contain a-z A-Z 0-9 _";
        $userErr = 1;
    }

    $username = $_POST['username'];
    $usrsql = "SELECT Username FROM Account WHERE Username = '$username'";
    $result = $connection->query($usrsql);
    if ($result->num_rows > 0) 
    {   $userErr = 1;
        echo "Username is already in use.";
    }

    if($_POST['password'] == $_POST['password2'] && $userErr == 0)
    {   
        $hash_password = password_hash($password, PASSWORD_DEFAULT);
        $username = $_POST['username'];
        $usrsql = "INSERT INTO Account (Username, Password) VALUES ('$username', '$hash_password')";
        if ($connection->query($usrsql) === TRUE) 
            header("Location: login.php");
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" href="style.css">

    <title>Project 3 - Login/register</title>
</head>

<body>
    <h1>Login/Register</h1>
    
    <nav>
        <a href="../">< 3680-home</a><br>
    </nav>  <br>

    <div id="login-card" class="border-flex">
        <form method="post">
            <div class="form-group">
                <label>Username</label>
                <input type="text" name="username" required>
            </div>    
            <div class="form-group">
                <label>Password</label>
                <input type="password" name="password" minlength="5" required>
            </div>
            <div>
                <label>Confirm</label>
                <input type="password" name="password2" minlength="5">
            </div>
            <div class="form-group">
                <input type="submit" name="login" value="Login">
                <input type="submit" name="register" value="Register">
            </div>
        </form>
    </div>
        
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="script.js"></script>
</body>
</html>

<?php

?>