<?php
    session_start();

    if(isset($_SESSION["loggedin"]) && $_SESSION["loggedin"] === false){
        header("location: index.php");
        exit;
    }

    if (!isset($connection)) {
        $connection = mysqli_connect(
            'localhost', // the server address (don't change)
            'eldenbees', // the MariaDB username
            'seebnedle3420F22', // the MariaDB username's password
            'eldenbees' // the MariaDB database name
        ) or die(mysqli_connect_error());
    }
    if ($connection === false) {
        echo "Unable to connect to database<br/>";
        echo mysqli_connect_error();
    }
    
    $sessusername = $_SESSION['username'];

    if(isset($_POST['pc-choice-form']))
    {   if($_POST['ancestry'] != "Ancestry")
        {   $posttemp = $_POST['ancestry'];
            $sql = "UPDATE users SET ancestry = '$posttemp' WHERE users_name = '$sessusername'";
            $conn->query($sql);
        }
        if($_POST['heritage'] != "Heritage")
        {   $posttemp = $_POST['heritage'];
            if($posttemp == "Default")
                $posttemp = '';
                $sql = "UPDATE users SET heritage = '$posttemp' WHERE users_name = '$sessusername'";
            $conn->query($sql);
        }
        if($_POST['background'] != "Background")
        {   $posttemp = $_POST['background'];
            $sql = "UPDATE users SET background = '$posttemp' WHERE users_name = '$sessusername'";
            $conn->query($sql);
        }
        if($_POST['class'] != "Class")
        {   $posttemp = $_POST['class'];
            $sql = "UPDATE users SET class = '$posttemp' WHERE users_name = '$sessusername'";
            $conn->query($sql);
        }
        if(!empty($_POST['pc-img']))
        {   $posttemp = $_POST['pc-img'];
            $sql = "UPDATE users SET img = '$posttemp' WHERE users_name = '$sessusername'";
            $conn->query($sql);
        }
        if(!empty($_POST['pc-name']))
        {   $posttemp = $_POST['pc-name'];
            $sql = "UPDATE users SET pc_name = '$posttemp' WHERE users_name = '$sessusername'";
            $conn->query($sql);
        }
        if($_POST['align-lc'] != "Align-LC")
        {   $posttemp = $_POST['align-lc'];
            $sql = "UPDATE users SET align_lc = '$posttemp' WHERE users_name = '$sessusername'";
            $conn->query($sql);
        }
        if($_POST['align-ge'] != "Align-GE")
        {   $posttemp = $_POST['align-ge'];
            $sql = "UPDATE users SET align_ge = '$posttemp' WHERE users_name = '$sessusername'";
            $conn->query($sql);
        }
    }

    $sql = "SELECT pc_name, img, ancestry, heritage, background, class, align_lc, align_ge FROM users WHERE users_name = '$sessusername'";
    $result = $conn->query($sql);
    if ($result->num_rows > 0) 
        while($row = $result->fetch_assoc()) 
        {   $_SESSION['pc-name'] = $row["pc_name"];
            $_SESSION['pc-img'] = $row["img"];
            $_SESSION['ancestry'] = $row["ancestry"];
            $_SESSION['heritage'] = $row["heritage"];
            $_SESSION['background'] = $row["background"];
            $_SESSION['class'] = $row["class"];
            $_SESSION['align-lc'] = $row["align_lc"];
            $_SESSION['align-ge'] = $row["align_ge"];
        }

    echo $row["img"];
    if (isset($_GET['logout'])) {
        logoutphp();
    }

    function logoutphp()
    {   session_start();
        
        // Unset all of the session variables
        $_SESSION = array();
        
        // Destroy the session.
        session_destroy();
        
        // Redirect to login page
        header("location: login.php");
        exit;
    }

    if(isset($_POST['chat-send']))
    {   
        $pcImg = $_SESSION['pc-img'];
        $pcName = $_SESSION['pc-name'];
        $msg = $_POST['chat-msg'];

        $sql = "INSERT INTO chat (pc_img, pc_name, msg) VALUES ('$pcImg', '$pcName', '$msg')";
        if ($conn->query($sql) === TRUE) 
            header("Location: index.php");
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/ui-darkness/jquery-ui.css">
    <link rel="stylesheet" href="style.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
            crossorigin="anonymous">
        </script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"
            integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU="
            crossorigin="anonymous">
    </script>
    <script src="script.js"></script>

    <title>3680 - RollPlay VTT</title>
</head>
    
<body>
   
    <h1>RollPlay VTT</h1>
        
    <nav>
        <a href="../">< Index</a><br>
    </nav>  <br>

    <p>Welcome, <?php echo $_SESSION['username']; ?>!   <a href='index.php?logout=true'>Logout</a><br></p>


    <div id="main-container" class="border-flex"> 
        <div id="pc-choices" class="border-outset">
                <form method="POST">
                    <select id="ancestry" name="ancestry" style="color:black">
                        <option value="Ancestry" style="color:gray;">Ancestry</option>
                        <option value="Dwarf">Dwarf</option>
                        <option value="Elf">Elf</option>
                        <option value="Gnome">Gnome</option>
                        <option value="Goblin">Goblin</option>
                        <option value="Halfling">Halfling</option>
                        <option value="Human">Human</option>
                    </select><br>
                    <select id="heritage" name="heritage" style="color:black">
                        <option value="Heritage" style="color:gray;">Heritage</option>
                        <option value="Aasimar">Aasimar</option>
                        <option value="Changeling">Changeling</option>
                        <option value="Default">Default</option>
                        <option value="Dhampir">Dhampir</option>
                        <option value="Dragonkin">Dragonkin</option>
                        <option value="Duskwalker">Duskwalker</option>
                        <option value="Tiefling">Tiefling</option>
                    </select><br>
                    <select id="background" name="background" style="color:black">
                        <option value="Background" style="color:gray;">Background</option>
                        <option value="Acolyte">Acolyte</option>
                        <option value="Farmhand">Farmhand</option>
                        <option value="Gladiator">Gladiator</option>
                        <option value="Hermit">Hermit</option>
                        <option value="Merchant">Merchant</option>
                        <option value="Scholar">Scholar</option>
                    </select><br>
                    <select id="class" name="class" style="color:black">
                        <option value="Class" style="color:gray;">Class</option>
                        <option value="Barbarian">Barbarian</option>
                        <option value="Bard">Bard</option>
                        <option value="Champion">Champion</option>
                        <option value="Cleric">Cleric</option>
                        <option value="Druid">Druid</option>
                        <option value="Fighter">Fighter</option>
                        <option value="Monk">Monk</option>
                        <option value="Ranger">Ranger</option>
                        <option value="Rogue">Rogue</option>
                        <option value="Sorcerer">Sorcerer</option>
                        <option value="Wizard">Wizard</option>
                    </select><br><br>
                    <div id="bio-sub">
                        <input type="text" id="pc-img" name="pc-img" placeholder="image-url"></input><br>
                        <input type="text" name="pc-name" placeholder="name"></input><br><br>

                        <div id="aln-sub" class="border-flex">
                            <select id="align-lc" name="align-lc" style="color:black">
                                <option value="Align-LC">Align LC</option>
                                <option value="Lawful">Lawful</option>
                                <option value="Neutral">Neutral</option>
                                <option value="Chaotic">Chaotic</option>
                            </select>
                            -
                            <select id="align-ge" name="align-ge" style="color:black">
                                <option value="Align-GE">Align GE</option>
                                <option value="Good">Good</option>
                                <option value="Neutral">Neutral</option>
                                <option value="Evil">Evil</option>
                            </select>
                        </div>
                    </div><br>

                    <input name="pc-choice-form" type="submit" value="Update">
                </form>
        </div>

        <div id="pc-display" class="border-flex" >
                <img id="image-bio" class="border-outset" src="<?php echo $_SESSION['pc-img']; ?>" >
                <div id="bio">
                    <div id="name-bio" class="border-flex"><?php echo $_SESSION['pc-name']; ?></div>
                    <div id="ancestry-bio" class="border-flex"><?php echo $_SESSION['heritage'] . " " . $_SESSION['ancestry']; ?></div>
                    <div id="background-bio" class="border-flex"><?php echo $_SESSION['background']; ?></div>
                    <div id="class-bio" class="border-flex"><?php echo $_SESSION['class']; ?></div>

                    <div id="align-size-speed">
                        <div id="align" class="border-flex">
                            <?php 
                                if($_SESSION['align-lc'] == $_SESSION['align-ge'])
                                    echo "True Neutral";
                                else
                                    echo $_SESSION['align-lc'] . " " . $_SESSION['align-ge']; 
                            ?>
                        </div>
                        <div id="size" class="border-flex">Size</div>
                        <div id="speed" class="border-flex">Speed</div>
                    </div>
                    <div id="abilities" class="border-flex"> 
                        <div id="ability">
                            <div id="label-str">STR</div>
                            <div id="stat-str">10</div>
                            <div id="mod-str"><img src="https://cdn-icons-png.flaticon.com/512/6545/6545894.png"> +0</div>
                        </div>

                        <div id="ability">
                            <div id="label-dex">DEX</div>
                            <div id="stat-dex">10</div>
                            <div id="mod-dex"><img src="https://cdn-icons-png.flaticon.com/512/6545/6545894.png"> +0</div>
                        </div>

                        <div id="ability">
                            <div id="label-con">CON</div>
                            <div id="stat-con">10</div>
                            <div id="mod-con"><img src="https://cdn-icons-png.flaticon.com/512/6545/6545894.png"> +0</div>
                        </div>

                        <div id="ability">
                            <div id="label-int">INT</div>
                            <div id="stat-int">10</div>
                            <div id="mod-int"><img src="https://cdn-icons-png.flaticon.com/512/6545/6545894.png"> +0</div>
                        </div>

                        <div id="ability">
                            <div id="label-wis">WIS</div>
                            <div id="stat-wis">10</div>
                            <div id="mod-wis"><img src="https://cdn-icons-png.flaticon.com/512/6545/6545894.png"> +0</div>
                        </div>

                        <div id="ability">
                            <div id="label-cha">CHA</div>
                            <div id="stat-cha">10</div>
                            <div id="mod-cha"><img src="https://cdn-icons-png.flaticon.com/512/6545/6545894.png"> +0</div>
                        </div>
                    </div>
                    <div id="skills" class="border-outset" style="display:flex;flex-direction: column;">
                        <div id="acrobatics">
                            <img src="https://cdn-icons-png.flaticon.com/512/6545/6545894.png">
                            <div> +0</div>
                            <div> Acrobatics</div>
                        </div>
                        <div id="arcana">
                            <img src="https://cdn-icons-png.flaticon.com/512/6545/6545894.png">
                            <div> +0</div>
                            <div> Arcana</div>
                        </div>
                        <div id="athletics">
                            <img src="https://cdn-icons-png.flaticon.com/512/6545/6545894.png">
                            <div> +0</div>
                            <div> Athletics</div>
                        </div>
                        <div id="crafting">
                            <img src="https://cdn-icons-png.flaticon.com/512/6545/6545894.png">
                            <div> +0</div>
                            <div> Crafting</div>
                        </div>
                        <div id="deception">
                            <img src="https://cdn-icons-png.flaticon.com/512/6545/6545894.png">
                            <div> +0</div>
                            <div> Deception</div>
                        </div>
                        <div id="diplomacy">
                            <img src="https://cdn-icons-png.flaticon.com/512/6545/6545894.png">
                            <div> +0</div>
                            <div> Diplomacy</div>
                        </div>
                        <div id="intimidation">
                            <img src="https://cdn-icons-png.flaticon.com/512/6545/6545894.png">
                            <div> +0</div>
                            <div> Intimidation</div>
                        </div>
                        <div id="lore">
                            <img src="https://cdn-icons-png.flaticon.com/512/6545/6545894.png">
                            <div> +0</div>
                            <div> Lore</div>
                        </div>
                        <div id="medicine">
                            <img src="https://cdn-icons-png.flaticon.com/512/6545/6545894.png">
                            <div> +0</div>
                            <div> Medicine</div>
                        </div>
                        <div id="nature">
                            <img src="https://cdn-icons-png.flaticon.com/512/6545/6545894.png">
                            <div> +0</div>
                            <div> Nature</div>
                        </div>
                        <div id="occulitism">
                            <img src="https://cdn-icons-png.flaticon.com/512/6545/6545894.png">
                            <div> +0</div>
                            <div> Intimidation</div>
                        </div>
                        <div id="performance">
                            <img src="https://cdn-icons-png.flaticon.com/512/6545/6545894.png">
                            <div> +0</div>
                            <div> Performance</div>
                        </div>
                        <div id="religion">
                            <img src="https://cdn-icons-png.flaticon.com/512/6545/6545894.png">
                            <div> +0</div>
                            <div> Religion</div>
                        </div>
                        <div id="society">
                            <img src="https://cdn-icons-png.flaticon.com/512/6545/6545894.png">
                            <div> +0</div>
                            <div> Society</div>
                        </div>
                        <div id="stealth">
                            <img src="https://cdn-icons-png.flaticon.com/512/6545/6545894.png">
                            <div> +0</div>
                            <div> Stealth</div>
                        </div>
                        <div id="survival">
                            <img src="https://cdn-icons-png.flaticon.com/512/6545/6545894.png">
                            <div> +0</div>
                            <div> Survival</div>
                        </div>
                        <div id="thievery">
                            <img src="https://cdn-icons-png.flaticon.com/512/6545/6545894.png">
                            <div> +0</div>
                            <div> Thievery</div>
                        </div>
                    </div>
                </div>
        </div>
        <div id="column-chat" class="border-outset" style="float:right;">
            <div id="chatlog" class="border-outset chat-box">
                <?php 
                    $sql = "SELECT pc_img, pc_name, msg, sent_at FROM chat";
                    $result = $conn->query($sql);
                
                    if ($result->num_rows > 0) {
                        while($row = $result->fetch_assoc()) {
                            echo "<div style=\"display:flex\">";
                                echo "<img src=\"" . $row['pc_img'] . "\" class=\"chat-img\">";
                                echo "<div style=\"text-align:left;inline-size: 400px;\">";
                                    echo "<span>" . $row['pc_name'] . ", " . $row['sent_at'] . "</span><br>";
                                    echo $row['msg'];
                                echo "</div>";
                            echo "</div><br>";
                        }
                    }
                ?>
            </div>
            <form method="POST">
                <input type="text" name="chat-msg" required placeholder="Message #global" minlength="1" maxlength="240">
                <input type="submit" name="chat-send" value="Send">
            </form>
        </div>
    </div>
        
</body>
</html>
