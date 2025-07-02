Example script
==============


In *Carob*, we standardize datasets that can be automatically downloaded. Each original dataset gets its own *R* script. In this page we discuss an example script that standardizes the dataset `doi:10.21421/D2/STACVA <https://dataverse.icrisat.org/dataset.xhtml?persistentId=doi:10.21421/D2/STACVA>`__  by Hakeem Ayinde Ajeigbe and colleagues. This particular dataset is published on the `ICRISAT dataverse <https://dataverse.icrisat.org/>`__, which is on the `Harvard Dataverse <https://dataverse.harvard.edu/>`__. This is the most common platform used for sharing open agricultural research data.  

In this tutorial we use this dataset because its processing is not very complex. The full script is `available here  <https://raw.githubusercontent.com/carob-data/carob/refs/heads/master/scripts/agronomy/doi_10.21421_D2_STACVA.R>`__, please have a look at it now, before we explain it in detail.

When you write your own script, you can start from the script `template <https://github.com/carob-data/carob/blob/master/scripts/_template.R>`__
that is included in the ``scripts`` folder of the Carob repo.

If these are not your own data, it is of fundamental importance to first familiarize yourself with the goals of the research that created the dataset. Carefully read the "Description" section, and the metadata (Dataverse repositories include a convenient `Metadata
tab <https://dataverse.icrisat.org/dataset.xhtml?persistentId=doi:10.21421/D2/STACVA#datasetForm:tabView:metadataMapTab>`__). Also check the number of files and file types so that you know what to expect.

Each script should start with these two (commented with `#`) lines. The first one to clearly identify the purpose of the script and to specify the license saying that others can use and adapt the script for their own purposes as long as they share their work under the same license. 

.. code:: r

   # R script for "carob"
   # license: GPL (>=3)


You may add other general comments about the dataset that you deem important to note (also see `notes$meta`).

All actual *R* code is inside a ``carob_script`` function with argument `path`.

