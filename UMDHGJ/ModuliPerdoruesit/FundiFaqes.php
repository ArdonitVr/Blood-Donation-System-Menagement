<footer id="footer">
				
					<?php
            $resultati = mysqli_query($lidh_info, "CALL selektof_info()");
            while ($rreshti = mysqli_fetch_assoc($resultati)) {

              extract($rreshti);
			  
			  
if($resultati==null)
  mysqli_free_result($resultati);

            ?>
						<section>
							<h2><?php echo $Titulli ?></h2>
							<p><?php echo $PershkrimiD; ?>
							</p>
						
			<?php } ?>
									<?php
            $resultati = mysqli_query($lidh_rrs, "CALL selektof_rrs()");
            while ($rreshti = mysqli_fetch_assoc($resultati)) {

              extract($rreshti);
			  
			  
if($resultati==null)
  mysqli_free_result($resultati);

            ?>
						
							
							<?php echo $PershkrimiD; ?>
						</section>
			<?php } ?>
									<?php
            $resultati = mysqli_query($lidh_DHGJ, "CALL selektof_DHGJ()");
            while ($rreshti = mysqli_fetch_assoc($resultati)) {

              extract($rreshti);
			  
			  
if($resultati==null)
  mysqli_free_result($resultati);

            ?>
						<section>
							<h2><?php echo $Titulli ?></h2>
							<?php echo $PershkrimiD; ?>
						</section>
			<?php } ?>
					
					
												<?php
            $resultati = mysqli_query($lidh_pf, "CALL selekto_pf()");
            while ($rreshti = mysqli_fetch_assoc($resultati)) {

              extract($rreshti);
			  
			  
if($resultati==null)
  mysqli_free_result($resultati);

            ?>
					
					
							<p class="copyright"><?php echo $PershkrimiD; ?></p>
					
			<?php } ?>
						
					</div>
				</div>
			</footer>