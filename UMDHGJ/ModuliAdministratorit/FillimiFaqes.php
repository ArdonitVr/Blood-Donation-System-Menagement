

	
		
				<?php
            $resultati = mysqli_query($lidh_fill, "CALL selekto_fill()");
            while ($rreshti = mysqli_fetch_assoc($resultati)) {

              extract($rreshti);
			  
			  
if($resultati==null)
  mysqli_free_result($resultati);

            ?>
				<header id="header" class="alt">
						<span class="logo"><img src="images/<?php echo $Skedar ?>" alt="" /></span><br>
						<br><h1><?php echo $Titulli ?></h1>
						<p></p><hr>
						
					</header>
					
				
		<?php } ?>