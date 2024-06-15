<?php
define('Access', TRUE);
include "./AdditionalPHP/startSession.php";
?>

<!DOCTYPE html>
<html lang="en-MU">
<head>
    <meta charset="utf-8">
    <title>CardBuddies | KÉSZÍTS SAJÁT KÁRTYÁT</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="Common.css">
    <link rel="stylesheet" type="text/css" href="Atish.css">
    <script src="https://kit.fontawesome.com/0e16635bd7.js" crossorigin="anonymous"></script>
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
</head>

<body>
<?php $page = 'makeyourcard';?>
<?php include './Includes/MobileNavBar.php';?>

<?php include './Includes/PcNavBar.php';?>

        <!--Start Wave Image-->
        <div class="wave-image-group-media1200">
            <div class="wave-image-flip-media1200">
                <img src="Assets/images/1.index/NavBar_WaveWhiteThinFlip.png">
            </div>
        </div>
        <!--End Wave Image-->

        <!--Start Slideshow-->
        <div class="slideshow-container">

            <!-- Full-width képek számmal és felirat szöveggel -->
            <div class="mySlides fade">
            <img src="Assets/images/1.index/Slide_4.jpg" style="width:100%">
            <div class="text">Ahol a szenvedély és a gyűjtemény találkozik!</div>
            </div>
        
            <div class="mySlides fade">
            <img src="Assets/images/1.index/Slide_5.jpg" style="width:100%">
            <div class="text">Saját Kártya Készítés - Készítsd el a saját kártyáidat, és tedd különlegessé a gyűjteményed!</div>
            </div>

            <div class="mySlides fade">
            <img src="Assets/images/1.index/Slide_6.jpg" style="width:100%">
            <div class="text">Fedezd fel a jövő csillagait gyűjtsd a legújabb kártyákat!</div>
            </div>

        </div>

        <script src="Javascript/SlideshowAuto.js"></script>
        <!--End Slideshow -->

        <!--Start Wave Image-->
        <div class="wave-image-group">
            <div class="wave-image">
                <img src="Assets/images/1.index/NavBar_WaveWhite.png">
            </div>
        </div>
        <!--End Wave Image-->

        <!--Start Mit tudunk adni-->
        <div class="what-you-can-do">
            <div class="subtitle">
                <h2>KÜLÖNLEGES SZOLGÁLTATÁSUNK</h2>
            </div>

            <div class="row">

                <div class="column">
                    <span class="what-you-can-do-subtitle">Egyedi Gyártás</span>
                    <span class="what-you-can-do-text">Minden kártya, amit készítünk, egyedi műalkotás...</span>
                </div>

                <div class="column">
                    <span class="what-you-can-do-subtitle">Kiváló Minőségű Anyagok</span>
                    <span class="what-you-can-do-text">Csak a legjobb minőségű anyagokat és legmodernebb technikákat használjuk.</span>
                </div>

                <div class="column">
                    <span class="what-you-can-do-subtitle">Személyre Szabott Design</span>
                    <span class="what-you-can-do-text">Adj hozzá egy személyes érintést a kártyádhoz egyedi tervezéssel. Művészeink segítenek abban, hogy megvalósíthasd az egyedi ötleteidet.</span>
                </div>
                
            </div>
         </div>

        </div>
        <!--End Mit tudunk adni-->

        <!--Különleges ajánlat-->
        <section class="offer-section">
            <div class="offer-bg">
                <div class="offer-data">
                    <div class="subtitle">
                        <h2>AJÁNLATUNK</h2>
                    </div>
                        <p class="offer-data">Vedd fel velünk a kapcsolatot, és kezdjünk el dolgozni azon, hogy valóra váltsuk az elképzeléseidet. Lépj velünk kapcsolatba a <a href="mailto:CardBuddies.hungary@gmail.com?subject=Saját Kártya Rendelés">CardBuddies.hungary@gmail.com</a>címen, és hozzuk létre együtt azt a káryát, ami többet mond, mint ezer szó.</p>
                    </div>
                    <br><br>
                </div>
            </div>
        </section>
        <!--Különleges ajánlat vége-->

        <!--Start Wave Image-->
        <div class="wave-image-group">
            <div class="wave-image footer-wave">
                <img src="Assets/images/1.index/NavBar_WaveGrey.png">
            </div>
        </div>
        <!--End Wave Image-->

        <!--Start Footer-->
        <?php include './Includes/Footer.php';?>
        <!--End Footer-->

        
        <!-- Start Mobil Alsó Nav -->
        <?php include './Includes/MobileBottomNav.php';?>
        <!-- End Mobil Alsó Nav -->
</body>
</html>
