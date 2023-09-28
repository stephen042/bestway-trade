<?php
session_start();
include '../config/db.php';
include '../config/config.php';
include '../config/functions.php';

$msg = "";
$err = "";

$email_err = $password_err = "";
$email = $password = "";

if (isset($_POST['login_action'])) {

    if (empty($_POST["email"])) {
        $err = "Email is required";
    } else {
        $email = text_input($_POST["email"]);
    }

    if (empty($_POST["password"])) {
        $err = "Password is required";
    } else {
        $password = text_input($_POST["password"]);
    }

    if ($email == "" || $password == "") {
        $err = "Email or Password fields cannot be empty!";
    } else {
        $sql = mysqli_query($link, "SELECT * FROM users WHERE email = '$email' AND password = '$password'");
        if (mysqli_num_rows($sql) > 0) {
            $data = mysqli_fetch_assoc($sql);
            $email = $data['email'];
            $fname = $data['fname'];
            $lname = $data['lname'];
            $id = $data['id'];

            if ($data['2fa'] == 1) {
                $code = "0123456789";
                $fa2_code = str_shuffle($code);
                $fa2_code = substr($fa2_code, 0, 6);
                $update = mysqli_query($link, "UPDATE users SET 2fa_code = '$fa2_code' WHERE email = '$email' ");
                if ($update) {
                    $_SESSION['2fa_login'] = $email;
                    $name = $fname . " " . $lname;
                    $subject = "Auth OTP";
                    $body = "<h5>Login OTP</h5> <p>Hi " . $fname . "</p> <p>A login attempt was made on your account. use the code below to complete sign in.</p> <h5> <strong>" . $fa2_code . "</strong> </h5> <p>Contact us as soon as possible if you didnt make this attempt.</p> <p>Thanks,</p> <p>" . $sitename . "</p> ";
                    $send = sendMail($email, $name, $subject, $body);
                    if ($send) {
                        // echo "<script>window.location.href = '2fa.php' </script>";
                    }
                    echo "<script>window.location.href = '2fa.php' </script>";
                }
            } else {
                $_SESSION['user_mail'] = $email;
                echo "<script>window.location.href = '../user/dashboard.php' </script>";
            }
        } else {
            $err = "Invalid Email and Password";
        }
    }
}


?>

<!DOCTYPE html>
<html lang="en">

