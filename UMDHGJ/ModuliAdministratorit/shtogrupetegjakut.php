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

if(isset($_POST['shtogrupeteGjakut'])) {	
	$GrupiGjakut = $_POST['GrupiGjakut'];
	
		if(empty($GrupiGjakut)) {			
		if(empty($GrupiGjakut)) {echo "<font color='red'>GrupiGjakut eshte e zbrazet.</font><br/>";}
		
	   echo "<br/><a href='javascript:self.history.back();'>Kthehu Mbrapa</a>";
	} else { 
			
		$resultati = mysqli_query($lidh_grgj, "CALL shto_grgj('$GrupiGjakut')");
		
		 "<font color='green'>Data added successfully.";
		 "<br/><a href='ballina.php'>Shiko Resultatin</a>";
		echo "<script>
         setTimeout(function(){window.location.href = 'menaxho_grupetegjakut.php';
         }, 3000);
      </script>";
		 echo"<p><b>   E dhena eshte duke u regjistruar ne sistem. Ju lutem pritni 3 sekonda. <b></p>";
	
	}
}
?>
</body>
</html>