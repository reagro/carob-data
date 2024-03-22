#!/usr/bin/Rscript

inf <- list.files("../carob/data/clean/", pattern="html$", full=TRUE, recursive=TRUE)
outf <- gsub("../carob/data/clean/", "build/html/reports/", inf)
folders <- paste0(unique(dirname(outf)))
s <- sapply(folders, \(f) dir.create(f, FALSE, TRUE))
#s <- file.copy(inf, outf, overwrite=FALSE)
s <- file.copy(inf, outf, overwrite=TRUE, copy.date=TRUE)
print(table(s))
