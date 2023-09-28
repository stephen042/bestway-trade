<?php

@define('DBSERVER', 'localhost');
@define('DBUSERNAME', 'u119630305_bestwaytrade');
@define('DBPASSWORD', 'Secret666.');
@define('DBNAME', 'u119630305_bestwaytrade');
@define('DBPORT', '3308');

 
/* Attempt to connect to MySQL database */
$link = mysqli_connect(DBSERVER, DBUSERNAME, DBPASSWORD, DBNAME, DBPORT);
 
// Check connection
if($link === false){
    die("ERROR: Could not connect. " . mysqli_connect_error());
}

?>
