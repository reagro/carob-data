Download
========

Compile and download a *Carob* dataset

.. raw:: html
    <embed>

	<label for="data-select">Choose a dataset:</label>
	<select name="data-select" id="data-select">
		<option value=""></option>
		<option value="fertilizer">Fertilizer</option>
	</select>
	</br></br>
	<input type="checkbox" id="license" name="license-box" value="license">
	Accept <a href="licenses.html">licenses</a>

	</br></br>	
	<button onclick = "make_link()">OK</button> 
	<p> 
	  <div id = "prog">
	  <progress hidden="hidden" id="progress" max="100" value="0"></progress>
	  </div>
      <div id = "result">&nbsp;</div> 
	</p> 
	
	</br></br>

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
				var linktxt = '<a href="down.zip">Download data: '.concat(name);
				document.getElementById("result").innerHTML = linktxt;
			}
		}
		
		
		function make_link() { 
			var e = document.getElementById("data-select");
			var value = e.value;
			var text = e.options[e.selectedIndex].text;
			document.getElementById("result").innerHTML = "";
			if (text == "") {
				//document.getElementById("result").innerHTML = "1";
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



Alternatively, you can also download the raw data, and process it, on your own computer by cloning the *Carob*
`repo <https://github.com/reagro/carob/>`_ 

