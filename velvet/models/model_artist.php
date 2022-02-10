<?php
    $db = new PDO('mysql:host=localhost;charset=utf8;dbname=record', 'root', 'root');
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $requete = $db->prepare("SELECT DISTINCT artist_name, artist.artist_id  FROM artist order by artist.artist_name");
    $requete->execute();
    $artist = $requete->fetchAll(PDO::FETCH_OBJ);
    // var_dump($artist);
?>