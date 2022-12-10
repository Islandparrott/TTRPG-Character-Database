<?php
    require_once("config.php");
?>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Elden Bees</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>

<h1>Elden Bees</h1>

<?php
    if (!empty($_SESSION["affected_rows"])) 
    {
        echo "Deleted " . $_SESSION["affected_rows"] . " rows";
        unset($_SESSION["affected_rows"]);
    }
?>

<h1>Order of Creation</h1>

<h2>Account</h2>
<?php
    $db = get_pdo_connection();
    $query = $db->prepare("SELECT * FROM Account");
    $query->execute();
    $rows = $query->fetchAll(PDO::FETCH_ASSOC);

    echo makeTable($rows);
    
    $insert_form = new PhpFormBuilder();
    $insert_form->set_att("method", "POST");
    $insert_form->add_input("Username:", array(
        "type" => "text"
    ), "insert_uname");
    $insert_form->add_input("Password", array(
        "type" => "text"
    ), "insert_pword");
    $insert_form->add_input("Insert", array(
        "type" => "submit",
        "value" => "Insert"
    ), "insertacc");
    $insert_form->build_form();

    if (isset($_POST["insertacc"])) 
    {
        if (!empty($_POST["insert_uname"]))
        {
            $unameToInsert = htmlspecialchars($_POST["insert_uname"]);
            echo "inserting $unameToInsert ...";
        }
        if (!empty($_POST["insert_pword"]))
        {
            $pwordToInsert = htmlspecialchars($_POST["insert_pword"]);
            echo "inserting $pwordToInsert ...";
        }

        $db = get_pdo_connection();
        $query = $db->prepare("INSERT INTO Account (Username, Password) values (?, ?)");
        $query->bindParam(1, $unameToInsert, PDO::PARAM_STR);
        $query->bindParam(2, $pwordToInsert, PDO::PARAM_STR);
        if ($query->execute())     
            header( "Location: " . $_SERVER['PHP_SELF']);
        else 
            echo "Error inserting: " . $db->errorInfo();
    }
?>

<h2>Equipment</h2>
<?php
    $db = get_pdo_connection();
    $query = $db->prepare("SELECT * FROM Equipment");
    $query->execute();
    $rows = $query->fetchAll(PDO::FETCH_ASSOC);

    echo makeTable($rows);
    
    $insert_form = new PhpFormBuilder();
    $insert_form->set_att("method", "POST");
    $insert_form->add_input("Item Name:", array(
        "type" => "text"
    ), "insert_iname");
    $insert_form->add_input("Type:", array(
        "type" => "text"
    ), "insert_itype");
    $insert_form->add_input("Weight (in lbs):", array(
        "type" => "number"
    ), "insert_iwgt");
    $insert_form->add_input("Damage (in dice):", array(
        "type" => "text"
    ), "insert_idmg");
    $insert_form->add_input("AC Bonus:", array(
        "type" => "number"
    ), "insert_iac");
    $insert_form->add_input("Item Description:", array(
        "type" => "text"
    ), "insert_idesc");
    $insert_form->add_input("Insert", array(
        "type" => "submit",
        "value" => "Insert"
    ), "inserteq");
    $insert_form->build_form();

    if (isset($_POST["inserteq"])) 
    {
        if (!empty($_POST["insert_iname"]))
        {
            $inameToInsert = htmlspecialchars($_POST["insert_iname"]);
            echo "inserting $inameToInsert ...";
        }
        if (!empty($_POST["insert_itype"]))
        {
            $itypeToInsert = htmlspecialchars($_POST["insert_itype"]);
            echo "inserting $itypeToInsert ...";
        }
        if (!empty($_POST["insert_iwgt"]))
        {
            $iwgtToInsert = htmlspecialchars($_POST["insert_iwgt"]);
            echo "inserting $iwgtToInsert ...";
        }
        if (!empty($_POST["insert_idmg"]))
        {
            $idmgToInsert = htmlspecialchars($_POST["insert_idmg"]);
            echo "inserting $idmgToInsert ...";
        }
        if (!empty($_POST["insert_iac"]))
        {
            $iacToInsert = htmlspecialchars($_POST["insert_iac"]);
            echo "inserting $iacToInsert ...";
        }
        if (!empty($_POST["insert_idesc"]))
        {
            $idescToInsert = htmlspecialchars($_POST["insert_idesc"]);
            echo "inserting $idescToInsert ...";
        }

        $db = get_pdo_connection();
        $query = $db->prepare("insert into Equipment (Eqpmnt_Name, Type, Weight, Damage, ACBonus, Description) values (?, ?, ?, ?, ?, ?)");
        $query->bindParam(1, $inameToInsert, PDO::PARAM_STR);
        $query->bindParam(2, $itypeToInsert, PDO::PARAM_STR);
        $query->bindParam(3, $iwgtToInsert, PDO::PARAM_INT);
        $query->bindParam(4, $idmgToInsert, PDO::PARAM_STR);
        $query->bindParam(5, $iacToInsert, PDO::PARAM_INT);
        $query->bindParam(6, $idescToInsert, PDO::PARAM_STR);
        if ($query->execute())     
            header( "Location: " . $_SERVER['PHP_SELF']);
        else 
            echo "Error inserting: " . $db->errorInfo();
    }