<!-- Mirrored from BestWayTrade.net/signin.php by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 25 Sep 2023 23:46:16 GMT -->
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>SignIn </title>
  <meta name="image" property="og:image" content="../superbinance.com/assets/img/new_3.html">
  <meta name="twitter:image" content="../superbinance.com/assets/img/new_3.html">
  <meta name="twitter:card" content="summary_large_image">
  <link rel="stylesheet" href="../libs/css/bootstrap.min.css">
  <link rel="stylesheet" href="../libs/css/style.css">
  <link rel="stylesheet" href="../libs/css/mobile.css">
  <link rel="stylesheet" href="../libs/css/theme-skin-color-set2.css">
  <link rel="stylesheet" href="../libs/build/css/intlTelInput.css">
  <link rel="stylesheet" href="../libs/css/owl.carousel.min.css">
  <link rel="stylesheet" href="../alert/css/fake-notification-min.css">
  <link rel="stylesheet" href="../alert/css/animate.min.css">
  <link rel="shortcut icon" type="image/png" href="../assets/img/favicon.png">
  <link rel="stylesheet" href="../cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.2/css/all.css">
  <link rel="stylesheet" href="../cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
  <script src="../ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <style>
    .line-bottom {
      position: relative;
      margin-bottom: 30px;
      padding-bottom: 10px;
    }

    .line-bottom:after {
      bottom: -1px;
      content: "";
      height: 2px;
      left: 0;
      position: absolute;
      width: 50px;
    }

    .line-bottom-theme-colored2 {
      position: relative;
      margin-bottom: 30px;
      padding-bottom: 10px;
    }

    .line-bottom-theme-colored2:after {
      border-radius: 10px;
      bottom: -1px;
      content: "";
      height: 2px;
      left: 0;
      position: absolute;
      width: 50px;
    }

    .line-bottom-rounded-theme-colored2 {
      position: relative;
      margin-bottom: 12px;
      padding-bottom: 4px;
    }

    .line-bottom-rounded-theme-colored2:after {
      border-radius: 15px;
      bottom: -1px;
      content: "";
      height: 4px;
      border-radius: 6px;
      left: 0;
      position: absolute;
      width: 42px;
    }

    .double-line-bottom-theme-colored2 {
      margin-bottom: 20px;
      margin-top: 8px;
      padding-bottom: 5px;
      position: relative;
    }

    .double-line-bottom-theme-colored2:after {
      border-radius: 8px;
      bottom: 1px;
      content: "";
      height: 2px;
      left: 0;
      position: absolute;
      width: 64px;
    }

    .double-line-bottom-theme-colored2:before {
      border-radius: 8px;
      bottom: -1px;
      content: "";
      height: 6px;
      left: 10px;
      position: absolute;
      width: 24px;
    }

    .diamond-line-centered-theme-colored2 {
      margin-bottom: 25px;
      margin-top: 25px;
      padding-bottom: 5px;
      position: relative;
    }

    .diamond-line-centered-theme-colored2:after {
      bottom: 0;
      content: "";
      height: 3px;
      left: 0;
      margin: 0 auto;
      position: absolute;
      right: 0;
      width: 90px;
    }

    .diamond-line-centered-theme-colored2:before {
      border: 3px solid #fff;
      bottom: -5px;
      content: "";
      height: 14px;
      left: 0;
      margin: 0 auto;
      position: absolute;
      right: 0;
      width: 14px;
      z-index: 3;
      -webkit-transform: rotate(45deg);
      -o-transform: rotate(45deg);
      -ms-transform: rotate(45deg);
      transform: rotate(45deg);
    }

    .diamond-line-centered-theme-white {
      margin-bottom: 25px;
      margin-top: 25px;
      padding-bottom: 5px;
      position: relative;
    }

    .diamond-line-centered-theme-white:after {
      bottom: 0;
      content: "";
      height: 3px;
      left: 0;
      margin: 0 auto;
      position: absolute;
      right: 0;
      width: 90px;
      background-color: #fff;
    }

    .diamond-line-centered-theme-white:before {
      background-color: #fff;
      border: 3px solid #fff;
      bottom: -5px;
      content: "";
      height: 14px;
      left: 0;
      margin: 0 auto;
      position: absolute;
      right: 0;
      width: 14px;
      z-index: 3;
      -webkit-transform: rotate(45deg);
      -o-transform: rotate(45deg);
      -ms-transform: rotate(45deg);
      transform: rotate(45deg);
    }

    .diamond-line-left-theme-colored2 {
      margin-bottom: 25px;
      margin-top: 25px;
      padding-bottom: 5px;
      position: relative;
    }

    .diamond-line-left-theme-colored2:after {
      bottom: 0;
      content: "";
      height: 3px;
      left: 0;
      position: absolute;
      right: 0;
      width: 90px;
    }

    .diamond-line-left-theme-colored2:before {
      border: 3px solid #fff;
      bottom: -5px;
      content: "";
      height: 14px;
      left: 15px;
      position: absolute;
      right: 0;
      width: 14px;
      z-index: 3;
      -webkit-transform: rotate(45deg);
      -o-transform: rotate(45deg);
      -ms-transform: rotate(45deg);
      transform: rotate(45deg);
    }

    .line-bottom-centered {
      position: relative;
      margin: 10px 0 35px;
    }

    .line-bottom-centered:after {
      bottom: -13px;
      content: "";
      height: 3px;
      left: 0;
      margin-left: auto;
      margin-right: auto;
      margin-top: 0;
      position: absolute;
      right: 0;
      width: 40px;
    }

    .line-bottom-double-line-centered {
      margin-bottom: 15px;
      padding-bottom: 15px;
      position: relative;
    }

    .line-bottom-double-line-centered::before {
      bottom: 3px;
      content: "";
      height: 1px;
      left: 0;
      margin: 0 auto;
      position: absolute;
      right: 0;
      width: 20px;
    }

    .line-bottom-double-line-centered::after {
      bottom: 7px;
      content: "";
      height: 1px;
      left: 0;
      margin: 0 auto;
      position: absolute;
      right: 0;
      width: 45px;
    }

    .cryptonatorwidget {
      border: none !important;
      padding: 0 !important;
    }

    .cryptonatorwidget input,
    .cryptonatorwidget select {
      font-size: 14px !important;
      text-transform: uppercase;
      height: 50px !important;
      padding-left: 10px;
      border-radius: 16px;
    }

    @media (max-width: 499px) {

      .cryptonatorwidget input,
      .cryptonatorwidget select {
        padding-left: 10px;
      }
    }

    .cryptonatorwidget select {
      padding-right: 40px;
    }

    .cryptonatorwidget .select-group {
      margin-bottom: 0;
    }

    .cryptonatorwidget>div:last-child {
      display: none;
    }

    .cryptonatorwidget table td {
      padding: 5px;
    }

    .top40 {
      margin-top: 40px;
    }

    .text_box span {
      background: #fff;
      border: 1px solid #ccc;
      box-shadow: inset 0 0 0 5px #f2f2f2;
    }

    .text_box span,
    .text_box span.fill {
      display: inline-block;
      border-radius: 50%;
      height: 90px;
      width: 90px;
      text-align: center;
      line-height: 86px;
      font-size: 34px;
      margin-bottom: 15px;
    }

    .text_box span i {
      color: #ff5a24;
    }
  </style>
