@ECHO OFF

rem rm -r build\html
rem del /Q /S build\html

Rscript.exe --vanilla _script\knit_site.R clean
Rscript.exe --vanilla _script\copy_reports.R 
make html

