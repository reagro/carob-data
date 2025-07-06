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

		var organizations = {"name":["ABC","AfricaRice","ABU","AMDSL","APNI","ARARI","ARC","AAU","BARI","BRRI","BU","CAAS","CARS","CAU","CIAT","CIMMYT","CIP","CIRAD","CLU","COLSU","CREA","CRS","CU","EIAR","ETH","FENALCE","FOFIFA","GAU","GISS","GIZ","GMOFA","GT","GXU","HAU","HWU","IASU","IAU","ICAR","ICARDA","ICDF","ICRAF","ICRISAT","IER","IFA","IIAM","IITA","ILO","ILRI","INRAN","IPNI","IRD","IRRI","ISRIC","IWMI","JHU","JMU","KALRO","KEU","LLNL","LUANAR","LUH","MSU","NARC","NARL","NARO","NCSU","NDSU","OAF","OHSU","PSU","RAB","RDRS","SARC","SSSA","SARI","SIU","SUA","SUN","TARI","TLC","UAF","UAKS","UBKV","UCB","UCD","UED","UFL","UGTO","ICESI","UIUC","UKY","UMD","UMELB","UMINN","UNL","UOR","UPS","UQL","USH","UWM","UZIM","WHRC","WUR","ZALF","ZARI"],"longname":["Alliance of Bioversity and International Center for Tropical Agriculture","Africa Rice Center","Ahmadu Bello University","Agencia Mexicana para el Desarrollo Sustentable en Laderas","African Plant Nutrition Institute","Amhara Regional Agricultural Research Institute","Agricultural Research Council of South Africa","Aarhus Universitet","Bangladesh Agricultural Research Institute","Bangladesh Rice Research Institute","Boston University","Chinese Academy of Agricultural Sciences","Chitedze Agricultural Research Station","Christian-Albrechts-Universität zu Kiel","International Center for Tropical Agriculture","International Maize and Wheat Improvement Center","International Potato Center","Centre de Coopération Internationale en Recherche Agronomique pour le Développement","Clemson University","Colorado State University","Consiglio per la ricerca in agricoltura e l'analisi dell'economia agraria","Catholic Relief Services","Cornell University","Ethiopian Institute of Agricultural Research","ETH Zürich","Federación Nacional de Cultivadores de Cereales, Leguminosas y Soya","Centre National de la Recherche Appliquée au Developpement Rural","Georg-August-Universität Göttingen","Goddard Institute for Space Studies","Deutsche Gesellschaft für Internationale Zusammenarbeit","Ministry of Food and Agriculture, Ghana","Grassroots Trust","Guangxi University","Chaudhary Charan Singh Haryana Agricultural University","Hawassa University","Iowa State University","Islamic Azad University","Indian Council of Agricultural Research","International Center for Agricultural Research in the Dry Areas","International Cooperation and Development Fund","World Agroforestry Center","International Crops Research Institute for the Semi-Arid Tropics","Institut d'Economie Rurale","International Fertilizer Association","Instituto de Investigação Agrária de Moçambique","International Institute of Tropical Agriculture","International Labour Organization","International Livestock Research Institute","Institut National de la Recherche Agronomique du Niger","International Plant Nutrition Institute","Institut de Recherche pour le Développement","International Rice Research Institute","International Soil Reference and Information Centre","International Water Management Institute","James Hutton Institute","Julius-Maximilians-Universität Würzburg","Kenya Agricultural and Livestock Research Organization","Kenyatta University","Lawrence Livermore National Laboratory","Lilongwe University of Agriculture & Natural Resources","Leibniz Universität Hannover","Michigan State University","Nepal Agricultural Research Council","National Agricultural Research Laboratories","National Agricultural Research Organization","North Carolina State University","North Dakota State University","One Acre Fund","The Ohio State University","Pennsylvania State University","Rwanda Agriculture and Animal Resources Development Board","Rangpur Dinajpur Rural Service","Agricultural Research Council of South Africa","Scuola Superiore Sant'Anna","Selian Agricultural Research Institute","Southern Illinois University, Carbondale","Sokoine University of Agriculture","Stellenbosch University","Tanzania Agricultural Research Institute","Total Land Care","University of Arkansas, Fayetteville","University of Arkansas System","Uttar Banga Krishi Viswavidyalaya","University of California, Berkeley","University of California, Davis","University of Edinburgh","University of Florida","Universidad de Guanajuato","Universidad Icesi","University of Illinois Urbana-Champaign","University of Kentucky","Univeristy of Maryland","University of Melbourne","University of Minnesota","University of Nebraska, Lincoln","University of Oregon","Université Paris-Saclay","University of Queensland","University of Sheffield","University of Wisconsin, Madison","University of Zimbabwe","Woodwell Climate Research Center","Wageningen University & Research","Leibniz Centre for Agricultural Landscape Research","Zambian Agriculture Research Institute"],"URL":["alliancebioversityciat.org","africarice.org","abu.edu.ng","","apni.net","arari.gov.et","arc.agric.za","au.dk","bari.gov.bd","brri.gov.bd","bu.edu","caas.cn","","uni-kiel.de","alliancebioversityciat.org","cimmyt.org","cipotato.org","cirad.fr","clemson.edu","colostate.edu","crea.gov.it","crs.org","cornell.edu","eiar.gov.et","ethz.ch","fenalce.co","fofifa.mg","uni-goettingen.de","giss.nasa.gov","giz.de","mofa.gov.gh","grassrootstrust.co.nz","www.gxu.edu.cn","hau.ernet.in","hu.edu.et","iastate.edu","iau.ir","icar.org.in","icarda.org","icdf.org.tw","cifor-icraf.org","icrisat.org","ier.ml","fertilizer.org","iiam.gov.mz","iita.org","ilo.org","ilri.org","inran.refer.ne","ipni.net","ird.fr","irri.org","isric.org","iwmi.org","hutton.ac.uk","uni-wuerzburg.de","kalro.org","ku.ac.ke","llnl.gov","luanar.ac.mw","uni-hannover.de","msu.edu","narc.org.np","naro.go.ug/naris/narl","naro.go.ug","ncsu.edu","ndsu.edu","oneacrefund.org","osu.edu","psu.edu","rab.gov.rw","rdrsbangladesh.org","arc.agric.za","santannapisa.it","tari.go.tz/centres/tari-selian","siu.edu","sua.ac.tz","www.sun.ac.za","tari.go.tz","totallandcare.net","uark.edu","uasys.edu","ubkv.ac.in","berkeley.edu","ucdavis.edu","www.ed.ac.uk","ufl.edu","ugto.mx","icesi.edu.co","illinois.edu","uky.edu","umd.edu","unimelb.edu.au","umn.edu","unl.edu","uoregon.edu","universite-paris-saclay.fr","uq.edu.au","sheffield.ac.uk","wisc.edu","www.uz.ac.zw","woodwellclimate.org","wur.nl","zalf.de","zari.gov.zm"],"dataURL":["","dataverse.harvard.edu/dataverse/AfricaRice","","","","","","","","","","","","","dataverse.harvard.edu/dataverse/CIAT","data.cimmyt.org","data.cipotato.org","dataverse.cirad.fr","","","","","","","","","","data.goettingen-research-online.de","","","","","","","","","","","data.mel.cgiar.org","","data.worldagroforestry.org","data.worldagroforestry.org","","","","data.iita.org","","data.ilri.org","","","dataverse.ird.fr","dataverse.harvard.edu/dataverse/IRRI","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","research.wur.nl/en/datasets/","",""],"ROR":["04xsxqp89","040y9br29","019apvn83","","","01vwxpj86","04r1s2546","01aj84f44","01n09m616","01zmzpt10","05qwgg493","0313jb750","","04v76ef78","037wny167","04d4vcg59","05asvgp75","05kpkpg04","037s24f05","03k1gpj17","0327f2m07","05xm0ec82","05bnh6r87","01mhm6x57","05a28rw58","","0579ray12","01y9bpm73","01cyfxe35","00q08t645","056e86068","","02c9qn167","0261g6j35","04r15fz20","04rswrd78","049g0t365","04fw54a43","02n2syw04","","01kmz4383","0541a3n79","01c5j0443","","05p3cb968","0556kt608","03tebpn36","01jxjwb74","00rnmt205","05dn5a810","051ykjw41","0593p4448","01z8yfp14","04vpcaw67","03rzp5127","00fbnyb24","00wawdr98","05p2z3x69","041nk4h53","0188qm081","0304hq317","00yfma824","05aqbwk58","","044aa1z42","04tj63d06","05h1bnb22","","00rs6vg23","04p491231","03nkkb025","","04r1s2546","025602r80","","049kefs16","00jdryp44","05bk57929","00h98p168","","05jbt9m15","05vvhh982","02c8fr539","01an7q238","05rrcem69","01nrxwf90","02y3ad647","058cjye32","02t54e151","047426m28","02k3smh20","00yfma824","01ej9dk98","017zqws13","043mer456","0293rh119","03s92mv58","00rqy9422","05krs5044","01y2jtd41","04ze6rb18","04cvvej54","04qw24q55","01ygyzs83","00vz50m28"]}
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
	  
