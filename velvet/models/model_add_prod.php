<?php
    $db = new PDO('mysql:host=localhost;charset=utf8;dbname=record', 'root', 'root');
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $requete = $db->prepare("SELECT * FROM disc");
    // $requete->execute(array($_GET["disc_id"]));
    // $item = $requete->fetch(PDO::FETCH_OBJ);

//require_once 'models/model_artist.php';
if(!empty($_POST['artist_name'])){


$querArtist = $db->prepare("SELECT artist_id FROM artist where artist_name =?");
$querArtist->execute(array($_POST['artist_name']));
$rowPost = $querArtist->fetch(PDO::FETCH_OBJ);
$artist_id = $rowPost->artist_id;
}

// $disc_id = '';
$disc_title = '';
$disc_year = '';
$artist_id = '';
$disc_label = '';
$disc_genre = '';
$disc_price = '';

if (isset($_POST['add'])) {

    $_SESSION['add']= $_POST;
    $disc_title = $_POST['disc_title'];
    $disc_year = $_POST['disc_year'];
    $disc_label = $_POST['disc_label'];
  
    $disc_genre = $_POST['disc_genre'];
    $disc_price = $_POST['disc_price'];
    // $disc_id = $_POST['disc_id'];

    if (empty($disc_title)) {
        $_SESSION['message'] = "Saissisez le title!";
        $_SESSION['msg_type'] = "danger";
        header("Location: add_prod_form.php?disc_id=");

    } elseif (empty($disc_year)) {
        $_SESSION['message'] = "Saissisez l'année!";
        $_SESSION['msg_type'] = "danger";
        header("Location: add_prod_form.php?disc_id=");

    } elseif (empty($disc_label)) {
        $_SESSION['message'] = "Saissisez un libelé!";
        $_SESSION['msg_type'] = "danger";
        header("Location: add_prod_form.php?disc_id=");

    } elseif (empty($disc_genre)) {
        $_SESSION['message'] = "Saissisez un genre!";
        $_SESSION['msg_type'] = "danger";
        header("Location: add_prod_form.php?disc_id=");

    } elseif (empty($disc_price)) {
        $_SESSION['message'] = "Saissisez un prix!";
        $_SESSION['msg_type'] = "danger";
        header("Location: add_prod_form.php?disc_id=");

    } else {
        if (!empty($_FILES["pic"]["tmp_name"])) {
            // On met les types autorisés dans un tableau (ici pour une image)
            $aMimeTypes = array("image/gif", "image/jpeg", "image/jpg", "image/pjpeg", "image/png", "image/x-png", "image/tiff");

            // On extrait le type du fichier via l'extension FILE_INFO
            $finfo = finfo_open(FILEINFO_MIME_TYPE);
            $mimetype = finfo_file($finfo, $_FILES["pic"]["tmp_name"]);
            finfo_close($finfo);

            if (in_array($mimetype, $aMimeTypes)) {
                /* Le type est parmi ceux autorisés, donc OK, on va pouvoir
                déplacer et renommer le fichier */
                $disc_pic = $_FILES["pic"]["name"];
                if (move_uploaded_file($_FILES["pic"]["tmp_name"], "pictures/" . $_FILES["pic"]["name"])) {

                    $queryInsert = $db->prepare("INSERT INTO disc (disc_title, disc_year, disc_label, artist_id, disc_genre, disc_price, disc_picture)
                    VALUES (?,?,?,?,?,?,?)");
                    $queryInsert->execute(array($disc_title, $disc_year, $disc_label, $artist_id, $disc_genre, $disc_price, $disc_pic));
                    $_SESSION['message'] = "Le produit a été ajouté";
                    $_SESSION['msg_type'] = "success";
                    $_SESSION['add']="";

                    header("Location: add_prod_form.php");  
                    // var_dump($_POST);              
                }

            } else {
                // Le type n'est pas autorisé, donc ERREUR
                $_SESSION['message'] = "Type de fichier non autorisé!";
                $_SESSION['msg_type'] = "danger";
                header("Location: add_prod_form.php");
            }

        } else {
            $queryInsert = $db->prepare("INSERT INTO disc (disc_title, disc_year, disc_label, artist_id, disc_genre, disc_price)
            VALUES (?,?,?,?,?,?)");
            $queryInsert->execute(array($disc_title, $disc_year, $disc_label, $artist_id, $disc_genre, $disc_price));
            $_SESSION['message'] = "Le produit a été ajouté";
            $_SESSION['msg_type'] = "success";
            $_SESSION['add']="";

            header("Location: add_prod_form.php");        
        }
    }
}

?>