.. raw:: html

   <div style="visibility: hidden;">

Data
====

.. raw:: html

   </div>
   <div style="visibility: visible;">

.. raw:: html
   :file: _R/compiled.html


From this page you can download the compiled data with a Creative Commons `license <licenses.html>`_. You can create the full datasets yourself by following these `instructions <compile.html>`__. 

Please note that the data available here are new. They represent our first attempt to standardize widely variable data with lots of data quality issues. The data still contains errors from the original data that remain, and likely also errors that we have introduced. 

Our aim is to provide cleaner and better documented datasets sometime in 2025.


.. raw:: html

	</br>
    <embed>
	<label for="data-select">group:</label>
	<select name="data-select" id="data-select">
		<option value=""></option>
		<option value="agronomy">agronomy</option>
		<option value="pest_diseases">pest_diseases</option>
		<option value="soil_samples">soil_samples</option>
		<option value="survey">survey</option>
		<option value="varieties">varieties</option>
		<option value="varieties_cassava">varieties_cassava</option>
		<option value="varieties_cowpea">varieties_cowpea</option>
		<option value="varieties_maize">varieties_maize</option>
		<option value="varieties_wheat">varieties_wheat</option>
	</select>

	</br></br>	
   
	<div><input type="radio" id="format_csv" name="format" value="csv" checked>.csv (Comma Separated Values)</div>
	<div><input type="radio" id="format_xls" name="format" value="xls">.xlsx (Excel)</div>

	</br>
	
	<button onclick = "make_link()">OK</button> 
	<p> 
	  <div id = "prog">
	  <progress hidden="hidden" id="progress" max="100" value="0"></progress>
	  </div>
      <div id = "result">&nbsp;</div> 
	</p> 

	<script> 
		function move(i, name) {
			var id = document.getElementById("progress"); 
			if (i < 100) {
				id.value=i;
				i++;
				setTimeout(function() { move(i, name) }, 10);
			} else {
				id.value=0;
				id.setAttribute("hidden", "hidden");
				//if (document.getElementById('cclicense').checked) {
					name = name.concat("-CC");
				//}
				var linktxt = 'Download: <a href="https://geodata.ucdavis.edu/carob/carob_';
				if (document.getElementById("format_csv").checked) {
					linktxt = linktxt.concat(name.toLowerCase()).concat('.zip">');
				} else {
					linktxt = linktxt.concat(name.toLowerCase()).concat('.xlsx">');				
				}
				linktxt = linktxt.concat(name).concat('</a>');
				document.getElementById("result").innerHTML = linktxt;
			}
		}
		
		function make_link() { 
			var e = document.getElementById("data-select");
			var value = e.value;
			var text = e.options[e.selectedIndex].value;
			if (text == "") {
				document.getElementById("result").innerHTML = "Choose a group";
			} else { // if (document.getElementById('license').checked) {
				document.getElementById("result").innerHTML = "processing";
				var pid = document.getElementById("progress"); 
				pid.removeAttribute("hidden");
				setTimeout(move(0, text), 1000); 
			}
			/*
			} else {
				document.getElementById("result").innerHTML = "You must accept the licenses";
			}
			*/
		} 	
	</script>
    </embed>



The **groups** make it easier for us to organize our work but it is important to note that they are not mutually exclusive. For example, the first place to look for crop response to fertilizer data would be in the "agronomy" group. However, the "survey", and "varieties" groups may also contain fertilizer application data. Likewise, the "varieties" data are about comparing crop varieties, but variety names are also reported in the "agronomy" group. This means that you may want to consider using data from multiple groups. The maize and wheat varieties have their own groups because of the large amount of data in these groups, and because they have some unique terms.


.. raw:: html

   </div>
