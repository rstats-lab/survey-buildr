library(yaml)
library(htmltools)
source("utils.R")

li <- list(q_ql_ass_bs = "radio", q_ql_exp_emp = "radio")
l <- c("de","en")

out <- createYamlSkeleton(li,l)

fname <- "skeleton.yaml"
fileCon <- file(fname)
writeLines(as.character(out),fileCon)
close(fileCon)




