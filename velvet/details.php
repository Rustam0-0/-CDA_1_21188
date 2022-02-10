<?php include 'header.php' ?>

    <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="POST">
        <?php require_once 'models/model_item.php'; ?>

        <h2><b>Details</b></h2>

        <div class="container-fluid d-flex flex-wrap ">
            <div class="col-lg-6 col-sm-12">
                <div class="form-group">
                    <label>Title</label>
                    <input value="<?= $item->disc_title ?>" class="form-control" type="text" disabled >
                </div>
                <div class="form-group">
                    <label>Year</label>
                    <input value="<?= $item->disc_year ?>" class="form-control" type="text" disabled>
                </div>
                <div class="form-group">
                    <label>Label</label>
                    <input value="<?= $item->disc_label ?>" class="form-control" type="text" disabled>
                </div>
            </div>
            <div class="col-lg-6 col-sm-12">
                <div class="form-group">
                    <label>Artist</label>
                    <input value="<?= $item->artist_name ?>" class="form-control" type="text" disabled>
                </div>
                <div class="form-group">
                    <label>Genre</label>
                    <input value="<?= $item->disc_genre ?>" class="form-control" type="text" disabled>
                </div>
                <div class="form-group">
                    <label>Price</label>
                    <input value="<?= $item->disc_price ?>" class="form-control" type="text" disabled>
                </div>
            </div>
        </div>

        <label>Picture</label>
        <p class="img img-fluid"><img src="pictures/<?= $item->disc_picture ?>" width="400" alt="pictures/<?= $item->disc_picture ?>"></p>

        <div class="justify-content-between">
            <a class="btn my-2 btn-secondary" href="index.php" role="button">Retour</a>
            <a class="btn my-2 btn-warning" name="" href="update_form.php?disc_id=<?= $item->disc_id ?>" role="button">Modifier</a>
            <a class="btn my-2 btn-danger" href="delete.php" role="button">Supprimer</a>
        </div>
    </form><br>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>

</html>