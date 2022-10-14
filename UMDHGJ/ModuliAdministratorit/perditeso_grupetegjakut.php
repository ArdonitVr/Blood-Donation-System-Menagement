<?php
	include("kontrollimi.php");	
?>
<?php
include_once("konfigurimi.php");

if(isset($_POST['perditeso_grupetegjakut']))
{	
	$ID_GrupiGjakut = $_POST['ID_GrupiGjakut'];
	
	$GrupiGjakut=$_POST['GrupiGjakut'];
	
	if(empty($GrupiGjakut) ) {	
			
		if(empty($GrupiGjakut)) {
			echo "<font color='red'>Fusha GrupiGjakut eshte e zbrazet.</font><br/>";
		}
		} else {	
		             mysqli_query($lidh_pgj,"SET @idg = ${ID_GrupiGjakut}");
		             mysqli_query($lidh_pgj,"SET @grgj = '${GrupiGjakut}'");
		$resultati = mysqli_query($lidh_pgj,"CALL perditeso_pgj(@grgj,@idg)");
		
		if($resultati)
		{
		header("Location: menaxho_grupetegjakut.php");
		}else
		{
			die("Procedura nuk mund te ekzekutohet!");
		}
	}
}
?>
<?php
$p_ID_GrupiGjakut = $_GET['ID_GrupiGjakut'];
$resultati = mysqli_query($lidh_pg,"CALL selekto_pg('$p_ID_GrupiGjakut')");

while($res = mysqli_fetch_array($resultati))
{
	$GrupiGjakut = $res['GrupiGjakut'];
	
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
									<h2>Modifiko te dhenat e Grupeve te Gjakut</h2>
								</header>
								<div class="box">
								<form GrupiGjakut="form1" method="post" action="perditeso_grupetegjakut.php">
											<div class="row gtr-uniform">
												<div class="col-6 col-12-xsmall">
													<input type="text" name="GrupiGjakut" value='<?php echo $GrupiGjakut;?>'   required />
													<input type="hidden" name="ID_GrupiGjakut" value='<?php echo $_GET['ID_GrupiGjakut'];?>' />
													<br>
													<ul class="actions">
														<li><input type="submit" class="primary small" name="perditeso_grupetegjakut" value="Modifiko"></li></ul>
													
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
