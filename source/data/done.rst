:orphan:

Explore and filter
==================

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


	Below is table with datasets that have been standardized by the <em>Carob</em> project. You can filter by data-providing organization.
	</br></br>

	<div class="container">
		<select id="providerFilter">
			<option value="">All organizations</option>
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

		var organizations = {"name":["ABC","AfricaRice","ANU","ARC","ARARI","CAAS","CIAT","CIMMYT","CIP","CIRAD","CRS","CSU","EIAR","ETHZ","GT","GMOFA","GAU","GU","IAU","ICARDA","ICRAF","ICRISAT","IER","ISRIC","IFPRI","IITA","ILRI","IRRI","LLNM","LUANAR","MSU","OAF","SARC","SARI","SIU","SU","SUA","TARI","TLC","USDA-ARS","UCB","UCD","UNL","UMD","UO","UQ","UWM","UZIM","UPS","WUR","ZARI"],"longname":["Alliance Bioversity and CIAT","Africa Rice Center","Australian National Univeristy","Agricultural Research Council of South Africa","Amhara Regional Agricultural Research Institute","Chinese Academy of Agricultural Sciences","Centro Internacional de Agricultura Tropical","International Maize and Wheat Improvement Center","International Potato Center","Centre de Coopération Internationale en Recherche Agronomique pour le Développement","Catholic Relief Services","Colorado State University","Ethiopian Institute of Agricultural Research","ETH Zürich","Grassroots Trust","Ministry of Food and Agriculture, Ghana","Georg-August-Universität Göttingen","Guangxi University","Islamic Azad University","International Center for Agricultural Research in the Dry Areas","World Agroforestry Center","International Crops Research Institute for the Semi-Arid Tropics","Institut d'Economie Rurale","International Soil Reference and Information Centre","International Food Policy Research Institute","International Institute of Tropical Agriculture","International Livestock Research Institute","International Rice Research Institute","Lawrence Livermore National Laboratory","Lilongwe University of Agriculture & Natural Resources","Michigan State Univeristy","One Acre Fund","South Africa Agricultural Research Council","Selian Agricultural Research Institute","Southern Illinois University, Carbondale","Stellenbosch University","Sokoine University of Agriculture","Tanzania Agricultural Research Institute","Total Land Care","United States Department of Agriculture, Agricultural Research Service","University of California, Berkeley","University of California, Davis","University of Nebraska, Lincoln","Univeristy of Maryland","University of Oregon","University of Queensland","University of Wisconsin, Madison","University of Zimbabwe","Université Paris-Saclay","Wageningen University & Research","Zambian Agriculture Research Institute"],"URL":["alliancebioversityciat.org","africarice.org","anu.edu.au","arc.agric.za","arari.gov.et","caas.cn","alliancebioversityciat.org","cimmyt.org","cipotato.org","cirad.fr","crs.org","","eiar.gov.et","ethz.ch","grassrootstrust.co.nz","mofa.gov.gh","uni-goettingen.de","www.gxu.edu.cn","iau.ir","icarda.org","cifor-icraf.org","icrisat.org","ier.ml","isric.org","ifpri.org","iita.org","ilri.org","irri.org","llnl.gov","luanar.ac.mw","msu.edu","oneacrefund.org","arc.agric.za","tari.go.tz/centres/tari-selian","siu.edu","www.sun.ac.za","sua.ac.tz","tari.go.tz","totallandcare.net","uq.edu.au","berkeley.edu","ucdavis.edu","unl.edu","umd.edu","uoregon.edu","uq.edu.au","wisc.edu","www.uz.ac.zw","universite-paris-saclay.fr","wur.nl","zari.gov.zm"],"dataURL":["","dataverse.harvard.edu/dataverse/AfricaRice","","","","","dataverse.harvard.edu/dataverse/CIAT","data.cimmyt.org","data.cipotato.org","dataverse.cirad.fr","","","","","","","data.goettingen-research-online.de","","","data.mel.cgiar.org","data.worldagroforestry.org","data.worldagroforestry.org","","","dataverse.harvard.edu/dataverse/IFPRI","data.iita.org","data.ilri.org","dataverse.harvard.edu/dataverse/IRRI","","","","","","","","","","","","","","","","","","","","","","research.wur.nl/en/datasets/",""],"ROR":["04xsxqp89","040y9br29","","04r1s2546","01vwxpj86","0313jb750","037wny167","04d4vcg59","05asvgp75","05kpkpg04","05xm0ec82","","01mhm6x57","05a28rw58","","056e86068","01y9bpm73","","","","","","","","","","","","","","","","","","","","","","","","","05rrcem69","","","","","","","","",""]}

		$(document).ready(function() {
			var table; 
			const urlParams = new URLSearchParams(window.location.search);
			const pInst = urlParams.get('org');
			//console.log(pInst);

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
							{"data": "data_organization", "visible": false, "searchable": true},
							{"data": "dataset"},
							{"data": "crops", "visible": false, "searchable": true},
							{"data": "countries", "visible": false, "searchable": true}
						]
					});

					// Populate the select dropdown
					var select = $('#providerFilter');
					const uniqueProviders = organizations.name
					// uniqueProviders.sort();
					for (var i = 0; i < uniqueProviders.length; i++) {
						var str = uniqueProviders[i];
						if ((!str.includes(";")) && (str !== "")) {
							select.append('<option value="' + str + '">' + str + '</option>');
						}
					}
					
					const index = organizations.name.indexOf(pInst);
					if (index >= 0) {
						select.val(pInst);
						table.column(0).search("(?<![A-Za-z])" + pInst + "(?![A-Za-z])", true, false).draw();
						$('#txtOutput').html('<a href="https://' + organizations.URL[index] + '">' + organizations.longname[index] + "</a>");
					}
					console.log(organizations.name); 

				}
			});

			$(document).on('change', '#providerFilter', function() {
				var val = $.fn.dataTable.util.escapeRegex($(this).val());
				const index = organizations.name.indexOf(val);
				if (index >= 0) {
					table.column(0).search("(?<![A-Za-z])" + val + "(?![A-Za-z])", true, false).draw();
					$('#txtOutput').html('<a href="https://' + organizations.URL[index] + '">' + organizations.longname[index] + "</a>");   
				} else {
					table.column(0).search("").draw();
					$('#txtOutput').text("");
				}
			});	
		});

	</script>
	  
