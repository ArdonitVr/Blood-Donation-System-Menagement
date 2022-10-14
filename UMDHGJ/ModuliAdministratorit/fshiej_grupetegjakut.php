<?php
include("konfigurimi.php");
$p_ID_GrupiGjakut = $_GET['ID_GrupiGjakut'];
$resultati = mysqli_query($lidh_ggj,"CALL fshiej_ggj('$p_ID_GrupiGjakut')");
header("Location:menaxho_grupetegjakut.php");
?>

