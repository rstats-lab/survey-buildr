library(yaml)
library(htmltools)
library(jsonlite)
source("utils.R")

li <- list(q_ql_ass_bs = "radio",
           q_ql_exp_emp = "radio",
           q_cb_fin_restr = "checkbox",
           q_qn_test = "text")

l <- c("de","en")



out <- createYamlSkeleton(li,l)

fname <- "skeleton.yaml"
fileCon <- file(fname)
writeLines(as.character(out),fileCon)
close(fileCon)



# yaml to json

yaml_def <- yaml.load_file("skeleton.yaml")


storeSurveyDefintionAsJson(yaml_def)





