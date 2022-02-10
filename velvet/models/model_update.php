<?php
unset($_SESSION['add']);

require_once 'models/model_item.php';

$disc_id = '';
$disc_title = '';
$disc_year = '';
$artist_id = '';
$disc_label = '';
$disc_genre = '';
$disc_price = '';

if (isset($_POST['update'])) {

    $disc_title = $_POST['disc_title'];
    $disc_year = $_POST['disc_year'];
    $disc_label = $_POST['disc_label'];
    $artist_id = $_POST['artist_id'];
    $disc_genre = $_POST['disc_genre'];
    $disc_price = $_POST['disc_price'];
    $disc_id = $_POST['disc_id'];

    if (empty($disc_title)) {
        $_SESSION['message'] = "Saissisez le title!";
        $_SESSION['msg_type'] = "danger";
        header("Location: update_form.php?disc_id=" . $disc_id);

    } elseif (empty($disc_year)) {
        $_SESSION['message'] = "Saissisez l'année!";
        $_SESSION['msg_type'] = "danger";
        header("Location: update_form.php?disc_id=" . $disc_id);

    } elseif (empty($disc_label)) {
        $_SESSION['message'] = "Saissisez un libelé!";
        $_SESSION['msg_type'] = "danger";
        header("Location: update_form.php?disc_id=" . $disc_id);

    } elseif (empty($disc_genre)) {
        $_SESSION['message'] = "Saissisez un genre!";
        $_SESSION['msg_type'] = "danger";
        header("Location: update_form.php?disc_id=" . $disc_id);

    } elseif (empty($disc_price)) {
        $_SESSION['message'] = "Saissisez un prix!";
        $_SESSION['msg_type'] = "danger";
        header("Location: update_form.php?disc_id=" . $disc_id);

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

                    $queryUpdate = $db->prepare("UPDATE disc SET disc_title=?, disc_year=?, disc_label=?, artist_id=?, disc_genre=?, disc_price=?, disc_picture=? WHERE disc_id =?");
                    $queryUpdate->execute(array($disc_title, $disc_year, $disc_label, $artist_id, $disc_genre, $disc_price, $disc_pic, $disc_id));
                    $_SESSION['message'] = "Sauvegardé";
                    $_SESSION['msg_type'] = "success";
                    header("Location: update_form.php?disc_id=" . $disc_id);
                }

            } else {
                // Le type n'est pas autorisé, donc ERREUR
                $_SESSION['message'] = "Type de fichier non autorisé!";
                $_SESSION['msg_type'] = "danger";
                header("Location: update_form.php?disc_id=" . $disc_id);
            }

        } else {
            $queryUpdate = $db->prepare("UPDATE disc SET disc_title=?, disc_year=?, disc_label=?, artist_id=?, disc_genre=?, disc_price=? WHERE disc_id =?");
            $queryUpdate->execute(array($disc_title, $disc_year, $disc_label, $artist_id, $disc_genre, $disc_price, $disc_id));
            $_SESSION['message'] = "Sauvegardé";
            $_SESSION['msg_type'] = "success";
            header("Location: update_form.php?disc_id=" . $disc_id);
        }
    }
}

?>