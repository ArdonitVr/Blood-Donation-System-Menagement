<?php
	include("kontrollimi.php");	
?>
<?php
include_once("konfigurimi.php");

if(isset($_POST['perditeso_tedhenat']))
{	
	$ID_teDhenat = $_POST['ID_teDhenat'];
	
	$Titulli=$_POST['Titulli'];
	$PershkrimiD=$_POST['PershkrimiD'];
	$Skedar=$_POST['Skedar'];	
		$PamjaeFaqes=$_POST['PamjaeFaqes'];	

	if(empty($Titulli) || empty($PershkrimiD) || empty($Skedar) || empty($PamjaeFaqes)){	
			
		if(empty($Titulli)) {
			echo "<font color='red'>Fusha e Titullit eshte e zbrazet.</font><br/>";
		}
		
		if(empty($PershkrimiD)) {
			echo "<font color='red'>Fusha e Pershkrimit eshte e zbrazet.</font><br/>";
		}
		
		if(empty($Skedar)) {
			echo "<font color='red'>Fusha e Skedarit eshte e zbrazet.</font><br/>";
		}	
	if(empty($PamjaeFaqes)) {
			echo "<font color='red'>Fusha PamjaeFaqes eshte e zbrazet.</font><br/>";
		}		
	} else {	
		mysqli_query($lidh_perditeso_tedhenat,"SET @ID_teDhenat=${ID_teDhenat}");
		mysqli_query($lidh_perditeso_tedhenat,"SET @Titulli='${Titulli}'");
		mysqli_query($lidh_perditeso_tedhenat,"SET @PershkrimiD='${PershkrimiD}'");
		mysqli_query($lidh_perditeso_tedhenat,"SET @Skedar='${Skedar}'");
		mysqli_query($lidh_perditeso_tedhenat,"SET @PamjaeFaqes='${PamjaeFaqes}'");
		$resultati = mysqli_query($lidh_perditeso_tedhenat,"CALL perditeso_tedhenat(@Titulli,@PershkrimiD,@Skedar,@PamjaeFaqes,@ID_teDhenat)");
		if($resultati)
		{
		header("Location: modifiko_tedhenat.php");
		}else
		{
			die("Procedura nuk mund te ekzekutohet!");
		}
		
		
	}
}
?>
<?php

$ID_teDhenat = $_GET['ID_teDhenat'];


$resultati = mysqli_query($lidh_perditesotedhenat,"CALL selekto_perditesotedhenat('$ID_teDhenat')");

while($res = mysqli_fetch_array($resultati))
{
	$Titullii = $res['Titulli'];
	$PershkrimiDD = $res['PershkrimiD'];
	$Skedari = $res['Skedar'];
		$PamjaeFaqess = $res['PamjaeFaqes'];
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
								<form teDhenat="form1" method="post" action="perditeso_tedhenat.php">
											<div class="row gtr-uniform">
												<div class="col-6 col-12-xsmall">
													Titulli
				                                     <input type="text" name="Titulli" value='<?php echo $Titullii;?>'   required />
													<br>
													Pershkrimi
				                                    <textarea name="PershkrimiD"  rows="10" cols="30"><?php echo $PershkrimiDD;?></textarea>
													<br>
													Emri i Skedarit
				                                    <input type="text" name="Skedar" value='<?php echo $Skedari;?>'   required />
				                                     <br >
				                                     Pamja e faqes
				                                     <input type="text" name="PamjaeFaqes" value='<?php echo $PamjaeFaqess;?>'   required />
				                                     <br >
													<input type="hidden" name="ID_teDhenat" value='<?php echo $_GET['ID_teDhenat'];?>' />
													<br>
													<ul class="actions">
														<li><input type="submit" class="primary small" name="perditeso_tedhenat" value="Modifiko"></li></ul>

		

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