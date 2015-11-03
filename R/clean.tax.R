clean.tax <- function(X, reg=c("ai", "ebs", "gmex", "goa", "neus", "newf", "ngulf", "sa", "sgulf", "shelf", "wcann", "wctri")){
	load("data/spp.key.RData")
	reg <- match.arg(reg)
	
	
	clean.tax0 <- function(x){
		switch(x,
			ai = clean.tax.ai(X),
			ebs = clean.tax.ebs(X),
			gmex = clean.tax.gmex(X),
			goa = clean.tax.goa(X),
			neus = clean.tax.neus(X),
			newf = clean.tax.newf(X),
			ngulf = clean.tax.ngulf(X),
			sa = clean.tax.sa(X),
			sgulf = clean.tax.sgulf(X),
			shelf = clean.tax.shelf(X),
			wcann = clean.tax.wcann(X),
			wctri = clean.tax.wctri(X)
		)
	}
	
	
	# X <- copy(gmex)
	setnames(X, "spp", "ref")
	names.x <- names(X)
	rmX.names <- names.x[names.x%in%(names(spp.key)[names(spp.key)!="ref"])]
	
	setkey(spp.key, "ref")
	X <- merge(X, spp.key, by="ref", all.x=TRUE)
	
	drop.x <- function(x){
		X[,c(paste0(x,".x")):=NULL]
		setnames(X, paste0(x,".y"), x)
	}
	drop.x(rmX.names)
	
	# smry.tax0 <- X[,table(taxLvl[!duplicated(spp)])]
# 	nst <- names(smry.tax0)
# 	sum.tax <- function(x){sum(smry.tax0[nst[grepl(x,nst,ignore.case=T)]])}
# 	smry.tax <- c(
# 		kingdom = sum.tax("kingdom"),
# 		phylum = sum.tax("phylum"),
# 		class = sum.tax("class"),
# 		order = sum.tax("order"),
# 		family = sum.tax("family"),
# 		genus = sum.tax("genus"),
# 		species = sum.tax("species")
# 	)
	
	
	
	
	
	# invisible(clean.tax0(reg))
	
	return(X)
	
}