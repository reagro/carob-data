#!/usr/bin/Rscript


# must be in global env when using new.env
knitr::opts_chunk$set(
	dev        = 'png',
	fig.width  = 6,	fig.height = 6,
	fig.path = 'figures/',
	fig.cap="",
	collapse   = TRUE
)

do_knit <- function(option, quiet=TRUE) {

	ff <- list.files("_R", pattern='.Rmd$', ignore.case=TRUE, full.names=TRUE, recursive=TRUE)
	html <- gsub("\\.rmd$", ".html", ff)
	html <- gsub("/_R", "", html)

	if (option=="clean"){
		file.remove(html[file.exists(html)])
	} else { 
		if (length(ff) > 0 ) {
			stime <- file.info(ff)
			fn <- gsub("_R/", "./", tools::file_path_sans_ext(rownames(stime)))
			stime <- data.frame(f=fn, stime = stime$mtime, stringsAsFactors=FALSE)

			btime <- file.info(html)
			fn <- gsub("_R/", "./", tools::file_path_sans_ext(rownames(btime)))
			btime <- data.frame(f=fn, btime = btime$mtime, stringsAsFactors=FALSE)

			m <- merge(stime, btime, by=1, all.x=TRUE)
			m[is.na(m$btime), 'btime'] <- as.POSIXct(as.Date('2000-01-01'))

			i <- which ( m$btime < m$stime ) 
			ff <- ff[i]
		}
	}

	if (length(ff) > 0) {
		for (i in 1:length(ff)) {
			print(ff[i])
			rmarkdown::render(ff[i], "html_document", envir = new.env(), encoding='UTF-8', quiet=quiet)
		}
	} 
}


args <- commandArgs(TRUE)
option <- ifelse(length(args) > 0, args[1], "")

oldpath <- getwd()
path <- file.path(oldpath, 'source')
setwd(path)
do_knit(option, quiet=TRUE)
setwd(oldpath)
warnings()
Sys.sleep(1)

