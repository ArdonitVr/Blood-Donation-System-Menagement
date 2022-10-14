	<nav id="nav">	
		<?php
            $resultati = mysqli_query($lidh_menyA, "CALL  selekto_menyA()");
            while ($rreshti = mysqli_fetch_assoc($resultati)) {

              extract($rreshti);
			  	 echo $PershkrimiD;
			  
if($resultati==null)
  mysqli_free_result($resultati);

			}
            ?>