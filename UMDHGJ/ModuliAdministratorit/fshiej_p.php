<?php
include("konfigurimi.php");
$epid = $_GET['epid'];
$resultati = mysqli_query($lidh,"CALL fshiej_perdorues('$epid')");
header("Location:fshiej_perdorues.php");
?>