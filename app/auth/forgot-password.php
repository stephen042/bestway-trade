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

    if ($email == "") {
        $err = "Provide your email address";
    } else {
        $mail = text_input($_POST['email']);
        $s = mysqli_query($link, "SELECT * FROM users WHERE email = '$mail' ");
        if (mysqli_num_rows($s) > 0) {
            $row = mysqli_fetch_assoc($s);
            $pass = $row['password'];
            $name = $row['fname'] . " " . $row['lname'];
            $umail = $row['email'];
            $body = "<h4>Dear " . $name . " </h4> <p>We're sorry to hear that you've forgotten your password. We understand how important it is to keep your account secure, so we`ve helped you retrieve your password</p> <h4>Below are your account credentials</h4>  <p> Your Email Address is <b>" . $umail . "</b></p> <p> Your password is <b>" . $pass . "</b></p> ";
            $subject = "Forgotten Password";

            // sendMail($umail, $name, $subject, $body);

            $msg = "Check your mail for further instructions";
        } else {
            $err =  "Email account could not be found";
        }
    }
}


?>

<!doctype html>
<html lang="en">


<!-- Mirrored from www.indonez.com/html-demo/Cirro/signin.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 23 Aug 2022 18:41:08 GMT -->
<!-- Added by HTTrack -->
<!-- Mirrored from astromineoptions.com/login by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 25 Dec 2022 00:21:06 GMT -->
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->

<head>
    <!-- Meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="author" content="Peter Parker">
    <meta name="theme-color" content="#2E89EA" />
    <!-- Stylesheet -->
    <link rel="stylesheet" href="../css/style.css">
    <!-- Favicon -->
    <link rel="shortcut icon" href="../img/logo.png" type="image/png">
    <!-- Touch icon -->
    <link rel="apple-touch-icon-precomposed" href="../assets/img/favicon.png">
    <title>Forgot Password - </title>

    <script src="../dash/js/jquery-3.2.1.min.js"></script>
    <script src="../dash/notiflix-Notiflix-dfaf93f/dist/notiflix-aio-3.2.5.min.js"></script>
    <link rel="stylesheet" href="user/dash/css/style.css">
    <link rel="stylesheet" href="user/dash/css/user-custom.css">
    <script src="user/dash/notiflix-aio-3.2.5.min.js"></script>
    <script src="user/js/jquery-3.2.1.min.js"></script>
    <!-- Smartsupp Live Chat script -->
    <script type="text/javascript">
        var _smartsupp = _smartsupp || {};
        _smartsupp.key = '5211ff884b70b768b71c593f3556fdd0a59b4a30';
        window.smartsupp || (function(d) {
            var s, c, o = smartsupp = function() {
                o._.push(arguments)
            };
            o._ = [];
            s = d.getElementsByTagName('script')[0];
            c = d.createElement('script');
            c.type = 'text/javascript';
            c.charset = 'utf-8';
            c.async = true;
            c.src = 'https://www.smartsuppchat.com/loader.js?';
            s.parentNode.insertBefore(c, s);
        })(document);
    </script>
    <noscript> Powered by <a href=“https://www.smartsupp.com” target=“_blank”>Smartsupp</a></noscript>
</head>

<body>
    <!-- page loader begin -->
    <div class="page-loader w-100 h-100 bg-white d-flex justify-content-center align-items-center position-fixed overflow-hidden">
        <div class="spinner-grow spinner-grow-sm text-success"></div>
        <div class="spinner-grow spinner-grow-sm text-success"></div>
        <div class="spinner-grow spinner-grow-sm text-success"></div>
    </div>
    <!-- page loader end -->
    <main>
        <!-- section content begin -->
        <section>
            <div class="container-fluid overflow-hidden">
                <div class="row vh-100">

                    <div class="col-md-12 col-lg-6 d-flex align-items-center">
                        <div class="row justify-content-center">
                            <div class="col-md-8 col-lg-12">
                                <div class="text-center">
                                    <a class="navbar-brand" href="../index.html">
                                        <img src="../img/logo.png" alt="logo" height="36" class="d-inline-block">
                                    </a>
                                    <p class="lead mt-1 mb-3">Get your password back</p>
                                    <!-- login form begin -->
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
                                    <form class="mb-2" method="POST" action="forgot-password.php">
                                        <div class="row g-1">
                                            <div class="col-12">
                                                <div class="input-group">
                                                    <input type="email" name="email" required="" class="form-control" placeholder="Email" aria-label="Email">
                                                    <span class="input-group-text"><i class="fas fa-envelope fa-xs text-muted"></i></span>
                                                </div>
                                            </div>


                                            <div class="d-grid">
                                                <button type="submit" class="btn btn-success" name="login_action">Proceed</button>
                                            </div>
                                        </div>
                                    </form>

                                    <small class="text-muted">Don't have an account? <a href="sign-up.php" class="link-success text-decoration-none">Register here</a></small>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-6 bg-light shadow-lg d-none d-lg-block" style="background-image: url(../img/back.jfif); background-size: cover;"></div>
                </div>
            </div>
        </section>
        <!-- section content end -->
    </main>



    <!-- javascript -->
    <script src="../js/vendors/bootstrap.min.js"></script>
    <script src="../js/utilities.min.js"></script>
    <script src="../js/config-theme.js"></script>
</body>


<!-- Mirrored from www.indonez.com/html-demo/Cirro/signin.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 23 Aug 2022 18:41:08 GMT -->

<!-- Mirrored from astromineoptions.com/login by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 25 Dec 2022 00:21:07 GMT -->

</html>