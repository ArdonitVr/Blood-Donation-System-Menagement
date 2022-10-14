<?php

	include("kontrollimi.php");	
?>
<?php

include_once("konfigurimi.php");

if(isset($_POST['modifiko']))
{	
	$epid = $_POST['epid'];
	
	$emriperdoruesit=$_POST['emriperdoruesit'];
	$fjalekalimi=MD5($_POST['fjalekalimi']);
	$email=$_POST['email'];	
	
	
	if(empty($emriperdoruesit) || empty($fjalekalimi) || empty($email)) {	
			
		if(empty($emriperdoruesit)) {
			echo "<font color='red'>Fusha perdoruesit eshte e zbrazet.</font><br/>";
		}
		
		if(empty($fjalekalimi)) {
			echo "<font color='red'>Fusha fjalekalimit eshte e zbrazet.</font><br/>";
		}
		
		if(empty($email)) {
			echo "<font color='red'>Fusha e emailit eshte e zbrazet.</font><br/>";
		}		
	} else {	
		mysqli_query($lidh_perditesoperdoruesit,"SET @epid=${epid}");
		mysqli_query($lidh_perditesoperdoruesit,"SET @emriper='${emriperdoruesit}'");
		mysqli_query($lidh_perditesoperdoruesit,"SET @fjalekalimi='${fjalekalimi}'");
		mysqli_query($lidh_perditesoperdoruesit,"SET @email='${email}'");
		$resultati = mysqli_query($lidh_perditesoperdoruesit,"CALL perditeso_perdoruesit(@emriper,@fjalekalimi,@email,@epid)");
		if($resultati)
		{
		header("Location: modifiko_perdorues.php");	
		}else
		{
			die("Procedura nuk munnd te ekzekutohet!");
		}
		
		
	}
}
?>
<?php

$epid = $_GET['epid'];


$resultati = mysqli_query($lidh_p_perdoruesit,"CALL selekto_p_perdoruesit('$epid')");

while($res = mysqli_fetch_array($resultati))
{
	$emriperdoruesit = $res['emriperdoruesit'];
	$fjalekalimi = $res['fjalekalimi'];
	$email = $res['email'];
}
?>

<!DOCTYPE HTML>
<!--
	Stellar by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->

<html>
	<head>
		<title>Moduli i Administratorit</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
	</head>
	<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
				<?php include_once("FillimiFaqes.php"); ?>

				<!-- Nav -->
					<?php include_once("meny.php"); ?>
					
				<!-- Main -->
					<div id="main">

						
						<section id="first" class="main special">
							<p style="text-align:right;">Përshëndetje, <em><?php  echo $hyerje_perdoruesit;?>!</em></p>
								<header class="major">
									<h2>Modifiko të dhënat e përdoruesit</h2>
								</header>
								<div class="box">
								<form Perdoruesit="form1" method="post" action="perditeso_p.php">
											<div class="row gtr-uniform">
												<div class="col-6 col-12-xsmall">
													Përdoruesi
													<input type="text" name="emriperdoruesit" value='<?php echo $emriperdoruesit;?>'   required />
													<br>
													Fjalëkalimi
													<input type="text" name="fjalekalimi" value='<?php echo $fjalekalimi;?>'   required />
													<br>
													Email-i
													<input type="text" name="email" value='<?php echo $email;?>'   required />
													<br>
													<input type="hidden" name="epid" value='<?php echo $_GET['epid'];?>' />
													<br>
													<ul class="actions">
														<li><input type="submit" class="primary small" name="modifiko" value="Modifiko"></li></ul>

		

		</div>

							


					</div>
				</form>
			</div>
			</section>
		</div>

				<!-- Footer -->
				<?php include_once("FundiFaqes.php"); ?>
			</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>
												
