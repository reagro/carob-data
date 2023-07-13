Download
========

Compile and download a *Carob* dataset. Currently only the "Response to fertilizer" group is made available here, but more will follow. Note that here you can only download data that has a CC `license <licenses.html>`_. To compile all available data, and get the lastest updates, you can download and process the sources yourself. See the *Carob* github `repo <https://github.com/reagro/carob/>`_ for instructions.

Note that the data here are a rough first attempt. It will likely have some errors. We are aiming to have a set of much cleaner and better documented datasets available by the end of 2023.

.. raw:: html

    <embed>
	<label for="data-select">Choose a dataset:</label>
	<select name="data-select" id="data-select">
		<option value=""></option>
		<option value="fertilizer">Fertilizer</option>
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
	</br>

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
			var text = e.options[e.selectedIndex].text;
			if (text == "") {
				document.getElementById("result").innerHTML = "Not a valid dataset";
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


