<?php
include('konfigurimi.php');
session_start();
$kontrollimi_p=$_SESSION['emriperdoruesit'];
$ses_sql = mysqli_query($lidh_kontrollimin,"CALL selekto_kontrollimin('$kontrollimi_p') ");
$rreshti=mysqli_fetch_array($ses_sql,MYSQLI_ASSOC);
$hyerje_perdoruesit=$rreshti['emriperdoruesit'];
if(!isset($kontrollimi_p))
{ header("Location: index.php");} 
?>