.. raw:: html

   <div style="visibility: hidden;">

Guidelines
==========

.. raw:: html

	</div>
	<div style="visibility: visible;">


Before you start
----------------

-  Anyone is welcome to contribute to *Carob*. It is not easy to standardize research data. Please try your best to follow the guidelines provided here. But we won’t get angry if you make mistakes — as long as you are willing to learn from them.                                     
-
-  When looking at a dataset you want to process, first carefully read the description provided. If there is a related publication, read the abstract and scan the Methods and Results section. The Methods section often provides data for (constant) management variables that are not treatments. For example, if all treatments received the same amount of fertilizer, these numbers are frequently omitted from the dataset.
-
-  Consider what the data are about. With experimental data ask: “what are the treatments”, “how are they captured”, “what are the important response variables”? All treatments (factors) must be included as one or more standard variables. There is a variable called “treatment” that may have a combination of treatments (e.g., “NP”, “PK”, but they must also be specified in separate variables such as “N_fertilizer” and “P_fertilizer”. This seems obvious, but in many datasets the treatments are not explicitly provided as variables, and you may need to do some work. For example you may need to translate a treatment code into multiple variables.
-
-  To contribute to *Carob* you need to install the “carobiner” R package. You can do that with ``remotes::install_github("reagro/carobiner")``. Update the package regularly. The package contains some helper functions and functions that check for compliance with the standard.
-
-  Carob scripts are normally contributed and/or improved via a github pull request (PR). Before creating a pull request, make sure that your fork is synced, and that there are no conflicts. We strongly prefer PRs for a single file at a time.


Scripts
-------

-  Carob scripts download and re-organize the data, to make them compliant with the standard, and save the standardized data and relevant metadata on disk. See `\_template.R <https://github.com/reagro/carob/blob/master/scripts/_template.R>`__ in the *scripts* folder for the general structure of such a script.
-
-  All original data should be downloaded from a URI (uniform resource identifier) such as a DOI or HDL. For example ``"doi:10.7910/DVN/UNLRGC"`` is a valid URI. It is important to use this specific notation, do *not* use a http address such as ``https://doi.org/10.7910/DVN/UNLRGC``. Data that does not have a URI but does have a URL (Internet address) can also be used. Data that can not be downloaded from the Internet should be hosted somewhere. We can host it on the `carob dataverse <https://dataverse.harvard.edu/dataverse/carob/>`__. We can make exceptions for especially valuable datasets that cannot be (easily) downloaded directly.
-
-  Each original dataset gets its own script. The script file should be ``<nuri>.R`` where <``nuri``> is a normalized URI. That is, a URI without a colon or slashes. You can create these with ``carobiner::simple_uri``. For example, ``carobiner::simple_uri("doi:10.7910/DVN/UNLRGC")`` returns ``"doi_10.7910_DVN_UNLRGC"`` and filename for the script should be ``"doi_10.7910_DVN_UNLRGC.R"``
-
-  Scripts and data are grouped by domain. These groups include “fertilizer”, “crop_cuts”, “maize_trials”, “rice_trials” and “wheat_trials”, “survey” and “conservation_agriculture”. There are additional requirements/checks for different groups. For example, the records in the “fertilizer” groups must have the variables that specify fertilizer application rates. Group membership can be somewhat arbitrary as they are partly overlapping. That is not a problem as the aggregated data may include records from multiple groups.
-
-  Test your script. The last line in a script should always be ``carobiner::write_files``. This function checks whether you are using the controlled vocabulary, among other things. Fix any errors or warnings to the extent possible (without guessing things you do not know or suppressing warnings). It is OK to leave some warnings if you believe they cannot be fixed by you (perhaps because the controlled vocabulary needs to be expanded). You can also use ``carobiner::check_terms`` to evaluate compliance with the standard.
-
-  If a dataset is associated with a publication, you can often get important additional information from the Methods section (for example, on location, fertilizer used, plant spacing). If you get values from a related publication, or because of your reasoning, document where you got these values by adding comments in the script.


Standardization
---------------

-  The aim is to standardize all relevant variables in the original data. We generally omit variables that are measured in the field to compute a variable of interest, but are not of much interest themselves. For example, we include yield (kg/ha), but not the mass of a sample that was taken to estimate it.
-
-  We use the `terminag <https://github.com/reagro/terminag>`__ standard. If you think that there are terms (concepts) that are missing in this standard, just add the new terms that you propose to your script and ignore the warning messages. An editor will look at your pull-request (PR) and decide whether the standard needs to be expanded or changed.
-
-  It is expected that there is variation between data sets; they do not all have the same variables. But all records should have common variables such as country, crop, yield, longitude and latitude (even if some of their values are missing (``NA``))
-
-  Some variables such as ``country``, ``crop``, and ``fertilizer_type`` have controlled vocabularies that you need to use (or suggest adding additional terms). If there are multiple values (for example, two crops or fertilizer types), separate these with a semi-colon (``;``).
-
-  Apart from the standard variable names you also need to express all data in standard units. See the `terminag variables <https://github.com/reagro/terminag/tree/master/variables>`__.
-
-  Check character variables for spelling variations (use ``unique`` and ``table``) and standardize. You can use ``carobiner::fix_name`` in some cases.
-
-  Make sure that variables that should be numeric are not stored as text
-
-  Do not guess values to make things work (for example, because a value is required, or because it needs to match a vocabulary). Instead, submit the script with warnings/errors so that we can discuss the best way to handle these.
-
-  Store dates as text after first creating dates (``as.character(as.Date(x))``) so that they are in a standard format. You can also store years (e.g., “2023” or year-months such as “2023-06” if that is all the available information.
-
-  All experimental treatment variables need to be included. These variables should also be specified at the dataset level under “treatment_vars”


R coding style
--------------

-  We rely as much as we can on base R to keep code simple and dependencies low.
-
-  While we may use some functions from e.g. ``dplyr`` and ``stringr``, we otherwise avoid the tidyverse dialect.
-
-  To make it easy to read and debug code, avoid or sparingly use ``|>``. Never use more than 2 in one statement.
-
-  Avoid nesting function calls. Do not nest more than 2 function calls. For example, instead of nested ``ifelse`` calls, use ``%in%``, ``match`` or ``merge``
-
-  When using ``ifelse`` do not use a default last condition for a known case (unless it is obvious). Instead, use ``NA`` as the default for all other, unexpected, conditions). Do not indent nested ``ifelse`` statements.
-
- ``#Comment your code``. Document your assumptions. Document where you got numbers introduced in the script (from a publication, for example) Comments start on the line above the code that is commented on (not on the same line)


*Carob* is under active development. To stay current, you should frequently pull the *Carob* repo and update the carobiner package.



.. raw:: html

   </div>
