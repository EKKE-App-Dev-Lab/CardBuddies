<?php
define('Access', TRUE);

include "./AdditionalPHP/startSession.php";
include_once 'connection.php';

$validated = false;

// változók definiálása és beállitása üres értékre
$fname = $lname = $email = $address = $country = $city = $zip = $paymentMethod = $ccname = $ccnum = $ccexp_m = $ccexp_y = $cccvv = "";
$fnameErr = $lnameErr = $emailErr = $addressErr = $countryErr = $cityErr = $zipErr = $paymentMethodErr = $ccnameErr = $ccnumErr = $ccexpErr = $cccvvErr = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    //KERESZTNÉV VALIDÁLÁSA
    $fname = test_input($_POST["fname"]);
    // leellenőrzi, hogy csak betűket és spacet tartalmaz-e
    if (!preg_match("/^[A-ZÁÉÍÓÖŐÚÜŰ][a-záéíóöőúüű]+$/", $fname)) {
        $fnameErr = "Nagy kezdőbetű és csak betű és szóköz engedélyezett";
    }

    //VEZETÉKNÉV VALIDÁLÁSA
    $lname = test_input($_POST["lname"]);
    // leellenőrzi, hogy csak betűket és spacet tartalmaz-e
    if (!preg_match("/^[A-ZÁÉÍÓÖŐÚÜŰ][a-záéíóöőúüű]+$/", $lname)) {
        $lnameErr = "Nagy kezdőbetű és csak betű és szóköz engedélyezett";
    }

    //EMAIL VALIDÁLÁSA
    $email = test_input($_POST["email"]);
    // ellenőrzi a formátumot
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $emailErr = "Érvénytelen email cím formátum";
    }

    //CÍM VALIDÁLÁSA
    $address = test_input($_POST["address_checkout"]);
    // Ellenőrizze, hogy a cím számmal kezdődik-e, azt követik-e betűk, tartalmaz-e szóközt, kötőjelet és vesszőt.
    if (!preg_match("/^[0-9a-zA-Záéíóöőúüű\s,-]+$/", $address)) {
        $addressErr = "Érvénytelen cím";
    }

    //VÁROS VALIDÁLÁSA
    $city = test_input($_POST["city"]);
    // ellenőrzi, hogy city == options
    if ($city == "Budapest" || $city == "Veresegyház" || $city == "Biatorbágy" || $city == "Concó" || $city == "Bugyi" || $city == "Piripócs" || $city == "Szabadka") {
        //valid
    } else {
        $cityErr = "Érvénytelen város";
    }

    //IRÁNYÍTÓSZÁM VALIDÁLÁSA
    $zip = test_input($_POST["zip"]);
    // ellenőrzi, hogy az irányítószám pontosan 5 számjegyet tartalmaz.
    if (!preg_match("/^[0-9]{4}/", $zip)) {
        $zipErr = "Érvénytelen irányítószám";
    }

    //FIZETÉSI METÓDUS VALIDÁLÁSA
    $paymentMethod = test_input($_POST["paymentMethod"]);

    //REGEX KÁRTYATÍPUS ALAPJÁN
    $cardtype = array(
        "visa" => "/^4[0-9]{15}$/",
        // "mastercard" => "/^5[1-5][0-9]{14}$/"

    );

    //HITELKÁRTYA NÉV ÉRVÉNYESSÉGELLENŐRZÉS
    $ccname = test_input($_POST["ccname"]);
    // Ellenőrzi, hogy a hitelkártya név csak betűket és szóközöket tartalmaz-e.
    if (!preg_match("/^([A-Za-zÁÉÍÓÖŐÚÜŰáéíóöőúüű]+\s){1}[A-Za-zÁÉÍÓÖŐÚÜŰáéíóöőúüű]+$/u", $ccname)) {
        $ccnameErr = "Legalább két darab három vagy több karakterből álló szót adj meg szóközzel elválasztva.";
    }

    //HITELKÁRTYASZÁM VALIDÁLÁSA
    $ccnum = test_input($_POST["ccnum"]);
    // ellenprzi, hogy a hitelkártyaszám illeszkedik-e a kártyatípusnak megfelelő regexbe
    if (!preg_match($cardtype['visa'], $ccnum)) {
        $ccnumErr = "Érvénytelen kártyaszám
          <br>
          Elnézést! Jelenleg a rendszerünk a VISA és MasterCard kártyákat támogatja.";
    }

    //HITELKÁRTYA LEJÁRATI DÁTUM VALIDÁLÁSA
    if (empty($_POST["ccexp_m"]) || empty($_POST["ccexp_y"])) {
        $ccexpErr = "Kérlek add meg a lejárati dátumot";
    } else {
        $ccexp_m = test_input($_POST["ccexp_m"]);
        $ccexp_y = test_input($_POST["ccexp_y"]);
        //VALIDÁLJA A HÓNAPOT
        if ((int)$ccexp_m > 0 && (int)$ccexp_m < 13) {
            //VALIDÁLJA AZ ÉVET
            if ((int)$ccexp_y > 1900 && (int)$ccexp_y < 4000) {
                $expired_check = \DateTime::createFromFormat('my', $ccexp_m . $ccexp_y);
                $month_now = date('m');
                $year_now = date('y');
                $now = new \DateTime();

                //ELLENŐRZI, HOGY LEJÁRT-E A KÁRTYA
                if ($year_now < (int)$ccexp_y) {
                    // valid
                } else if ($year_now == (int)$ccexp_y) {
                    if ($month_now < (int)$ccexp_m) {
                        // valid
                    } else {
                        $ccexpErr = "A kártya már lejárt";
                    }
                } else {
                    $ccexpErr = "A kártya már lejárt.";
                }
            } else {
                $ccexpErr = "Érvénytelen év";
            }
        } else {
            $ccexpErr = "Érvénytelen lejárati dátum";
        }
    }


    //HITELKÁRTYA CVV VALIDÁLÁSA
    $cccvv = test_input($_POST["cccvv"]);
    if (preg_match("/^[0-9]{3,4}$/", $cccvv)) {
        //valid
    } else {
        $cccvvErr = "Érvénytelen CVV";
    }
    if ($fnameErr == "" && $lnameErr == "" && $emailErr == "" && $addressErr == "" && $countryErr == "" && $cityErr == "" && $zipErr == "" && $paymentMethodErr == "" && $ccnameErr == "" && $ccnumErr == "" && $ccexpErr == "" && $cccvvErr == "") {
        $validated = true;
    }
}

function test_input($data)
{
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}

?>



<script src="checkout/bootstrap.bundle.min.js"></script>
<script src="checkout/form-validation.js"></script>

</body>
</html>
