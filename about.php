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

    <!--Start Kitüntetések-->
    <div class="award-section">
        <div class="award-title">
            <span>Kitüntetéseink</span>
        </div>

        <div class="subtitle">
            <h2>DÍJNYERTES</h2>
        </div>

        <div class="award-badge-container">
             <div class="award-badge-group">
                <div class="badge badge1">
                    <div class="badge-photo-group">
                        <div class="badge-photo"></div>
                    </div>
                        
                    <div class="badge-info">
                        <span class="badge-title">AZ ÉV KÁRTYABOLTJA</span>
                        <span class="badge-date">2010-2011</span>
                        <p class="badge-description">Legtöbb eladott minőségi gyűjthető kártya Magyarországon!</p>
                    </div>
                </div>
            </div>
    
            <div class="award-badge-group">
                <div class="badge badge2">
                    <div class="badge-photo-group">
                        <div class="badge-photo"></div>
                    </div>
                        
                    <div class="badge-info">
                        <span class="badge-title">A ÉV KÁRTYABOLTJA</span>
                        <span class="badge-date">2015-2016</span>
                        <p class="badge-description">Legtöbb eladott minőségi gyűjthető kártya Magyarországon!</p>
                    </div>
                </div>
            </div>
    
            <div class="award-badge-group">
                <div class="badge badge3">
                    <div class="badge-photo-group">
                        <div class="badge-photo"></div>
                    </div>
                        
                    <div class="badge-info">
                        <span class="badge-title">AZ ÉV KÁRTYA KÉSZÍTŐJE</span>
                        <span class="badge-date">2019-2020</span>
                        <p class="badge-description">Legtöbb minőségi kártya elkészítését és forgalomba helyezését végezte Magyarországon 2019-ben!</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--End Kitüntetések-->
    <!--Start Csapatinfó-->
    <div class="team-section">
        <div class="team-title">
            <span>Aranykezű Mestereink</span>
        </div>

        <div class="subtitle">
            <h2>CSAPATUNK</h2>
        </div>

            
        <div class="all-helper-info">
            <div class="helper-individual">
                <div class="helper-group helper1">
                    <div class="helper-pic-group">
                        <div class="helper-pic"></div>
                    </div>

                    <div class = "helper-more-about">
                        <p class="name"><b>ALAPOS JÓZSEF</b></p>
                        <p class="hierarchy">TÁRSALAPÍTÓ</p>
                        <p class="description">Az éjjel soha nem érhet véget, varázsolj nekünk valami szépet...</p>
                    </div>
        
                    <div class="helper-social-media">
                        <div class="social-media">
                            <span class="facebook">
                                    <a href=#><i class="fab fa-facebook-square"></i></a>
                            </span>
                            <span class="twitter">
                                <a href=#><i class="fab fa-twitter-square"></i></a>
                            </span>
                            <span class="instagram">
                                <a href=#><i class="fab fa-instagram-square"></i></a>
                            </span>
                            <span class="pinterest">
                                <a href=#><i class="fab fa-pinterest-square"></i></a>
                            </span>
                        </div>
                    </div> 
                </div>
            </div>    

        <div class="helper-individual">
                <div class="helper-group helper2">
                    <div class="helper-pic-group">
                        <div class="helper-pic"></div>
                    </div>

                    <div class = "helper-more-about">
                        <p class="name"><b>MÁGNESES ÁGNES</b></p>
                        <p class="hierarchy">SZERKESZTŐ ÉS ARCHIVÁLÓ</p>
                        <p class="description">...ÉS A GÓL...ÉS A GÓL...MAGYARORSZÁG 2...AUSZTRIA NULLAAAA...</p>
                    </div>
        
                    <div class="helper-social-media">
                        <div class="social-media">
                            <span class="facebook">
                                <a href=#><i class="fab fa-facebook-square"></i></a>
                            </span>
                            <span class="twitter">
                                <a href=#><i class="fab fa-twitter-square"></i></a>
                            </span>
                            <span class="instagram">
                                <a href=#><i class="fab fa-instagram-square"></i></a>
                            </span>
                            <span class="pinterest">
                                <a href=#><i class="fab fa-pinterest-square"></i></a>
                            </span>
                        </div>
                    </div> 
                </div>
            </div>
        </div>
    </div>
    <!--End Csapatinfó-->
    </body>
</html>