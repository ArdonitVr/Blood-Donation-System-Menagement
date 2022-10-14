<html>
	<head>
		<title>Uebaplikacioni per Menaxhimin e Dhurimit te GJakut</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
	</head>
	<body class="is-preload">

		<?php

include_once("konfigurimi.php");

if(isset($_POST['shtoP'])) {	
	$emriperdoruesit = mysqli_real_escape_string($lidh,$_POST['emriperdoruesit']);
	$fjalekalimi= mysqli_real_escape_string($lidh,MD5($_POST['fjalekalimi']));
	$email = $_POST['email'];
	$email = filter_var($email, FILTER_SANITIZE_EMAIL);
	
		

	if(empty($emriperdoruesit) || empty($fjalekalimi) || empty($email)) {			
		if(empty($emriperdoruesit)) {echo "<font color='red'>Fusha perdoruesit eshte e zbrazet.</font><br/>";}
		if(empty($fjalekalimi)) {echo "<font color='red'>Fusha fjalekalimit eshte e zbrazet.</font><br/>";}
		if(empty($email)) {echo "<font color='red'>Fusha e emailit eshte e zbrazet.</font><br/>";}
		
		echo "<br/><a href='javascript:self.history.back();'>Kthehu Mbrapa</a>";
	} 
//PHP FILTER i perrdorur per te identifikuar formatin e gabuar te emailit
	else if(!filter_var($email,FILTER_VALIDATE_EMAIL)===true) {
		echo ("$email nuk eshte ne formatin e duhur");
		echo "<br/><a href='javascript:self.history.back();'>Kthehu Mbrapa</a>";
	} 
	
	else { 
		
		$resultati = mysqli_query($lidh_shtoP, "CALL shtoP('$emriperdoruesit','$fjalekalimi','$email')");
		
	echo "<script>
         setTimeout(function(){
            window.location.href = 'ballina.php';
         }, 3000);
      </script>";
		 echo"<p><b>   E dhena eshte duke u regjistruar ne sistem. Ju lutem pritni 3 sekonda. <b></p>";
	
	
	}
}
?>

</body>
</html>
