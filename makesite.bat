@ECHO OFF

Rscript.exe --vanilla _script\knit_site.R clean
make html
Rscript.exe --vanilla _script\copy_reports.R 


