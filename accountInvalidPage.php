<!DOCTYPE html>
<html lang="en-MU">
    <head>
        <meta charset="utf-8">
        <title>VINYLMASTER | ÉRVÉNYTELEN FIÓK</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--CSS File-->
        <link rel="stylesheet" type="text/css" href="Common.css">
        <link rel="stylesheet" type="text/css" href="Account.css">
        <!-- Font Awesome -->
        <script src="https://kit.fontawesome.com/0e16635bd7.js" crossorigin="anonymous"></script>
        <!--BOXICONOK-->
        <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
        <!-- ANIMÁLT CSS -->
        <link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    </head>

    <body>
        <?php $page = 'accountinvalidpage';?>

        <!--Start Navigation Bar-->
        <?php include './Includes/MobileNavBar.php';;?>
        <!--End Navigation Bar-->


        <!--Start Navigation Bar @media 1200px-->
        <?php include './Includes/PcNavBar.php';?>
        <!--End Navigation Bar @media 1200px-->


        <div class="mail-sent-group">
            <div class="mail-sent-container">
                <div class="mail-sent-image-container">
                    <div class="mail-sent-image mail-invalid-image"></div>
                </div>

                <div class="mail-sent-text">
                    <h1>Érvénytelen Email megerősítés.</h1>
                    <span class="message">A link lejárt, vagy nem másoltad le helyesen az URL-t.</span>
                    <br><br>
                    <div class="resend-button-container">
                        <span><a href="login.php"><button class="resend-button" name="resendLink">Jelentkezz be az újra küldéshez szükséges megerősítő link elküldéséhez</button></a></span>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>