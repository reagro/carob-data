Download
========

Compile and download a *Carob* dataset. Currently only the "Response to fertilizer" dataset is made available here, but more will follow.

.. raw:: html
    <embed>

	<label for="data-select">Choose a dataset:</label>
	<select name="data-select" id="data-select">
		<option value=""></option>
		<option value="fertilizer">Fertilizer</option>
	</select>
	</br></br>
	<input type="checkbox" id="license" name="license-box" value="license">
	Accept <a href="licenses.html">licenses</a> </br>
	<input type="checkbox" id="cclicense" name="cc-license-box" value="cclicense">
	Creative Commons <a href="licenses.html">licensed</a> data only

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
				setTimeout(function() { move(i, name) }, 50);
			} else {
				id.value=0;
				id.setAttribute("hidden", "hidden");
				if (document.getElementById('cclicense').checked) {
					name = name.concat("-CC");
				}
				var linktxt = 'Download: <a href="https://geodata.ucdavis.edu/carob/carob-';
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
			document.getElementById("result").innerHTML = "";
			if (text == "") {
				document.getElementById("result").innerHTML = "Not a valid dataset";
			} else if (document.getElementById('license').checked) {
				var pid = document.getElementById("progress"); 
				pid.removeAttribute("hidden");
				setTimeout(move(0, text), 1000); 
			} else {
				document.getElementById("result").innerHTML = "You must accept the licenses";
			}
		} 
		
	</script>
	
    </embed>

Alternatively, you can also download the raw data, and process it on your own computer by cloning the *Carob*
`repo <https://github.com/reagro/carob/>`_ 

