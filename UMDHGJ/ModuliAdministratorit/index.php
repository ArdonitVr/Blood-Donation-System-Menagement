<?php

	include('hyerje.php'); 
	if ((isset($_SESSION['emriperdoruesit']) != '')) 
	{
		header('Location: admin_shtepia.php');
	}	
?>
<!DOCTYPE HTML>
<!--
	Stellar by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<?php include_once("konfigurimi.php"); ?>
<html>
	<head>
		<title>Uebaplikacioni per Menaxhimin e Dhurimit te GJakut</title>
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
					
					
				<!-- Main -->
					<div id="main">

						<!-- Introduction -->

			<br><br><h2 style="text-align: center; font-family: bold;">Udhezim</h2>
			<p style="text-align: center;">Për t`u kycur në webaplikacion ju lutem kontaktone administratorin për krijimin e llogarisë</p>
					

						<!-- First Section -->
							<section id="content" class="main">
								
										<h2 style="text-align: center; font-family: bold;">Kyqja ne Uebaplikacion</h2>
										<div class="box">

										<form method="post" action="">
											<div class="row gtr-uniform">
												<div class="col-6 col-12-xsmall">
													<input type="text" name="emriperdoruesit" id="username" value="" placeholder="Perdoruesit" />
												</div><br><br>
												<div class="col-6 col-12-xsmall">
													<input type="password" name="fjalekalimi" id="password" value="" placeholder="Fjalekalimi"/>
												</div>
												<div class="col-12">
														<br>
													<ul class="actions">
														<li><input type="submit" name="kycy" value="Kycy" class="primary" /></li></ul>
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