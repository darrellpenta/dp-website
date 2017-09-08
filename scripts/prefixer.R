fixer<-function(x){
  writeLines(unlist(lapply(c("-moz-","-webkit-","-ms-","-o-",""),paste0,x,collapse="\n")),sep="\n")
}

fixer(c("transform: scale3d(0.0,0.0,0.0);",
	"transform: scale(0.0, 0.0) scaleZ(0.0);"))
