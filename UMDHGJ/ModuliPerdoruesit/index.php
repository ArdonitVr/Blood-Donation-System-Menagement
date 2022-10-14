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
			
					

						<!-- First Section -->
							<section id="first" class="main special">
								<!-- Php COOKIES -->
								<?php 
					$vizitat=1;
					if (isset($_COOKIE["vizitat"])) {
						$vizitat = (int)$_COOKIE["vizitat"];
					} $Month = 2592000 + time();

					setcookie("vizitat", date("F jS - g:i a"), $Month);
					if(isset($_COOKIE["vizitat"]))
					{
						$last = $_COOKIE["vizitat"];
						echo "<p style='text-align:right;'> Vizita juaj e fundit ishte me: " . $last. "</p>";
					}
					else
					{
						echo "<p style='text-align:right;'> Vizita juaj e pare ne uebaplikacionin tone! Ju deshirojme mirseardhje! </p>";
					}
					?>
								<header class="major">
									<h2>Dhuruesit sipas grupit te gjakut</h2>
								</header>
								<ul class="features">
											<?php
            $resultati = mysqli_query($lidh_dh, "CALL selekto_dh()");
            while ($rreshti = mysqli_fetch_assoc($resultati)) {

              extract($rreshti);
			  
			  
if($resultati==null)
  mysqli_free_result($resultati);

            ?>
									
									<li>
										<blockquote><span class="image fit"><?php echo '<img src="data:image/jpeg;base64,'.base64_encode( $rreshti['Foto_dh'] ).'" width="100%" height="100%">'; ?></span>
										<h3>Emri dhe Mbiemri: <?php echo $Emri_dhuruesit .' '. $Mbiemri_dhuruesit; ?></h3>
										<p>Mosha: <?php echo $Mosha_dhuruesit ?><br>
										Adresa: <?php echo $Adresa_dhuruesit ?><br>
										Grupi i Gjakut: <?php echo $GrupiGjakut ?></p></blockquote>
									</li>
									
								<?php } ?></ul>
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