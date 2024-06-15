<?php
define('Access', TRUE);
include "./AdditionalPHP/startSession.php";
?>

<!DOCTYPE html>
<html lang="en-MU">
<head>
    <meta charset="utf-8">
    <title>VINYLMASTER | Termékek</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <?php
    include_once 'connection.php';
    include_once 'numOfItemsInCart.php';
    ?>
    <link rel="stylesheet" type="text/css" href="Common.css">
    <link rel='stylesheet' type='text/css' href='Sanjana.css'/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/0e16635bd7.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>


<?php
$Q_fetch_categories = "SELECT * FROM nationality";
?>

<?php $page = 'products' ?>
<?php include './Includes/MobileNavBar.php'; ?>
<?php include './Includes/PcNavBar.php';?>


<main class="1-main">
    <section class="featured section" id="featured">
        <?php
        $result_cat = mysqli_query($conn, $Q_fetch_categories);
        ?>
        <div class="row category-title">
            <div class="col">
                <h2 class="category" id="small_title"></h2>
                <h2 class="category-name " id="big_title"></h2>
            </div>
            <div class="dropdown col-auto">
                <button class="dropbtn button" id="cat-but">Rendezés &nbsp<i class='bx bxs-down-arrow drop-arrow'></i>
                </button>
                <div class="dropdown-content">
                    <a href="#" onclick="sortby_products(1)">Ár szerint növekvő</a>
                    <a href="#" onclick="sortby_products(2)">Ár szerint csökkenő</a>
                </div>
            </div>

            <div class="dropdown col-auto">
                <button class="dropbtn button" id="cat-but">Kategóriák &nbsp<i class='bx bxs-down-arrow drop-arrow'></i>
                </button>
                <div class="dropdown-content">
                    <?php
                    while ($row_categories = mysqli_fetch_assoc($result_cat)) {
                        $categoryID = $row_categories['nationalityID'];
                        $p_cat_name = $row_categories['p_nat_name'];
                        ?>
                        <a href="#"
                           onclick="display_products_by_cat_id(<?php echo $categoryID; ?>, '<?php echo $p_cat_name; ?>'); "><?php echo $p_cat_name; ?></a>
                        <?php
                    }
                    ?>
                </div>
            </div>
        </div>
        <div id="result" class="featured__container bd-grid mt-4">

        </div>
    </section>

    <section class="offer section">
        <div class="offer__bg">
            <div class="offer__data">
                <h2 class="offer__title">Akció!</h2>
                <p class="offer__description">Különleges ajánlat csak ebben a hónapban!</p>

                <a href="#" class="button button__round">VÁSÁRLÁS</a>
            </div>
        </div>
    </section>

    <section class="new section" id="new">
        <div class="row category-title">
            <div class="col">
                <h2 class="category" id="small_title2"></h2>
                <h2 class="category-name " id="big_title2"></h2>
            </div>
        </div>

        <div class="new__container bd-grid" id="result2">
        </div>
    </section>

    <?php include './Includes/Footer.php';?>

    <?php include './Includes/MobileBottomNav.php';?>

    <script>

        function display_products_by_cat_id(cat_id, cat_name) {
            var xhttp;
            //AJAX
            console.log('entered ajax');
            xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    console.log('ready');
                    document.getElementById("result").innerHTML = this.responseText;
                }
            };
            xhttp.open("GET", "category_search.php?cat_id=" + cat_id, true);
            xhttp.send();
            console.log('sent');

            document.getElementById('small_title').innerHTML = 'KATEGÓRIA';
            document.getElementById('big_title').innerHTML = cat_name;

        }

        function sortby_products(sort_num) {
            var xhttp;
            //AJAX
            console.log('entered ajax sortby');
            xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    console.log('ready sortby');
                    document.getElementById("result").innerHTML = this.responseText;
                }
            };
            xhttp.open("GET", "sortby_search.php?sortby=" + sort_num, true);
            xhttp.send();
            console.log('sent sortby');
            document.getElementById('small_title').innerHTML = 'ÁR SZERINT RENDEZVE';
            if (sort_num == 1) {
                document.getElementById('big_title').innerHTML = 'növekvő';
            } else if (sort_num == 2) {
                document.getElementById('big_title').innerHTML = 'csökkenő';
            }
        }

        function display_products_by_type(p_type) {
            var xhttp;

            console.log('entered ajax');
            xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    console.log('ready');
                    document.getElementById("result").innerHTML = this.responseText;
                }
            };
            xhttp.open("GET", "products_by_type_search.php?p_type=" + p_type, true);
            xhttp.send();
            console.log('sent');
            if (p_type == 1) {
                document.getElementById('small_title').innerHTML = 'új';
            } else if (p_type == 2) {
                document.getElementById('small_title').innerHTML = 'kiválasztott';
            } else if (p_type == 3) {
                document.getElementById('small_title').innerHTML = 'értékesítések';
            } else if (p_type == 4) {
                document.getElementById('small_title').innerHTML = 'best-seller';
            }
            document.getElementById('big_title').innerHTML = 'TERMÉKEK';
        }

        function display_products_by_type_second(p_type) {
            var xhttp;
            console.log('entered ajax');
            xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    console.log('ready');
                    document.getElementById("result2").innerHTML = this.responseText;
                }
            };
            xhttp.open("GET", "products_by_type_search.php?p_type=" + p_type, true);
            xhttp.send();
            console.log('sent');
            if (p_type == 1) {
                document.getElementById('small_title2').innerHTML = 'új';
            } else if (p_type == 2) {
                document.getElementById('small_title2').innerHTML = 'kiválasztott';
            } else if (p_type == 3) {
                document.getElementById('small_title2').innerHTML = 'értékesítések';
            } else if (p_type == 4) {
                document.getElementById('small_title2').innerHTML = 'best-seller';
            }
            document.getElementById('big_title2').innerHTML = 'TERMÉKEK';
        }
        display_products_by_type(2);
        display_products_by_type_second(1);
    </script>
</body>
</html>