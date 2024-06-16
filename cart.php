<?php
define('Access', TRUE);

//SESSION START
include "./AdditionalPHP/startSession.php";

//KAPCSOLÓDÁS AZ ADATBÁZISHOZ : CARDBUDDIES
include_once 'connection.php';
?>

<?php
//Törlés gomb
//A törlés gomb ugyanazt az oldalt tölti be, de további információt ad az URL-ben
//cart.php?action=delete&product_id=<?php echo ...
//leellenőrzi, hogy az URL tartalmaz-e action=delete
if (filter_input(INPUT_GET, 'action') == 'delete') {
    //loop az összes termék a bevásárló kosárban session-tömbben amíg az id nem egyezik a url-vel
    foreach ($_SESSION['shopping_cart'] as $key => $product) {

        //Ellenőrzi, hogy az URL-ben található termék azonosítója (amikor a törlés gombra kattintanak) egyezik-e eggyel a bevásárló kosár session tömbjéből
        if ($product['id'] == filter_input(INPUT_GET, 'product_id')) {
            //törli az elemet a session tömbből
            unset($_SESSION['shopping_cart'][$key]);
        }
    }

    //session tömb kulcsainak visszaállítása, hogy egyezzenek a $product_ids számokat tartalmazó tömb kulcsaival
    $_SESSION['shopping_cart'] = array_values($_SESSION['shopping_cart']);

    //SOR TÖRLÉSE A CARTITEM TÁBLÁBÓL
    $Q_delete_cartitem = 'DELETE FROM cartitem WHERE productID = ' . filter_input(INPUT_GET, 'product_id');
    $run_delete_cartitem = mysqli_query($conn, $Q_delete_cartitem);

}
?>

<html>
<head>
    <meta charset="utf-8">
    <title>CARDBUDDIES | Részletek</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!--========== PHP KAPCSOLAT LÉTREHOZÁSA AZ ADATBÁZIOSSAL: CARDBUDDIES ==========-->
    <?php

    include_once 'numOfItemsInCart.php';
    ?>

    <!--========== CSS FILES ==========-->
    <link rel="stylesheet" type="text/css" href="Common.css">
    <link rel="stylesheet" type="text/css" href="Sanjana.css">

    <link href="jquery.nice-number.css" rel="stylesheet">
    <!--========== JQUERY CDN ==========-->
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>

    <script src="jquery.nice-number.js"></script>
    <script type="text/javascript">
        $(function () {
            $('input[type="number"]').niceNumber();
        });
    </script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/0e16635bd7.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
<body>
<!--========== PHP QUERIK ==========-->
<?php

$Q_fetch_featured = "SELECT * FROM products INNER JOIN product_type ON products.productID = product_type.productID WHERE product_type.typeID = 2"; //selects featured products
$Q_fetch_new = "SELECT * FROM products INNER JOIN product_type ON products.productID = product_type.productID WHERE product_type.typeID = 1"; //selects new products
$Q_fetch_product_details = "SELECT * FROM products INNER JOIN product_type ON products.productID = product_type.productID WHERE product_type.typeID = 2"; //selects product with id =1
$Q_fetch__all_products = "SELECT * FROM products";

?>


<!--========== HEADER ==========-->
<?php $page = 'cart' ?>

<!--Start Navigation Bar-->
<?php include './Includes/MobileNavBar.php'; ?>
<!--End Navigation Bar-->


<!--Start Navigation Bar @media 1200px-->
<?php include './Includes/PcNavBar.php'; ?>
<!--End Navigation Bar @media 1200px-->




<!--Start Footer-->
<?php include './Includes/Footer.php'; ?>
<!--End Footer-->


<!-- Start Bottom Nav -->
<?php include './Includes/MobileBottomNav.php'; ?>
<!-- End Bottom Nav -->

<!-- <script src="Javascript\main.js?<?php //echo filemtime('Javascript\main.js'); ?>" ></script> -->
</body>
</html>
