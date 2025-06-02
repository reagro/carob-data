:orphan:

Done
====

.. raw:: html

	<head>
	  <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	  <script src="https://cdn.datatables.net/2.0.7/js/dataTables.js"></script>
	  <link rel="stylesheet" href="https://cdn.datatables.net/2.0.7/css/dataTables.dataTables.css" />
	</head>

	<style>
	.container {
		display: inline-block;
		vertical-align: top;
	}
	.inline-paragraph {
		display: inline;
	}
	</style>


	Below is table with datasets that have been standardized by the <em>Carob</em> project. You can filter by data-providing institute.
	</br></br>

	<div class="container">
		<select id="providerFilter">
			<option value="">All institutes</option>
		</select>
		&nbsp;&nbsp;
		<p class="inline-paragraph", id="txtOutput"></p>
	</div>

	</br>
	</br>
	
	You can use the search box to find data for specific crops and countries. 
	
	  <table id="myTable" class="display" style="width:100%">
		  <thead>
			  <tr>
				  <th>data</th>
			  </tr>
		  </thead>
		  <tbody>
			  <!-- DataTables fills this -->
		  </tbody>
	  </table>


	  <script>

		var institutes = {"name":["ABC","AfricaRice","ARC","ARARI","CIAT","CIMMYT","CIP","CIRAD","CRS","EIAR","ETHZ","GT","GMOFA","GAUG","ICARDA","ICRAF","ICRISAT","ISRIC","IFPRI","IITA","ILRI","IRRI","LUANAR","MSU","OAF","SARC","SARI","SUA","TARI","TLC","UCD","UNL","UMD","USDA-ARS","UZIM","WUR","ZARI"],"longname":["Alliance of CIAT and Bioversity","Africa Rice Center","Agricultural Research Council of South Africa","Amhara Regional Agricultural Research Institute","Centro Internacional de Agricultura Tropical","International Maize and Wheat Improvement Center","International Potato Center","Centre de Coopération Internationale en Recherche Agronomique pour le Développement","Catholic Relief Services","Ethiopian Institute of Agricultural Research","ETH Zürich","Grassroots Trust","Ministry of Food and Agriculture, Ghana","Georg-August-Universität Göttingen","International Center for Agricultural Research in the Dry Areas","World Agroforestry Center","International Crops Research Institute for the Semi-Arid Tropics","International Soil Reference and Information Centre","International Food Policy Research Institute","International Institute of Tropical Agriculture","International Livestock Research Institute","International Rice Research Institute","Lilongwe University of Agriculture & Natural Resources","Michigan State Univeristy","One Acre Fund","South Africa Agricultural Research Council","Selian Agricultural Research Institute","Sokoine University of Agriculture","Tanzania Agricultural Research Institute","Total Land Care","University of California, Davis","University of Nebraska-Lincoln","Univeristy of Maryland","United States Department of Agriculture, Agricultural Research Service","University of Zimbabwe","Wageningen University & Research","Zambian Agriculture Research Institute"],"URL":["alliancebioversityciat.org","africarice.org","arc.agric.za","arari.gov.et","alliancebioversityciat.org","cimmyt.org","cipotato.org","cirad.fr","crs.org","eiar.gov.et","ethz.ch","grassrootstrust.co.nz","mofa.gov.gh","uni-goettingen.de","icarda.org","cifor-icraf.org","icrisat.org","isric.org","ifpri.org","iita.org","ilri.org","irri.org","luanar.ac.mw","msu.edu","oneacrefund.org","arc.agric.za","tari.go.tz/centres/tari-selian","sua.ac.tz","tari.go.tz","totallandcare.net","ucdavis.edu","unl.edu","umd.edu","ars.usda.gov","www.uz.ac.zw","wur.nl","zari.gov.zm"],"dataURL":["","dataverse.harvard.edu/dataverse/AfricaRice","","","dataverse.harvard.edu/dataverse/CIAT","data.cimmyt.org","data.cipotato.org","dataverse.cirad.fr","","","","","","data.goettingen-research-online.de","data.mel.cgiar.org","data.worldagroforestry.org","data.worldagroforestry.org","","dataverse.harvard.edu/dataverse/IFPRI","data.iita.org","data.ilri.org","dataverse.harvard.edu/dataverse/IRRI","","","","","","","","","","","","","","research.wur.nl/en/datasets/",""]}

		$(document).ready(function() {
			var table; 
			const urlParams = new URLSearchParams(window.location.search);
			const pInst = urlParams.get('inst');
			console.log(pInst);

			$.ajax({
				url: "https://carob-data.org/_static/providers.json", 
				dataType: "json", 
				success: function(json) {
					var data = json.data; 

					// Initialize DataTables
					table = $('#myTable').DataTable({
						pageLength: 25,
						language: {	
							"lengthMenu": "Show _MENU_ items",
							"infoFiltered": "" //"(Filtered from _MAX_ records)"
						},
						data: data, 
						columns: [
							{"data": "data_institute", "visible": false, "searchable": true},
							{"data": "dataset"},
							{"data": "crops", "visible": false, "searchable": true},
							{"data": "countries", "visible": false, "searchable": true}
						]
					});

					// Populate the select dropdown
					var select = $('#providerFilter');
					const uniqueProviders = institutes.name
					// uniqueProviders.sort();
					for (var i = 0; i < uniqueProviders.length; i++) {
						var str = uniqueProviders[i];
						if ((!str.includes(";")) && (str !== "")) {
							select.append('<option value="' + str + '">' + str + '</option>');
						}
					}
					
					const index = institutes.name.indexOf(pInst);
					if (index >= 0) {
						select.val(pInst);
						table.column(0).search(pInst).draw();
						$('#txtOutput').html('<a href="https://' + institutes.URL[index] + '">' + institutes.longname[index] + "</a>");
					}
					console.log(institutes.name); 

				}
			});

			$(document).on('change', '#providerFilter', function() {
				var val = $.fn.dataTable.util.escapeRegex($(this).val());
				table.column(0).search(val).draw();
				const index = institutes.name.indexOf(val);
				if (index >= 0) {
					$('#txtOutput').html('<a href="https://' + institutes.URL[index] + '">' + institutes.longname[index] + "</a>");   
				} else {
					$('#txtOutput').text("");
				}
			});	
		});

	</script>
	  
