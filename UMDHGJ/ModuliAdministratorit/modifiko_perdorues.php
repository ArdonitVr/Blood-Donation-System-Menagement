<?php
	include("kontrollimi.php");	
?>
<?php

include_once("konfigurimi.php");
$resultati = mysqli_query($lidh_mp,
"CALL selekto_mp()");
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

						<!-- Introduction -->
						<section id="first" class="main special">
														<p style="text-align:right;">Përshëndetje, <em><?php  echo $hyerje_perdoruesit;?>!</em></p>

									
								<header class="major">
									<h2>Kërko të dhënat e përdoruesit për modifikim</h2>
								</header>
								<form method="post" action="">
									<br>
    
	                         <table>
	                         <tr>
	                         </tr>
	                          <tr>
	                          <td>
	                          </td>
	                           <td>
	 
	                           <input type="text" name="p_kusht" id="p_kusht" value="%" placeholder="Përdoruesin ose Email-in" />
                              </td>
                              <td> 
                              <ul class="actions">
							 <li><input type="submit" name="" value="Kerko"  class="primary small" />
							 </li>
							</ul>
						   </td>
                          </tr>
                        </table> 
					</form>
					<div class="table-wrapper">
                   <table>
	              <td>Përdoruesi</td>
		<td>Fjalëkalimi</td>
		<td>Email-i</td>
		<td>Modifiko</td>
	              </tr> 

	              <?php
if (!empty($_REQUEST['p_kusht'])) {
$p_kusht = mysqli_real_escape_string
($lidh,$_REQUEST['p_kusht']);     
$sql = mysqli_query($lidh_mpkusht,
"CALL selekto_mpkusht('$p_kusht')"); 
while($rreshti = mysqli_fetch_array($sql)) { 		
		echo "<tr>";
		echo "<td>".$rreshti['emriperdoruesit']."</td>";
		echo "<td>".$rreshti['fjalekalimi']."</td>";
		echo "<td>".$rreshti['email']."</td>";	
		echo "<td><a href=\"perditeso_p.php?epid=$rreshti[epid]\" class='button' class='button primary'>
		Modifiko</a></td></tr>";		
	}

}

?>
				</div>
			</table>
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