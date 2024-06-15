<?php
define('Access', TRUE);
include "./AdditionalPHP/startSession.php";

include_once 'connection.php';
include_once 'numOfItemsInCart.php';

$cat_id = $_REQUEST['cat_id'];
$Q_fetch_product_by_cat_id = "SELECT * FROM products INNER JOIN product_nationality ON products.productID = product_nationality.productID WHERE product_nationality.nationalityID = '$cat_id'";

$run_get_product_by_cat_id = mysqli_query($conn, $Q_fetch_product_by_cat_id);
while ($row_product = mysqli_fetch_assoc($run_get_product_by_cat_id)) {
    $product_id = $row_product['productID'];

    echo ' <div class="featured__products" id="product__card">
                                <div class="featured__box">
                                    <div class="featured__new">ÚJ</div>
                                    <div class=""><a href="product.php?product_id=' . $product_id . ' "><i class="bx bxs-cart-add bx-tada-hover featured__new_cart"></i></a></div>
                                    <a href="product.php?product_id=' . $product_id . ' " >
                                                <img src="' . $row_product['kartyakep'] . ' " alt="" class="featured__img avoid__clicks"
                                                style="
                                                    object-fit: cover;
                                                    width:  232px;
                                                    height: 232px;" />
                                            </a>
                                </div>

                            <div class="featured__data">';

    $product_id = $row_product['productID'];
    echo '<a href="product.php?product_id=' . $product_id . ' " class="product__name" id="product__name"style="text-decoration: none;">' . $row_product['csapat'] . '</a></br>
                            <span class="featured__price"> ' . $row_product['ar'] . ' Ft</span>
                                
                            </div>
                            </div>';
}
?>


