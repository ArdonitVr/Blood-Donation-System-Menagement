<?php

	include("kontrollimi.php");	
?>
<!DOCTYPE HTML>
<!--
	Stellar by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->

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
									<h2>Menaxhimi i te dhenave te Perdoruesve</h2>
								</header>
								<ul class="features">
									<li>
										<a href="shto_perdorues.php"><span  class="icon major style3 fa-copy"></span></a>
										<h3>Shto Perdorues</h3>
										<p>Forma per shtimin e perdoruesve te rinje ne webaplikacion me te drejta te administratorit.</p>
									</li>
									<li>
										<a href="modifiko_perdorues.php"><span class="icon major style3 fa-copy"></span></a>
										<h3>Modifiko Perdorues</h3>
										<p>Forma per modifikim te te dhenave te perdoruesve aktual ne webaplikacion me te drejta te administratorit.</p>
									</li>
									<li>
										<a href="fshiej_perdorues.php"><span class="icon major style3 fa-copy"></span></a>
										<h3>Fshije Perdorues</h3>
										<p>Forma per fshirje te perdoruesve aktual nga webaplikacion</p>
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