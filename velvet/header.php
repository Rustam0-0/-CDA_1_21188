<?php
error_reporting(E_ALL);
ini_set("display_errors", 1);
?>
<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="style.css">
    <title>velvet</title>
</head>

<body class="body">
    <?php 

        // var_dump($_POST);
    ?>
    <div class="top">
        <h1><a class="logo" href="index.php">Velvet Record</a></h1>
        <h2><a class="add_pro btn btn-lg" href="add_prod_form.php">Ajouter un produit</a></h2>
    </div>

    <?php
    session_start();
    if (isset($_SESSION['message'])) : ?>

        <div class="alert alert-<?= $_SESSION['msg_type'] ?>">

            <?php
            echo $_SESSION['message'];
            unset($_SESSION['message']);
            ?>
        </div>
    <?php endif ?>
