<?php

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;

require 'PHPMailer/src/Exception.php';
require 'PHPMailer/src/PHPMailer.php';
require 'PHPMailer/src/SMTP.php';

    function test_input($data) {
        $data = trim($data);
        $data = stripslashes($data);
        $data = htmlspecialchars($data);
        return $data;
    }

    $tel = $order = "";

    $recaptchaCriteria = "";
    $sendCriteria = "";
    $errorCriteria = "";

    if($_SERVER['REQUEST_METHOD'] == "POST")
    {
        $name = $_POST['customerName'];
        $email = $_POST['customerEmail'];
        $message = $_POST['customerMessage'];

        if(isset($_POST['customerPhone']))
        {
            $phone = $_POST['customerPhone'];
            $tel = "<br>Phone: ". test_input($phone) . "<br>";
        }

        if(isset($_POST['orderNumber']))
        {
            $orderNumber = $_POST['orderNumber'];
            $order = "<br>Order Number: " . test_input($orderNumber) . "<br>";
        }

        $to = "carbdubbies@gmail.com";
        $subject = "Üzenet - küldte $name";
        $message = "<b>Üzenet: $message</b><br>Telefonszám: <b>$tel</b><br><b>Rendelés: $order</b>";
        $altMessage = $message . $tel . $order;
        $headers = "From: $email \r\n";
        $headers .= "MIME-Version: 1.0" . "\r\n";
        $headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";

//        mail($to, $subject, $note, $headers);
        $mail = new PHPMailer(true);

        try {
            $mail->CharSet = 'utf-8';
            //$mail->SMTPDebug = SMTP::DEBUG_SERVER;
            $mail->isSMTP();
            $mail->Host = 'smtp.gmail.com';
            $mail->SMTPAuth = true;
            $mail->Username = 'carbdubbies@gmail.com';
            $mail->Password = 'bdnrgqeozvrklcbd';
            $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;
            $mail->Port = 465;

            $mail->setFrom('carbdubbies@gmail.com', 'CardBuddies');
            $mail->addAddress($to);

            $mail->isHTML(true);
            $mail->Subject = $subject;
            $mail->Body = $message;
            $mail->AltBody = $altMessage;

            $mail->send();
            $mail->smtpClose();

            echo "Üzenet elküldve";
        } catch (Exception $e) {
            echo "Az üzenet küldése sikertelen. Mailer Error: {$mail->ErrorInfo}";
        }
    }
?>