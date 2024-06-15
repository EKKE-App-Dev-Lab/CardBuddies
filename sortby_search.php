<?php
define('Access', TRUE);
include "./AdditionalPHP/startSession.php";
include_once 'connection.php';
//include_once 'numOfItemsInCart.php';

$Q_sortby_price_asc = "SELECT * FROM products ORDER BY ar ASC; ";
$Q_sortby_price_desc = "SELECT * FROM products ORDER BY ar DESC; ";

if($_REQUEST['sortby']==1){
    $result_sortby =mysqli_query($conn, $Q_sortby_price_asc);
}
elseif($_REQUEST['sortby']==2){
    $result_sortby =mysqli_query($conn, $Q_sortby_price_desc);
}

while($row_product = mysqli_fetch_assoc($result_sortby)){
    $product_id = $row_product['productID'];


    echo '   <div class="featured__products" id="product__card">
                   <div class="featured__box">
                       <div class="featured__new">ÚJ</div>
                       <div class=""><a href="product.php?product_id='.$product_id.' "><i class="bx bxs-cart-add bx-tada-hover featured__new_cart"></i></a></div>
                       <a href="product.php?product_id='.$product_id.'" >
                           <img src="'.$row_product['kartyakep'].'" alt="" class="featured__img avoid__clicks"
                           style="
                               object-fit: cover;
                               width:  232px;
                               height: 232px;" />
                       </a>
                   </div>
                   <div class="featured__data">
                       <a href="product.php?product_id='.$product_id.'" class="product__name" id="product__name"style="text-decoration: none;">'.$row_product['jatekosnev'].'</a></br>
                       <span class="featured__price">'.$row_product['ar'].' Ft</span>
                   </div>
               </div> ';
}
?>