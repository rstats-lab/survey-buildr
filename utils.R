parseSurveyDefintion <- function(yaml){
  # add class according to type
  yaml_classified <- lapply(yaml,function(x){
    class(x) <- c("list",x$type)
    x
  } )
  yaml_classified
}

parseQuestion <- function(q,lang,css_class = NULL){
  tags$label(q[["question"]][[lang]],class = css_class)  
}

parseAnswers <- function(q,lang) UseMethod("parseAnswers")

parseAnswers.radio <- function(q,lang){
  input_list <- list()
  ans <- q[["answers"]][[lang]]
  for (i in 1:length(ans)){
    input_list[[i]] <- tags$div(class="radio",
                                tags$label(
                                  tags$input(type = "radio", name = "test",
                                             value = i),
                                  ans[i]
                                ))
  }
  tagList(input_list)
}

writeHtmlOutput <- function(yaml,lang,fname){
  survey_def <- parseSurveyDefintion(yaml)
  
  questionnaire <- lapply(survey_def,function(x){
    q_label <- parseQuestion(x,lang)
    q_answers <- parseAnswers(x,lang)
    tagList(q_label,q_answers)
  })
  
  output <- tags$html(
    tags$body(
      tags$form(questionnaire)
    )
  )
  
  fileCon <- file(fname)
  writeLines(as.character(output),fileCon)
  close(fileCon)
  
  sprintf("HTML output for language %s written to %s",
          lang,fname)
  
}