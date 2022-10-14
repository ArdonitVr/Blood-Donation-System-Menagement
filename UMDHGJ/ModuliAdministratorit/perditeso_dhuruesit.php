<?php
	include("kontrollimi.php");	
?>

<?php

include_once("konfigurimi.php");

if(isset($_POST['perditeso_dhuruesit']))
{	
	$ID_dhuruesit = $_POST['ID_dhuruesit'];
	$Emri_dhuruesit = $_POST['Emri_dhuruesit'];
	$Mbiemri_dhuruesit = $_POST['Mbiemri_dhuruesit'];
	$Mosha_dhuruesit = $_POST['Mosha_dhuruesit'];
	$Adresa_dhuruesit = $_POST['Adresa_dhuruesit'];
	
	$ID_GrupiGjakut = $_POST['ID_GrupiGjakut'];	
	
	$Foto_dh =addslashes (file_get_contents($_FILES['Foto_dh']['tmp_name']));
	$Emri_Fotos=$_FILES['Foto_dh']['name'];
	$maxsize = 10000000; 
	
	
	if(empty($Emri_dhuruesit) || empty($Mbiemri_dhuruesit)|| empty($Mosha_dhuruesit) || empty($Adresa_dhuruesit)) {
				
		if(empty($Emri_dhuruesit)) {
			echo "<font color='red'>Emri Dhuruesit eshte e zbrazet.</font><br/>";
		}
		
		if(empty($Mbiemri_dhuruesit)) {
			echo "<font color='red'> Mbiemri Dhuruesit eshte e zbrazet.</font><br/>";
		}
		
		if(empty($Mosha_dhuruesit)) {
			echo "<font color='red'>Mosha Dhuruesit eshte e zbrazet.</font><br/>";
		}
		if(empty($Adresa_dhuruesit)) {
			echo "<font color='red'>Adresa Dhuruesit eshte e zbrazet.</font><br/>";
		}
		
		
		
	} else {
	    mysqli_query($lidh_perditeso_dhuruesit,"SET @ID_dhuruesit=${ID_dhuruesit}");
	    mysqli_query($lidh_perditeso_dhuruesit,"SET @ID_GrupiGjakut=${ID_GrupiGjakut}");
		mysqli_query($lidh_perditeso_dhuruesit,"SET @Emridh='${Emri_dhuruesit}'");
		mysqli_query($lidh_perditeso_dhuruesit,"SET @Mbiemridh='${Mbiemri_dhuruesit}'");
		mysqli_query($lidh_perditeso_dhuruesit,"SET @Moshadh='${Mosha_dhuruesit}'");
		mysqli_query($lidh_perditeso_dhuruesit,"SET @Adresadh='${Adresa_dhuruesit}'");
		mysqli_query($lidh_perditeso_dhuruesit,"SET @Fotodh='${Foto_dh}'");
		mysqli_query($lidh_perditeso_dhuruesit,"SET @Emrifotosdh='${Emri_Fotos}'");			
		
		$resultati = mysqli_query($lidh_perditeso_dhuruesit,"CALL perditeso_dhuruesit(@Emridh,@Mbiemridh,@Moshadh,@Adresadh,@ID_GrupiGjakut,@Fotodh,@Emrifotosdh,@ID_dhuruesit)");
		if($resultati)
		{
		header("Location: menaxho_dhuruesit.php");
		}else
		{
			die("Procedura nuk mund te ekzekutohet");
		}
		
		
	}
}
?>
<?php

$ID_dhuruesit = $_GET['ID_dhuruesit'];


$resultati = mysqli_query($lidh_selekto_perditesodhuruesit,"CALL selekto_perditesodhuruesit('$ID_dhuruesit')");

while($res = mysqli_fetch_array($resultati))
{
	$Emri_dhuruesi = $res['Emri_dhuruesit'];
	$Mbiemri_dhuruesi = $res['Mbiemri_dhuruesit'];
	$Mosha_dhuruesi = $res['Mosha_dhuruesit'];
	$Adresa_dhuruesi = $res['Adresa_dhuruesit'];	
	$ID_GrupiGjakut = $res['ID_GrupiGjakut'];
}
?>


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
								<form enctype="multipart/form-data" action="perditeso_dhuruesit.php" method="post" name="form">
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
													<input type="text" name="Emri_dhuruesit" id="Emri_dhuruesit" placeholder="Emri Dhuruesitt" value='<?php echo $Emri_dhuruesi;?>' required />
													<br>
													Mbiemri
													<input type="text" name="Mbiemri_dhuruesit" id="	Mbiemri_dhuruesit"  placeholder="Mbiemri Dhuruesit" value='<?php echo $Mbiemri_dhuruesi;?>' required />
													<br>
													Mosha
													<input type="text" name="Mosha_dhuruesit" id="Mosha_dhuruesit"  placeholder="Mosha Dhuruesit" value='<?php echo $Mosha_dhuruesi;?>' required/>
													<br>
													Adresa
													<input type="text" name="Adresa_dhuruesit" id="	Adresa_dhuruesit" placeholder="Adresa Dhuruesit" value='<?php echo              $Adresa_dhuruesi;?>' required />
													<br>
													Foto
													<input type="hidden" name="Emri_Fotos" value="10000000" />
													<input name="Foto_dh" type="file" />
													<br>
													<input type="hidden" name="ID_dhuruesit" value='<?php echo $_GET['ID_dhuruesit'];?>' />
													<br><br>
													<ul class="actions">
														<li><input type="submit" name="perditeso_dhuruesit" value="shto"  class="primary small" /></li></ul>
													
												</div>
												  
												
				</form>
			
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