<?php

session_start();

$mysqli = new mysqli('localhost', 'root', 'root', 'record') or die(mysqli_error($mysqli));

// $update = false;
$disc_id = 0;
$disc_title = '';
$disc_year = '';
$disc_picture = '';
$disc_label = '';
$disc_genre = '';
$disc_price = '';

if (isset($_POST['update'])) {

    $disc_title = $_POST['title'];
    $disc_year = $_POST['year'];
    $disc_label = $_POST['label'];
    $disc_genre = $_POST['genre'];
    $disc_price = $_POST['price'];

    $disc_picture = $_POST['picture'];

    
    // if(isset($_POST['part_prof'])) { $part_ou_prof = $_POST['part_prof']; }
  
    if (empty($disc_title)) {
        $_SESSION['message'] = "Saissisez le title!";
        $_SESSION['msg_type'] = "danger";
    }
    elseif (empty($disc_year)) {
        $_SESSION['message'] = "Saissisez l'année!";
        $_SESSION['msg_type'] = "danger";

    }
    elseif (empty($disc_label)) {
        $_SESSION['message'] = "Saissisez un libelé!";
        $_SESSION['msg_type'] = "danger";
    }
    elseif (empty($disc_genre)) {
        $_SESSION['message'] = "Saissisez un genre!";
        $_SESSION['msg_type'] = "danger";
    }
    elseif (empty($disc_price)) {
        $_SESSION['message'] = "Saissisez un prix!";
        $_SESSION['msg_type'] = "danger";
    }
    else {        
        $mysqli->query("INSERT INTO disc (disc_title, disc_year, disc_label, disc_genre, disc_price) 
        VALUES('$disc_title', '$disc_year', '$disc_label', '$disc_genre', '$disc_price')")
        or die($mysqli->error);

        $_SESSION['message'] = "Sauvegardé";
        $_SESSION['msg_type'] = "success";
    }
}

if (isset($_GET['delete'])){
    $id = $_GET['delete'];
    $mysqli->query("DELETE FROM disc WHERE disc_id = $disc_id") or die($mysqli->error());

    $_SESSION['message'] = "Supprimé";
    $_SESSION['msg_type'] = "danger";
}

?>