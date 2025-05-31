:orphan:

Done
====

.. raw:: html

	<head>
	  <title>DataTables with JSON Data</title>
	  <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	  <script src="https://cdn.datatables.net/2.0.7/js/dataTables.js"></script>
	  <link rel="stylesheet" href="https://cdn.datatables.net/2.0.7/css/dataTables.dataTables.css" />
	</head>

	These are the datasets that have been standardized by the <em>Carob</em> project. You can filter by data-providing institute. You can use the search box to find data for specific crops and countries. 

	</br></br>

	<select id="providerFilter">
		<option value="">All institutes</option>
	</select>
	</br>
	
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

		function getUniqueValues(arr, variableName) {
		  if (!Array.isArray(arr) || arr.length === 0) {
			return [];
		  }

		  const seenValues = new Set();
		  const uniqueValues = [];

		  for (const obj of arr) {
			if (obj && obj.hasOwnProperty(variableName)) {
			  const value = obj[variableName];
			  if (!seenValues.has(value)) {
				seenValues.add(value);
				uniqueValues.push(value);
			  }
			}
		  }
		  return uniqueValues;
		}

		$(document).ready(function() {
			var table; 

			$.ajax({
				url: "https://carob-data.org/_static/providers.json", 
				dataType: "json", 
				success: function(json) {
					var data = json.data; 

					// Populate the select dropdown
					var select = $('#providerFilter');
					const uniqueProviders = getUniqueValues(data, 'data_institute');
					uniqueProviders.sort();
					for (var i = 0; i < uniqueProviders.length; i++) {
						var str = uniqueProviders[i];
						if ((!str.includes(";")) && (str !== "")) {
							select.append('<option value="' + str + '">' + str + '</option>');
						}
					}
					// Initialize DataTables
					table = $('#myTable').DataTable({
						pageLength: 25,
						language: {	"lengthMenu": "Show _MENU_ items"},				
						data: data, 
						columns: [
							{"data": "data_institute", "visible": false, "searchable": true},
							{"data": "dataset"},
							{"data": "crops", "visible": false, "searchable": true},
							{"data": "countries", "visible": false, "searchable": true}
						]
					});
				}
			});

			$(document).on('change', '#providerFilter', function() {
				console.log('Select change event fired 1');
				var val = $.fn.dataTable.util.escapeRegex($(this).val());
				console.log('Selected value:', val);
				table.column(0).search(val).draw();
			});

		});

	</script>
	  
