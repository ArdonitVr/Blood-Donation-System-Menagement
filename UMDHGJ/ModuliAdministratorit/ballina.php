<?php
include('kontrollimi.php');
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
					<?php include_once("meny.php"); ?>
					
				<!-- Main -->
					<div id="main">

						<!-- Introduction -->
						<section id="first" class="main special">
							<p style="text-align:right;">Përshëndetje, <em><?php  echo $hyerje_perdoruesit;?>!</em></p>
								<header class="major">
									<h2>Menaxhimi i te dhenave te Ballines</h2>
								</header>
								<ul class="features">
									<li>
										<a href="menaxho_grupetegjakut.php"><span  class="icon major style3 fa-copy"></span></a>
										<h3>Menaxho Grupet e Gjakut</h3>
										<p>Forma per menaxhimin e grupeve te gjakut ne webaplikacion</p>
									</li>
									<li>
										<a href="menaxho_dhuruesit.php"><span class="icon major style3 fa-copy"></span></a>
										<h3>Menaxho Dhuruesit</h3>
										<p>Forma per menaxhimin e dhuruesve ne webaplikacion</p>
									</li>
									<li>
										<a href="modifiko_tedhenat.php"><span class="icon major style3 fa-copy"></span></a>
										<h3>Menaxho te Dhenat</h3>
										<p>Forma per menaxhimin e te dhenave ne webaplikacion</p>
									</li>
								</ul>

			
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