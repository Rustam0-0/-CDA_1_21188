<?php
    include 'header.php' ;
    require_once 'models/model_list.php';
?>


    <div id="results" class="container-fluid py-5">
        <?php 
            foreach ($tableau as $disc): 
        ?>
            <article class="card results_product_item flex-row flex-wrap">
                <div class="col-lg-6 col-sm-12 p-2">
                    <a
                        href="details.php?disc_id=<?= $disc->disc_id ?>"
                        class="results_product_item_image_container" title="">
                        <img src="pictures/<?= $disc->disc_picture ?>" 
                            alt="<?= $disc->disc_picture ?>" 
                            class="img-fluid results_product_item_image lazyload" width="300"
                        />
                    </a>
                </div>
                <div class="col-lg-6 col-sm-12 px-2">
                    <span style="font-size:18px"><b><?= $disc->disc_title ?></b></span> <br>
                    <span style="font-size:14px"><b><?= $disc->artist_name ?></b><br>
                    <b>Label:</b> <?= $disc->disc_label ?> <br>
                    <b>Year:</b> <?= $disc->disc_year ?> <br>
                    <b>Genre:</b> <?= $disc->disc_genre ?> </span> <br><br><br>
                    <p class="card-text"><a href="details.php?disc_id=<?= $disc->disc_id ?>" class="btn btn-primary">Détails</a></p>


                    <!-- <h4 class="card-title"><?= $disc->disc_title ?></h4>
                    <p class="card-text"><strong><?= $disc->artist_name ?></strong></p>
                    <p class="card-text"><strong>Label :</strong> <?= $disc->disc_label ?> </p>
                    <p class="card-text"><strong>Year :</strong> <?= $disc->disc_year ?> </p>
                    <p class="card-text"><strong>Genre :</strong> <?= $disc->disc_genre ?> </p>
                    <p class="card-text"><a href="details.php?disc_id=<?= $disc->disc_id ?>" class="btn btn-primary">Détails</a></p> -->
                </div>
            </article>
        <?php 
            endforeach; 
        ?>
    </div>

        <!-- <?php 
            // foreach ($tableau as $disc): 
        ?>
            <div class="col-sm-6 pb-2">
                <div class="card flex-row flex-wrap p-2">
                    <div class="card-header border-0">
                        <a
                            href="details.php?disc_id=<?= $disc->disc_id ?>"
                            class="results_product_item_image_container" title="">
                            <img src="pictures/<?= $disc->disc_picture ?>" 
                                alt="<?= $disc->disc_picture ?>" 
                                class="img-fluid results_product_item_image lazyload" width="300"
                            />
                        </a>
                    </div>
                    <div class="card-block px-2">
                        <h4 class="card-title"><?= $disc->disc_title ?></h4>
                        <p class="card-text"><strong><?= $disc->artist_name ?></strong></p>
                        <p class="card-text"><strong>Label :</strong> <?= $disc->disc_label ?> </p>
                        <p class="card-text"><strong>Year :</strong> <?= $disc->disc_year ?> </p>
                        <p class="card-text"><strong>Genre :</strong> <?= $disc->disc_genre ?> </p>
                    </div>
                </div>
            </div>
        <?php 
            // endforeach; 
        ?> -->

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>

</html>