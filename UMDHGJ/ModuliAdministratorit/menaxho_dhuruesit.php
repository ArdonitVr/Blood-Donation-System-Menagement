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
									<h2>Shto te dhenat e Dhuruesit</h2>
								</header>
								<form enctype="multipart/form-data" action="shtodhurues.php" method="post">
											<div class="row gtr-uniform">
												<div class="col-6 col-12-xsmall">
													
													<select name="ID_GrupiGjakut" id="ID_GrupiGjakut">
													<option selected="selected">Zgjedh Grupin e Gjakut</option>
														<?php
														$res=mysqli_query($lidh_mdhuruesitgrgj,"CALL selekto_mdhuruesitgrgj()");
														while($rreshti=$res->fetch_array())
														{
															?>
															<option value="<?php echo $rreshti['ID_GrupiGjakut']; ?>"><?php echo $rreshti['GrupiGjakut']; ?></option>
															<?php
														}
														?>
												</select>
													Emri
													<input type="text" name="Emri_dhuruesit" id="Emri_dhuruesit" value="" placeholder="Emri Dhuruesitt" />
													<br>
													Mbiemri
													<input type="text" name="Mbiemri_dhuruesit" id="	Mbiemri_dhuruesit" value="" placeholder="Mbiemri Dhuruesit" />
													<br>
													Mosha
													<input type="text" name="Mosha_dhuruesit" id="Mosha_dhuruesit" value="" placeholder="Mosha Dhuruesit" />
													<br>
													Adresa
													<input type="text" name="Adresa_dhuruesit" id="Adresa_dhuruesit" value="" placeholder="Adresa Dhuruesit" />
													<br>
													Foto
													<input type="hidden" name="Emri_Fotos" value="10000000"/>
													<input name="Foto_dh" type="file"/>
													<br><br>
													<ul class="actions">
														<li><input type="submit" name="shtodhurues" value="shto"  class="primary small" /></li></ul>
													
												</div>
												  
											</div>

										</form>

									
									
								<header class="major">
									<h2>Kërko të dhënat e Dhuruesit për menaxhim</h2>
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
	 
	                           <input type="text" name="p_kusht" id="Emri ose Mbiemri" value="%" placeholder="Emri ose Mbiemri " />
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
                   	<tr>
	                                        <td>Emri</td>
											<td>Mbiemri</td>
											<td>Mosha</td>
											<td>Adresa</td>
											<td>Gr i Gjakut</td>
											
											<td>Foto</td>
											<td>Emri Fotos</td>
											
											<td>Modifiko</td>
											<td>Fshije</td>
										</tr> 
	              <?php
										if (!empty($_REQUEST['p_kusht'])) {

										$p_kusht = mysqli_real_escape_string($lidh,$_REQUEST['p_kusht']);     

										$sql = mysqli_query($lidh_mdhuruesitkrye,	
									"CALL selekto_mdhuruesitkrye('$p_kusht')"
										); 

										while($rreshti = mysqli_fetch_array($sql)) { 		
												echo "<tr>";
												echo "<td>".$rreshti['Emri_dhuruesit']."</td>";
												echo "<td>".$rreshti['Mbiemri_dhuruesit']."</td>";
												echo "<td>".$rreshti['Mosha_dhuruesit']."</td>";
												echo "<td>".$rreshti['Adresa_dhuruesit']."</td>";				
												echo "<td>".$rreshti['GrupiGjakut']."</td>";
												
												echo "<td><img src=data:image/jpeg;base64,".base64_encode($rreshti['Foto_dh'])." width='80'  height='100'/></td>";
												echo "<td>".$rreshti['Emri_Fotos']."</td>";	
												
												
												echo "<td><a href=\"perditeso_dhuruesit.php?ID_dhuruesit=$rreshti[ID_dhuruesit]\" class='button' class='button primary'>Modifiko</a> </td>";	
echo "<td><a href=\"fshiej_dhuruesit.php?ID_dhuruesit=$rreshti[ID_dhuruesit]\" onClick=\"return confirm('A jeni te sigurt se deshironi te fshini te dhenen?')\" class='button' class='button primary'>Fshijë</a> </td>";			
														
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