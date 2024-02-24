@ECHO OFF

Rscript.exe --vanilla _script\knit_site.R clean
Rscript.exe --vanilla _script\copy_reports.R 
make html


