<?php
include("konfigurimi.php");
$ID_dhuruesit = $_GET['ID_dhuruesit'];
$resultati = mysqli_query($lidh_fshiej_dhuruesit,"CALL fshiej_dhuruesit('$ID_dhuruesit')");
header("Location:menaxho_dhuruesit.php");
?>