.. code:: r

   carob_script <- function(path) {

When you write your script, assign the folder where you cloned the *Carob* repo to this variable. For example 

.. code:: r
 
   path <- "d:/github/carob" 


But do not include this in the actual script. 

Next, include the data description wrapped in quotes so that R ignores it. This information is very important, as it guides the writing of the script and allows others looking at it to get a quick overview. For example, it becomes clear that the experimental treatments (plant density, P application rate and variety) and main response variables such as pod and haulm yield are included in the data. 

.. code:: r

	"Despite the recent release of several improved varieties of groundnut in Nigeria, the productivities
	have not increased significantly due to lack of commensurate recommendation in agronomic practices. 
	Two groundnut varieties were evaluated for their response to different plant density and phosphorus
	application in two locations in the Sudan Savanna zone of Nigeria in 2012 and 2013. The groundnut
	were planted at density of 44444, 66667, and 133333 hills ha-1 with average of two plants per hill. 
	Phosphorus was applied at rate of 0 or 20 kg P ha-1 . P fertilizer application increased pod and 
	haulm yields by 26% and 16% respectively in Wudil. It increased pod and haulm yields by 62% and 27%
	respectively in Wudil. Pod and haulm yields, harvest index, revenue, profit and cost benefit ratio
	increased with increasing plant density. Samnut-24 produced pod yields that were significantly higher
	than Samnut-22 across treatments. Pod yields at density of 133,333 hills ha-1 was 31% higher than at
	66667 and 40% than at 44,444 hills ha-1. Application of fertilizer increased profit by 22% and 49%
	in Wudil respectively. Planting at density of 133,333 hill ha-1 increased profit by 19% and 27% over
	66,667 and 444444 hill ha-1 respectively in, while it increase profit by 9% in Wudil. cultivation of
	Samnut-24 at high density with phosphorus application will make groundnut production a more 
	profitable venture in Sudan Savanna zone of Nigeria."



After this, the `uri` (uniform resource identifier) is defined. This can be a "doi" (digital object identifier) or "hdl" (handle). It is also possible to use url (uniform resource locater) for datasets that do not have a uri. Use the formal notation of a uri, not an http address. 

.. code:: r

   uri <- "doi:10.21421/D2/STACVA"


Assign the dataset to one of the *groups* used by *Carob* to organize the scripts. If you are not sure which group a dataset fits in, just pick one that seems reasonable (see the available `groups <https://carob-data.org/data.html>`__ here). 

.. code:: r

   group <- "agronomy"


Now use the ``carobiner::get_data()`` function. It uses functions in *R* package [yuri](https://github.com/carob-data/yuri) to download the data that the URI points to. The files are written to the data folder in your carob repo (`[repo]/data/raw/<group>/<uri/>`). It returns the file names as object `ff`. 

.. code:: r

   ff <- carobiner::get_data(uri, path, group)


Metadata
--------

The metadata section contains the descriptions of the dataset enriching it with some additional information useful for carob. Most of the metadata (authors, dataset title) is extracted with `carobiner::get_metadata` function. Other metadata needs to be added manually. Of particular importance for experimental data is `treatment_vars`, which need to list the variable(s) that capture the experimental treatment. It is also important to include the publication associated with the dataset if there is any. Here is the metadata section for this dataset.

.. code:: r

   meta <- carobiner::get_metadata(uri, path, group, major=1, minor=1,
		publication=NA,
		carob_contributor="Siyabusa Mkuhlani",
		carob_date="2022-09-12",
		data_type="experiment",
		data_organization="ICRISAT",
		project=NA,
		treatment_vars = "plant_density;P_fertilizer",
		response_vars = "yield",
		notes = NA,
		design = NA,
		completion=100
   )

In this particular example, there is no publication linked to the dataset (`publication="NA"`), but it it is important to check if there is one. An associated publication often provides additional data that can be extracted. The metadata variable `completeness=100` indicates that all the relevant variables in the original dataset have been processed.


Data
----

Now that we have downloaded the data, and created the metadata, we start with the processing of the actual data. The goal is to create single data.frame where rows are experimental units (or similar in a survey), columns represent variables and cell values are measurements. The data.frame should have standard variable names and values (for character variables) or units (for numeric variables), as prescribed by the `terminag <https://github.com/carob-data/terminag>`__ controlled vocabulary. There are data sets that do easily not fit in a single data.frame, for example because there are multiple observations over time for an experimental unit and we will describe these elsewhere. 

We first determine the file(s) we need to read. `carobiner::get_data`, as used above, returned these file names:

.. code:: r

   ff 
   #[1] "data/raw/agronomy/doi_10.21421_D2_STACVA/Data file of Groundnut fertilizer plant density of combine Wudil..xlsx"      
   #[2] "data/raw/agronomy/doi_10.21421_D2_STACVA/Description file of Groundnut fertilizer plant density of combine Wudil.docx"


The actual data file is *Data file of Groundnut fertilizer plant density of combine Wudil..xlsx*, while the other file provides additional metadata. Having all the data in one file, is a relatively easy situation. However, as this is an excel file, there may be multiple sheets that need to be processed. 

Note how we select the file we want. It is important to not include folder names as these may vary between computers. 

.. code:: r

   f <- ff[basename(ff) == "Data file of Groundnut fertilizer plant density of combine Wudil..xlsx"]


And now we read the file. We specify that we want worksheet "Sheet1" although it would also work without doing that as it is the first sheet. The argument "fix_names=TRUE" replaces spaces (and some other characters) in variable names with a "." making it easier to use them in R.

.. code:: r

  	r <- carobiner::read.excel(f, fix_names=TRUE, sheet="Sheet1")


We use data.frame `r` to create a new standardized data.frame `d`:

.. code:: r

	d <- data.frame(
		planting_date=as.character(r$Year),
		location=r$Location,
		rep=as.integer(r$Replication.number),
		variety=r$Variety,
		treatment=paste(r$Variety, r$Fertilizer, r$Spacing, sep="_")
		yield = r$Pod.weight,
		fwy_residue = r$fodder.weight,
		seed_weight = r$seed.weight
	)


In the data.frame created above, we standardized variable names and, for some variables, their data type to conform to the standard. For example, "rep" (repetition) must be an integer and "planting_date" must be a character variable. planting_date should be a date, but in this case all we get is a year, so we use that because it is better than nothing. 

We also created a new (and not required) variable "treatment" with a character code that combines the variety, fertilizer and plant spacing variables. We did not need to changes the unit of the biomass variables (yield, fwy_residue) because they are already reported in `kg/ha`. See the `crop variables <https://github.com/carob-data/terminag/blob/main/variables/variables_crop.csv>`__ in terminag these and related variables to see what the expected units are. For categorical variables you can look at the `accepted values <https://github.com/carob-data/terminag/tree/main/values>`__. For example, excepted values for the `crop` variable are listed `here  <https://github.com/carob-data/terminag/blob/main/values/values_crop.csv>`__.

We can add more variables to the standardized dataset as we do below. 

The code below is used to add the phosphorous (P) application rate (an experimental treatment), and the fixed rates of N and K fertilizer. 

.. code:: r

	d$P_fertilizer <- 0
	d$P_fertilizer[r$Fertilizer=="F2"] <- 20

	d$N_fertilizer <- 0
	d$K_fertilizer <- 20
	d$fertilizer_type <- "unknown"


`r$Spacing` has values 10, 20, and 30. We divide them by 10 to get 1, 2, 3 and associate that with their corresponding plant density values.

.. code:: r

	d$plant_density <- 2 * c(44444, 66667, 133333)[r$Spacing/10]


`trial_id` is an important variable. It distinguished unique (sub-) experiments in space (different locations) and time. In this case we have an experiment in two years in the same location, so we can use `d$planting_date`.

.. code:: r

	d$trial_id <- d$planting_date


We need to specifiy the crop name, and the part of the crop that "yield" refers to. 

.. code:: r

	d$crop <- "groundnut"
	d$yield_part <- "pod"


To be able to use agricultural research data, accurate georeferencing is essential. Sometimes that information comes with the data. In other cases it needs to be added. In this case, the dataverse page has "Research location : Kano, Nigeria" and the description mentions a location: "Wudil". The approximate coordinates of the location can be looked up in Google Maps. Togher, this information can be captured as follows.

.. code:: r

	d$country <-  "Nigeria"
	d$adm1 <- "Kano"
	d$location <- "Wudil"
	d$longitude <- 8.8307
	d$latitude <- 11.8094
	d$geo_from_source <- FALSE


The following three logical (Boolean) variables are also required. You can use `NA` if you are not sure if a crop was irrigated or if the experiment was on-farm. 

.. code:: r
	 
	d$on_farm <- NA
	d$is_survey <- FALSE
	d$irrigated <- NA


The last line of the script should always be `carobiner::write_files`. 

.. code:: r

	carobiner::write_files(meta, d, path=path)


This function check for compliance with the standard and if there are no required variables missing. It also writes the standardized version to the  `data/agronomy/clean/doi_10_21421_D2_STACVA` folder in your clone of the *Carob* repo. 




Once you have finished the script, you should test it by running the entire function by running 

.. code:: r

    carob_script(path)
    #TRUE 
	
If this returns ``TRUE`` then congratulations, your script works!


