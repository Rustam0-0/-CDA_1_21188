
<?php
    try 
    {        
        $db = new PDO('mysql:host=localhost;charset=utf8;dbname=record', 'root', 'root');
        $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    } catch (Exception $e) {
        echo "Erreur : " . $e->getMessage() . "<br>";
        echo "N° : " . $e->getCode();
        die("Fin du script");
    }       
unset($_SESSION['add']);
    $requete = $db->query("SELECT * FROM disc JOIN artist ON artist.artist_id = disc.artist_id");
    $tableau = $requete->fetchAll(PDO::FETCH_OBJ);
    $requete->closeCursor();
?>