Download
========

Compile and download CAROB data from our server

.. raw:: html
    <embed>

	<label for="data-select">Choose a dataset:</label>
	<select name="data-select" id="data-select">
		<option value=""></option>
		<option value="fertilizer">fertilizer</option>
	</select>

	<script> 
		function fun() { 
			var e = document.getElementById("data-select");
			var value = e.value;
			var text = e.options[e.selectedIndex].text;
			document.getElementById("result").innerHTML = "";
			if (text == "") {
				document.getElementById("result").innerHTML = "not a good selection";
			} else {
				window.location.href = 'download_compiled_data.html';
			}
		} 
	</script>
	</br></br>	
	<button onclick = "fun()">OK</button> 
	<p> 
      <div id = "result"> </div> 
	</p> 
	
	</br></br>
	
    </embed>




You can also compile CAROB on your own comptuer by cloning the CAROB
`repo <https://github.com/reagro/carob/>`_ and running

::

   remotes::install_github("reagro/carobiner")
   ff <- carobiner::make_carob(path)

where ``path`` is the folder of the cloned repo (e.g.
``"c:/github/carob"``)