?>

<h2>Feats</h2>
<?php
    $db = get_pdo_connection();
    $query = $db->prepare("SELECT * FROM Feats");
    $query->execute();
    $rows = $query->fetchAll(PDO::FETCH_ASSOC);

    echo makeTable($rows);
    
    $insert_form = new PhpFormBuilder();
    $insert_form->set_att("method", "POST");
    $insert_form->add_input("Feat Name:", array(
        "type" => "text"
    ), "insert_fname");
    $insert_form->add_input("Feat Level", array(
        "type" => "number"
    ), "insert_flvl");
    $insert_form->add_input("Feat Desc:", array(
        "type" => "text"
    ), "insert_fdesc");
    $insert_form->add_input("Insert", array(
        "type" => "submit",
        "value" => "Insert"
    ), "insertft");
    $insert_form->build_form();

    if (isset($_POST["insertft"])) 
    {
        if (!empty($_POST["insert_fname"]))
        {
            $fnameToInsert = htmlspecialchars($_POST["insert_fname"]);
            echo "inserting $fnameToInsert ...";
        }
        if (!empty($_POST["insert_flvl"]))
        {
            $flvlToInsert = htmlspecialchars($_POST["insert_flvl"]);
            echo "inserting $flvlToInsert ...";
        }
        if (!empty($_POST["insert_fdesc"]))
        {
            $fdescToInsert = htmlspecialchars($_POST["insert_fdesc"]);
            echo "inserting $fdescToInsert ...";
        }

        $db = get_pdo_connection();
        $query = $db->prepare("insert into Feats (Ft_Name, Level, Description) values (?, ?, ?)");
        $query->bindParam(1, $fnameToInsert, PDO::PARAM_STR);
        $query->bindParam(2, $flvlToInsert, PDO::PARAM_INT);
        $query->bindParam(3, $fdescToInsert, PDO::PARAM_STR);
        if ($query->execute())     
            header( "Location: " . $_SERVER['PHP_SELF']);
        else 
            echo "Error inserting: " . $db->errorInfo();
    }
?>

<h2>Languages (gets error, but submits after refresh)</h2> <!-- Gets weird error about headers when submitting, but does submit -->
<?php
    $db = get_pdo_connection();
    $query = $db->prepare("SELECT * FROM Languages");
    $query->execute();
    $rows = $query->fetchAll(PDO::FETCH_ASSOC);

    echo makeTable($rows);
    
    $insert_form = new PhpFormBuilder();
    $insert_form->set_att("method", "POST");
    $insert_form->add_input("Language:", array(
        "type" => "text"
    ), "insert_lang");
    $insert_form->add_input("Insert", array(
        "type" => "submit",
        "value" => "Insert"
    ), "insertlng");
    $insert_form->build_form();

    if (isset($_POST["insertlng"])) 
    {
        if (!empty($_POST["insert_lang"]))
        {
            $langToInsert = htmlspecialchars($_POST["insert_lang"]);
            echo "inserting $langToInsert ...";
        }

        $db = get_pdo_connection();
        $query = $db->prepare("insert into Languages (Lang_Name) values (?)");
        $query->bindParam(1, $langToInsert, PDO::PARAM_STR);
        if ($query->execute())     
            header( "Location: " . $_SERVER['PHP_SELF']);
        else 
            echo "Error inserting: " . $db->errorInfo();
    }
?>

