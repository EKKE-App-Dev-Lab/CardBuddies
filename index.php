<?php 
    define('Access', TRUE);
    include "./AdditionalPHP/startSession.php";
?>

<!DOCTYPE html>
<html lang="en-MU">
    <head>
        <meta charset="utf-8">
        <title>CardBuddies | KEZDŐOLDAL</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <link rel="stylesheet" type="text/css" href="Common.css">
        <link rel="stylesheet" type="text/css" href="Atish.css">
        
        <script src="https://kit.fontawesome.com/0e16635bd7.js" crossorigin="anonymous"></script>
       
        <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
        <script src="Javascript/swapWaveImg.js"></script>
        
        <script src = "Javascript/countdown_sales.js"></script>
    </head>

    <body>
        <?php $page = 'index'?>

        <!--Start Navigációs Sáv-->
        <?php include './Includes/MobileNavBar.php';?>
        <!--End Navigációs Sáv-->


        <!--Start Navigációs Sáv @media 1200px-->
        <?php include './Includes/PcNavBar.php';?>
        <!--End Navigációs Sáv @media 1200px-->

        <!--Start Slideshow-->
        <div class="slideshow-container">

            <!-- Full-width képek számmal és felirat szöveggel -->
            <div class="mySlides fade">
            <img src="Assets/images/1.index/Slide_1.jpg" style="width:100%">
            <div class="text">"MERT FOCI NÉLKÜL ÜRES AZ ÉLET!"</div>
            </div>
        
            <div class="mySlides fade">
            <img src="Assets/images/1.index/Slide_2.jpg" style="width:100%">
            <div class="text">"MINDEN KÁRTYA VALAMI KÜLÖNLEGESET REJT!"</div>
            </div>
        
            <div class="mySlides fade">
            <img src="Assets/images/1.index/Slide_3.jpg" style="width:100%">
            <div class="text">"EGY KLASSZIKUS JÁTÉKOS KÁRTYÁJÁNAK ÉRTÉKE SOHA NEM CSÖKKEN."</div>
            </div>
            
        </div>

        <script src="Javascript/SlideshowAuto.js"></script>
        <!--End Slideshow -->

        <!--Különleges ajánlat-->
        <section class="offer-section">
            <div class="offer-bg">
                <div class="offer-data">
                    <div class="subtitle">
                        <h2>KÜLÖNLEGES AJÁNLAT</h2>
                    </div>
                    <p class="offer-description">Nyárindító ajánlatunk véget ér: </p>
                    <p class="offer-description" id="countdown" style="font-family: Old Standard TT; font-size: 2rem;">AJÁNLAT VÉGE</p>

                    <div class="subscribe-button-container">
                        <a href="products.php"><button class="subscribe-button" name="subscribe">VÁSÁROLJ MOST</button></a>
                    </div>
                </div>
            </div>
        </section>
        <!--Különleges ajánlat vége-->

        <!--Start Rendelés lépései-->
        <div class="how-to-order">
            <div class="subtitle">
                <h2 class="order-subtitle">MEGRENDELÉS MENETE</h2>
            </div>
            <div class="row" style="color: #1a73e8;">
                <div class="column">
                  <i class="fas fa-solid fa-record-vinyl"></i>
                  <p><b>Válaszd ki a kártyát</b></p>
                </div>
                <div class="column">
                  <i class="fas fa-cart-plus"></i>
                  <p><b>Add hozzá a kosaradhoz</b></p>
                </div>
                <div class="column">
                  <i class="fas fa-money-check-alt"></i>
                  <p><b>Megrendelés és fizetés</b></p>
                </div>
                 <div class="column">
                 <i class="fas fa-box-open"></i>
                 <p><b>Rendelésfeldolgozás</b></p>
                </div>
                  <div class="column">
                  <i class="fas fa-shipping-fast"></i>
                  <p><b>Kiszállítás</b></p>
                </div>
            </div>
         </div>
        <!--End Rendelés lépései-->
        
    </body>
</html>