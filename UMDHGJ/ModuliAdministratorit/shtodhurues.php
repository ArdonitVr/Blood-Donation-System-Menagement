<html>
	<head>
		<title>Moduli i Administratorit</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
	</head>
	<body class="is-preload">

		<?php

include_once("konfigurimi.php");

if(isset($_POST['shtodhurues'])) {	
	$Emri_dhuruesit = $_POST['Emri_dhuruesit'];
	$Mbiemri_dhuruesit = $_POST['Mbiemri_dhuruesit'];
	$Mosha_dhuruesit = $_POST['Mosha_dhuruesit'];
	$Adresa_dhuruesit = $_POST['Adresa_dhuruesit'];
	
	$ID_GrupiGjakut = $_POST['ID_GrupiGjakut'];
	
	
	$Foto_dh =addslashes (file_get_contents($_FILES['Foto_dh']['tmp_name']));
	$Emri_Fotos=$_FILES['Foto_dh']['name'];
	
	 $maxsize = 10000000; 
	

	
	
	if(empty($Emri_dhuruesit) || empty($Mbiemri_dhuruesit)|| empty($Mosha_dhuruesit) || empty($Adresa_dhuruesit)) {
				
		if(empty($Emri_dhuruesit)) {
			echo "<font color='red'>Fusha Emrit eshte e zbrazet.</font><br/>";
		}
		
		if(empty($Mbiemri_dhuruesit)) {
			echo "<font color='red'>Fusha Mbiemrit eshte e zbrazet.</font><br/>";
		}
		
		if(empty($Mosha_dhuruesit)) {
			echo "<font color='red'>Fusha Moshes eshte e zbrazet.</font><br/>";
		}
		if(empty($Adresa_dhuruesit)) {
			echo "<font color='red'>Adresa eshte e zbrazet.</font><br/>";
		}
		
		
		echo "<br/><a href='javascript:self.history.back();'>Kthehu Mbrapa</a>";
	}
//PHP ERROR i perdorur ne Uebaplikacon per te identifiuar moshen e cila duhet te jete mbi 16-->
	 else if ($Mosha_dhuruesit<=16 ){
		trigger_error("Per te dhuruar gjake Dhuruesi duhet te jete mbi 16");
		echo "<br/><a href='javascript:self.history.back();'>Kthehu Mbrapa</a>";
	}
	else{ 
		 
			
			
		$resultati = mysqli_query($lidh_shto_dhurues, "CALL shto_dhurues('$Emri_dhuruesit','$Mbiemri_dhuruesit','$Mosha_dhuruesit','$Adresa_dhuruesit','$ID_GrupiGjakut','$Foto_dh','Emri_Fotos')");
		
		
			echo "<script>
         setTimeout(function(){
            window.location.href = 'menaxho_dhuruesit.php';
         }, 3000);
      </script>";
		 echo"<p><b>   E dhena eshte duke u regjistruar ne sistem. Ju lutem pritni 3 sekonda. <b></p>";
		 
		
	}
}
?>

	
     

	</body>
</html>