</head>

<body>
  <!-- <div id="preloader" class="d-flex">
    <div id="loader" class="mx-auto my-auto">
      <div class="spinner-grow text-white" role="status">
        <span class="sr-only">Loading...</span>
      </div>
    </div>
  </div> -->
  <div id="notification-1" class="notification">
    <div class="notification-block">
      <div class="notification-img">
        <!-- Your image or icon -->
        <i class="fab fa-btc" aria-hidden="true"></i>
        <!-- / Your image or icon -->
      </div>
      <div class="notification-text-block">
        <div class="notification-title">
          <!-- Notification Title -->
          Earning
          <!-- / Notification Title -->
        </div>
        <div class="notification-text"></div>
      </div>
    </div>
  </div>
    <!-- start Nav -->
    <?php 
        include 'includes/nav.php';
    ?>
    <!-- end Nav -->
  <div class="other-banner d-flex">
    <div class="container my-auto mx-auto">
      <h2><strong>SignIn and the join millions who have chosen BestWayTrade</strong></h2>
    </div>
  </div>
  <div class="other-content">
    <div class="container">
      <div class="form-container">
      <?php
        if ($msg != "") {
            echo ('<div class="alert alert-success alert-dismissible fade show" role="alert">
            <i class="bi bi-check-circle me-1"></i>
            ' . $msg . '
          </div>');
            echo pageRedirect("3", "login.php");
        }

        if ($err != "") {
            echo ('<div class="alert alert-danger alert-dismissible fade show" role="alert">
            <i class="bi bi-exclamation-octagon me-1"></i>
            ' . $err . '
          </div>');
        }
      ?>

        <form class="form-reg" method="post" action="">
          <div class="card w-100">
            <div class="card-header bg-light p-3">
              <h4 class="text-center">Account Login</h4>
            </div>
            <div class="card-body d-flex">
              <div class="my-auto mx-auto">
                <input type="hidden" name="csrf_token" value="6d028e4fcb2e023c2541bba6cb98a40c">
                <div class="form-group">
                  <div class="input-group">
                    <div class="input-group-prepend">
                      <div class="input-group-text icc"><i class="fas fa-at"></i></div>
                    </div>
                    <input type="email" class="form-control" name="email" placeholder="email" required="">
                  </div>
                </div>
                <div class="form-group">
                  <div class="input-group">
                    <div class="input-group-prepend">
                      <div class="input-group-text icc"><i class="fas fa-lock-open"></i></div>
                    </div>
                    <input type="password" class="form-control" name="password" placeholder="password" required="">
                  </div>
                </div>
                <button type="submit" name="login_action" class="btn btn-green text-uppercase">Login</button>
                <p class="text-center mt-2">Forgot account password ? &nbsp;<a href="forgot-password.php"
                    style="color:#56be89;text-decoration:none;">Click here</a></p>
                <p class="text-center">Need a real account?<a href="../register.html"
                    style="color:#56be89;text-decoration:none;"> Create an account</a></p>
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
 
 <!-- start footer -->
 <?php 
        include 'includes/footer.php';
    ?>
<!-- end footer -->

<!-- script -->
    <?php 
        include 'includes/script.php';
    ?>
<!-- end script -->
</body>

<!-- Mirrored from BestWayTrade.net/signin.php by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 25 Sep 2023 23:46:19 GMT -->

</html>