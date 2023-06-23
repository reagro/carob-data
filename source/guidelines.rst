:orphan:

Guidelines
==========

Here are some preliminary guidelines for contributors:

* To contribute to Carob you need to install the carobiner R package. You can do that with `remotes::install_github("reagro/carobiner")`

* Anyone is welcome to contribute via a pull request. Before creating a pull request, make sure that your forked is synced, and that there are no conflicts.


* All original data should be downloaded from a URI. Data that does not have a URI should be hosted somewhere. We can host it on the `carob dataverse <https://dataverse.harvard.edu/dataverse/carob/>`_. We can make exceptions for especially valuable datasets that cannot be (easily) downloaded directly.


* Each original dataset gets its own script. The script file should be `<uri>.R`  where <`uri`> is a normalized URI. 


* Scripts and data are grouped by domain. Current groups include "fertilizer", "crop_cuts", "maize_trials", "variety_trials" and "wheat_trials".


* Carob scripts download and re-organize the data and save the cleaned data. See `template.R <https://github.com/reagro/carob/blob/master/template.R>`_ for the minimal structure.


* Test your script with `carobiner::run_carob`. This function checks the variable names and controlled vocabulary used, among other things. Fix any errors or warnings to the extent possible (without guessing things you do not know or suppressing warnings). 


* You should use standard variable names if available, and express all data in standard units. See the `.csv` files in the `terms` folder. 


* R coding style: 
   - We rely as much as we can on base R to keep code simple and dependencies low. 
   - While we may use some functions from e.g. `dplyr` and `stringr`, we otherwise avoid the tidyverse dialect.
   - To make it easy to debug code, avoid or sparingly use `|>`. Never use more than 2 in one statement.
   - Avoid nesting function calls. Never nest more than 2 function calls.
   - For example, instead of deeply nested `ifelse` calls, use `match` or `merge`
   - Comment your code. Comments start on the line above the code that is commented on (not on the same line)


* check character variables for spelling variations (use `unique` and `table`) and standardize. You can use `carobiner::fix_name` in some cases.


* make sure that variables that should be numeric are not stored as text


* some variables such as `crop` and `fertilizer_type` have controlled vocabularies that you need to use (or suggest adding additional terms). If there are multiple values (e.g. two crops or fertilizer types), separate these with a semi-colon and a space (; ). 


* store dates as text after first creating dates (`as.character(as.Date(x))`) so that they are in a standard format


* It is expected that there is variation between data sets; they do not all have the same variables. But all records should have 
   - crop name 
   - crop yield
   - location coordinates 


* Do not simply guess values to make things work (e.g. because a value is required, or because it needs to match a vocabulary).


* If you get values from e.g. a related publication, or because of your reasoning, document that by commenting in the script.


* Carob is under active development. To stay current, you should frequently pull this repo and update the `carobiner` package.


* See our `georeferencing <georeference.html>`_ guide for suggestions on to check, correct, and add longitude/latitude coordinates.

