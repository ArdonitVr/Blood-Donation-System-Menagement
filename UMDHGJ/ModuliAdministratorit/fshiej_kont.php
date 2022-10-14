<?php
include("konfigurimi.php");
$ID_Kontakti = $_GET['ID_Kontakti'];
$resultati = mysqli_query($lidh_fshiej_kont,"CALL fshiej_kont('$ID_Kontakti')");
header("Location:fshiej_kontakt.php");
?>

