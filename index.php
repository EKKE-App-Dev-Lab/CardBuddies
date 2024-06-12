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
    </body>
</html>