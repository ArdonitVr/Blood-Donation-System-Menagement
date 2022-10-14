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
					<?php include_once("meny.php"); ?>
				<!-- Main -->
				<div id="main">
					<section>
										<blockquote><h2>Forma per Kontakt</h2>
											<div class="box">
										<form method="post" action="shtokontakt.php">
											<div class="row gtr-uniform">
												<div class="col-6 col-12-xsmall">
													<input type="text" name="Subjekti" id="Subjekti" value="" placeholder="Subjekti" />
												<br>
												<div class="row gtr-uniform">
												<div class="col-12">
													<textarea name="Mesazhi" id="Mesazhi" placeholder="Mesazhi" rows="6"></textarea><br>
												<div class="col-6 col-12-xsmall">
													<input type="email" name="Email" id="Email" value="" placeholder="Email-i" />
													<div class="col-12">
														<br>
													<ul class="actions">
														<li><input type="submit" name="shtokontakt" value="Dergo Mesazh" class="primary" /></li></ul>
												</div>
											</div>
										</form></div>
									</blockquote>
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