<?php 
    define('Access', TRUE);
    include "./AdditionalPHP/startSession.php";
?>

<!DOCTYPE html>
<html lang="en-MU">
    <head>
        <meta charset="utf-8">
        <title>CardBuddies | RÓLUNK</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--CSS File-->   
        <link rel="stylesheet" type="text/css" href="Common.css">
        <link rel="stylesheet" type="text/css" href="Atish.css">
        <!-- Font Awesome -->
        <script src="https://kit.fontawesome.com/0e16635bd7.js" crossorigin="anonymous"></script>
        <!--BOXICONOK-->
        <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
        <!-- Animált CSS -->
        <link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    </head>

    <body>
        <?php $page = 'about';?>

        <!--Start Navigációs Sáv-->
        <?php include './Includes/MobileNavBar.php';?>
        <!--End Navigációs Sáv-->


        <!--Start Navigációs Sáv @media 1200px-->
        <?php include './Includes/PcNavBar.php';?>
        <!--End Navigációs Sáv @media 1200px-->


        <!--Start Fejléc-->
        <div class="about-us-header">
            <div class="banner-group">
                <div class="banner"></div>
            </div>
            
            <div class="about-us-subtitle">
                <span>RÓLUNK</span>
            </div>
        </div>
        <!--End Fejléc-->

        <!--Start Mester Info-->
        <div class="baker-info-group">
        <div class="baker-info-container">
            <div class="baker-info-text">
                <div class="baker-info-title">
                   <span>Mesterünk</span>
                </div>
        
                <div class="baker-name">
                    <span>KÖLES KATA</span>
                </div>
        
                <div class="baker-description">
                    <p>
                        „Pelé - 1000. gól, Diego Maradona - '86-os világbajnokság, Zinedine Zidane - Fejjelés, Lionel Messi - 91 gól egy évben, Cristiano Ronaldo - Ollózós gól, David Beckham - Szabadrúgás Görögország ellen, Kylian Mbappé - 2018-as világbajnoki mesterhármas. Történelmi pillanatok.”</p>
                </div>
        
                <div class="baker-signature">
                    <div class="signature-photo"></div>
                </div>
        
                <div class="baker-position">
                    <span>CEO - CARDBUDDIES Kártyabolt</span>
                </div>
            </div>
                
            <div class="baker-photo-group">
                <div class="baker-photo"></div>
            </div>
        </div>
    </div>
    <!--End Mester Info-->



    </body>
</html>