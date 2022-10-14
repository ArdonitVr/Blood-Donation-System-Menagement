<?php

	session_start();
	include("konfigurimi.php"); 
	
	$error = ""; 
	if(isset($_POST["kycy"]))
	{
		if(empty($_POST["emriperdoruesit"]) || empty($_POST["fjalekalimi"]))
		{
			$error = "Te dy fushat jane te nevojshme.";
		}else
		{
			
			$emriperdoruesit=$_POST['emriperdoruesit'];
			$fjalekalimi=md5($_POST['fjalekalimi']);
			
			$sql="CALL selekto_hyerjen('$emriperdoruesit','$fjalekalimi')";
			$resultati=mysqli_query($lidh,$sql);
			$rreshti=mysqli_fetch_array($resultati,MYSQLI_ASSOC);
			
			
			if(mysqli_num_rows($resultati) == 1)
			{
				$_SESSION['emriperdoruesit'] = $emriperdoruesit; 
				header("location: admin_shtepia.php"); 
			}else
			{
				$error = "Perdoruesi ose Fjalekalimi jane gabim.";
			}
		}
	}
?>