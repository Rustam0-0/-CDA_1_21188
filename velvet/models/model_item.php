<?php
    $db = new PDO('mysql:host=localhost;charset=utf8;dbname=record', 'root', 'root');
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $requete = $db->prepare("SELECT * FROM disc JOIN artist ON artist.artist_id = disc.artist_id where disc_id=?");
    $requete->execute(array($_GET["disc_id"]));
    $item = $requete->fetch(PDO::FETCH_OBJ);
?>  