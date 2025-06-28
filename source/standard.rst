Standard
========

Adhering to a **data standard** can greatly facilitate data quality and the efficiency of data use. A data standard consists of a number of rules describing how data should be organized. These can include rules about the (1) file format; (2) data format; (3) accepted variables; (4) accepted values for character variables; (5) accepted value ranges for numerical variables; (6) units of numerical variables; and (7) required variables for the data and metadata. 

*Carob* uses the *terminag* controlled vocabulary variable names, their units, and acceptable (ranges of) values. It is defined in a number of tables that are available on the *terminag* `github site <https://github.com/carob-data/terminag>`__. You can also access the standard, and do compliance checking, with *R* package `vocal <https://github.com/carob-data/vocal>`__. 


What does good data look like?
------------------------------

*Carob* is about fixing existing data so that it can be used. This is can be a very difficult process, and sometimes it simply cannot be done. We hope that over time, this problem will go away as raw data will become more standardized. Here are some (brief, preliminary) guidelines for creating usable datasets.

Use either multiple `.csv` files or a single `excel` file. Avoid other file formats that are specific to particular software (e.g. Stata or *R*). Each table (csv file or excel sheet) should be a simple rectangle where each column is a single variable, and each row an observation (case), and each cell a single measurement or treatment (see Wickham's description of `"tidy data" <https://vita.had.co.nz/papers/tidy-data.pdf>`__ .  

Each variable should have a short name, and there should be a file/sheet with a longer description of what these variables represent. The unit of all variables should also be provided. It is acceptable to have the (short) variable name, description and unit as three header rows above the data. But never merge cells in excel.

In experiments, treatments are sometimes described by a single variable code or description. That may be useful, but they should alwyas be described as one or mulitple variables that fully capture the treatments as well. For example "conservation agriculture" and "conventional" are not very useful as they cannot be interpreted outside of the spatial and temporal context of the observation (and most people do not know that context). Instead, variables specifiying for example the field preparation method (plowing), residue management, irrigation need to be used as these can be much more easily interpreted.

A number of variables should *always* be included for most agricultural data to be meaningfully incorporated into a larger database. These include variables that define space and time, the amounts of fertilizer used (if any), and the basic agronomic practises.

- country
- adm1 (first level administrative subdivision name)
- adm2 (second level administrative subdivision name)
- location  
- longitude
- latitude
- planting_date
- maturity_date
- crop
- variety
- N_fertilizer
- P_fertilizer
- K_fertilizer
- other fertilizer
- irrigated
- yield_fresh
- yield_dry
- soil properties (including %sand, %silt, %load, SOC, pH, plant available N, P, K)


Most of these variables may be consant in an experiment, but they still need to be provided as part of the main data table, or as a separate table.