<h2>Spells (does not work)</h2> <!-- broken? not sure what problem is. -->
<?php
    $db = get_pdo_connection();
    $query = $db->prepare("SELECT * FROM Spells");
    $query->execute();
    $rows = $query->fetchAll(PDO::FETCH_ASSOC);

    echo makeTable($rows);
    
    $insert_form = new PhpFormBuilder();
    $insert_form->set_att("method", "POST");
    $insert_form->add_input("Name:", array(
        "type" => "text"
    ), "insert_splnm");
    $insert_form->add_input("Level:", array(
        "type" => "number"
    ), "insert_splvl");
    $insert_form->add_input("School:", array(
        "type" => "text"
    ), "insert_spsch");
    $insert_form->add_input("Range(feet):", array(
        "type" => "text"
    ), "insert_spran");
    $insert_form->add_input("Components(VSM):", array(
        "type" => "text"
    ), "insert_spco");
    $insert_form->add_input("Duration:", array(
        "type" => "text"
    ), "insert_spdu");
    $insert_form->add_input("Attack:", array(
        "type" => "text"
    ), "insert_spatk");
    $insert_form->add_input("Damage(Dice + DMG type):", array(
        "type" => "text"
    ), "insert_spdmg");
    $insert_form->add_input("Description:", array(
        "type" => "text"
    ), "insert_spdesc");
    $insert_form->add_input("Insert:", array(
        "type" => "submit",
        "value" => "Insert"
    ), "insertspll");
    $insert_form->build_form();

    if (isset($_POST["insertspll"])) 
    {
        if (!empty($_POST["insert_splnm"]))
        {
            $spnmToInsert = htmlspecialchars($_POST["insert_splnm"]);
            echo "inserting $spnmToInsert ...";
        }
        if (!empty($_POST["insert_splvl"]))
        {
            $splvlToInsert = htmlspecialchars($_POST["insert_splvl"]);
            echo "inserting $splvlToInsert ...";
        }
        if (!empty($_POST["insert_spsch"]))
        {
            $spschToInsert = htmlspecialchars($_POST["insert_spsch"]);
            echo "inserting $spschToInsert ...";
        }
        if (!empty($_POST["insert_spran"]))
        {
            $spranToInsert = htmlspecialchars($_POST["insert_spran"]);
            echo "inserting $spranToInsert ...";
        }
        if (!empty($_POST["insert_spco"]))
        {
            $spcoToInsert = htmlspecialchars($_POST["insert_spco"]);
            echo "inserting $spcoToInsert ...";
        }
        if (!empty($_POST["insert_spdu"]))
        {
            $spduToInsert = htmlspecialchars($_POST["insert_spdu"]);
            echo "inserting $spduToInsert ...";
        }
        if (!empty($_POST["insert_spatk"]))
        {
            $spatkToInsert = htmlspecialchars($_POST["insert_spatk"]);
            echo "inserting $spatkToInsert ...";
        }
        if (!empty($_POST["insert_spdmg"]))
        {
            $spdmgToInsert = htmlspecialchars($_POST["insert_spdmg"]);
            echo "inserting $spdmgToInsert ...";
        }
        if (!empty($_POST["insert_spdesc"]))
        {
            $spdescToInsert = htmlspecialchars($_POST["insert_spdesc"]);
            echo "inserting $spdescToInsert ...";
        }

        $db = get_pdo_connection();
        $query = $db->prepare("insert into Spells (Spell_Name, Level, School, Spell_Range, Components, Duration, Attack, Damage, Description) values (?, ?, ?, ?, ?, ?, ?, ?, ?)");
        $query->bindParam(1, $spnmToInsert, PDO::PARAM_STR);
        $query->bindParam(2, $splvlToInsert, PDO::PARAM_INT);
        $query->bindParam(3, $spschToInsert, PDO::PARAM_STR);
        $query->bindParam(4, $spranToInsert, PDO::PARAM_STR);
        $query->bindParam(5, $spcoToInsert, PDO::PARAM_STR);
        $query->bindParam(6, $spduToInsert, PDO::PARAM_STR);
        $query->bindParam(7, $spatkToInsert, PDO::PARAM_STR);
        $query->bindParam(8, $spdmgToInsert, PDO::PARAM_STR);
        $query->bindParam(9, $spdescToInsert, PDO::PARAM_STR);

        if ($query->execute())     
            header( "Location: " . $_SERVER['PHP_SELF']);
        else 
            echo "Error inserting: " . $db->errorInfo();
    }
?>

<h2>Feats</h2>
<?php
    $db = get_pdo_connection();
    $query = $db->prepare("SELECT * FROM Feats");
    $query->execute();
    $rows = $query->fetchAll(PDO::FETCH_ASSOC);

    echo makeTable($rows);
    
    $insert_form = new PhpFormBuilder();
    $insert_form->set_att("method", "POST");
    $insert_form->add_input("Feat Name:", array(
        "type" => "text"
    ), "insert_fname");
    $insert_form->add_input("Feat Level", array(
        "type" => "number"
    ), "insert_flvl");
    $insert_form->add_input("Feat Desc:", array(
        "type" => "text"
    ), "insert_fdesc");
    $insert_form->add_input("Insert", array(
        "type" => "submit",
        "value" => "Insert"
    ), "insertft");
    $insert_form->build_form();

    if (isset($_POST["insertft"])) 
    {
        if (!empty($_POST["insert_fname"]))
        {
            $fnameToInsert = htmlspecialchars($_POST["insert_fname"]);
            echo "inserting $fnameToInsert ...";
        }
        if (!empty($_POST["insert_flvl"]))
        {
            $flvlToInsert = htmlspecialchars($_POST["insert_flvl"]);
            echo "inserting $flvlToInsert ...";
        }
        if (!empty($_POST["insert_fdesc"]))
        {
            $fdescToInsert = htmlspecialchars($_POST["insert_fdesc"]);
            echo "inserting $fdescToInsert ...";
        }

        $db = get_pdo_connection();
        $query = $db->prepare("insert into Feats (Ft_Name, Level, Description) values (?, ?, ?)");
        $query->bindParam(1, $fnameToInsert, PDO::PARAM_STR);
        $query->bindParam(2, $flvlToInsert, PDO::PARAM_INT);
        $query->bindParam(3, $fdescToInsert, PDO::PARAM_STR);
        if ($query->execute())     
            header( "Location: " . $_SERVER['PHP_SELF']);
        else 
            echo "Error inserting: " . $db->errorInfo();
    }
?>
