		<html>
	<head>
		<title>Uebaplikacioni per Menaxhimin e Dhurimit te GJakut</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
	</head>
	<body>
		<?php

include_once("konfigurimi.php");

// MYSQL Injection i perdorur ne formen e Kontaktit

if(isset($_POST['shtokontakt'])) {	
	$Subjekti = mysqli_escape_string($lidh,$_POST['Subjekti']);
	$Mesazhi = mysqli_escape_string($lidh,$_POST['Mesazhi']);
	$Email = mysqli_escape_string($lidh,$_POST['Email']);
		
	
	if(empty($Subjekti) || empty($Mesazhi) || empty($Email)) {			
		if(empty($Subjekti)) {echo "<font color='red'>Subjekti eshte i zbrazet.</font><br/>";}
		if(empty($Mesazhi)) {echo "<font color='red'>Mesazhi eshte i zbrazet.</font><br/>";}
		if(empty($Email)) {echo "<font color='red'>Email eshte i zbrazet.</font><br/>";}
		
		echo "<br/><a href='javascript:self.history.back();'>Shko pas</a>";
	} else { 
		
		$resultati = mysqli_query($lidh_shk, "Call shtokontakt('$Subjekti','$Mesazhi','$Email')");
	
		echo "<script>
         setTimeout(function(){
            window.location.href = 'kontakt.php';
         }, 3000);
      </script>";
		 echo"<p><b>   E dhena eshte duke u regjistruar ne sistem. Ju lutem pritni 3 sekonda. <b></p>";
	
	}
}
?></body>
</html>