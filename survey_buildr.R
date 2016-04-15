library(yaml)
library(htmltools)
source("utils.R")

a <- commandArgs(TRUE)
lng <- a[1]
yaml_def <- yaml.load_file(a[2])
output_file <- a[3]

# yaml_def <- yaml.load_file("example_r.yaml")
# lng <- "en"
# output_file <- "test.html"

####################################
# Function CALLS ###################
####################################

writeHtmlOutput(yaml_def,lng,output_file)


# <label>
#   <input type="radio" name="gridRadios" id="gridRadios1" value="option1" checked>
#   good
# </label>


# tt <- parseSurveyDefintion(yaml_def)
# tq <- parseQuestion(test$q_ql_ass_bs,"de",css_class = "some-cool-class")
# out <- parseAnswers(tt$q_ql_ass_bs,"de")
# 
# tags$html(tagList(tq,out))
# 
# tags$label(tags$input(type = "radio",value = 1),"dasd")






