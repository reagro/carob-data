Standard
========

*Carob* uses the *terminag* **standard** that defines a controlled vocabulary of variable names, their units, and acceptable (ranges of) values. 

The *terminag* standard can be used "stand-alone" for your own data, and as part of the data compilation done through the *Carob* project.

The standard is defined in a number of tables that are available on the `termiag <https://github.com/carob-data/terminag>`__ github site and accessible via the R package `vocal <https://github.com/carob-data/vocal>`__. 


What does good data look like?
------------------------------

*Carob* is about fixing existing data so that it can be used. This is can be a very difficult process, and sometimes it simply cannot be done. We hope that over time, this problem will go away as raw data will become more standardized. Here are some guidelines for creating usable datasets.

Use either multiple `.csv` files or a single `excel` file. Avoid other file formats that are specific to particular software (e.g. Stata or R). Each table (csv file or excel sheet) should be a simple rectangle where each column is a single variable, and each row an observation (case), and each cell a single measurement or treatment (see Wickham's description of `"tidy data" <https://vita.had.co.nz/papers/tidy-data.pdf>`__ .  

Each variable should have a short name, and there should be a file/sheet with a longer description of what these variables represent. The unit of all variables should also be provided. It is acceptable to have the (short) variable name, description and unit as three header rows above the data. But never merge cells in excel.

In experiments, treatments are sometimes described by a single variable code or description. That may be useful, but they should alwyas be described as one or mulitple variables that fully capture the treatments as well. For example "conservation agriculture" and "conventional" are not very useful as they cannot be interpreted outside of the spatial and temporal context of the observation (and most people do not know that context). Instead, variables specifiying for example the field preparation method (plowing), residue management, irrigation need to be used as these can be much more easily interpreted.

A number of variables should *always* be included for most agricultural data to be meaningfully incorporated into a larger database. These include variables that define space and time, the amounts of fertilizer used (if any), and the basic agronomic practises.

- country
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


Most of these variables may be consant in an experiment, but they still need to be provided as part of the main data table, or as a separate table.

