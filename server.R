library(shiny)
library(DT)
library(dplyr)

options(shiny.maxRequestSize = 15*1024^2)
shinyServer(function(input, output) {
        output$tbl <- DT::renderDataTable({
                if((input$goButton >= input$example) & length(input$file)>0) {
                        d = read.csv(input$file[[4]])
                } else if(input$example > input$goButton) {
                        d = read.csv("data/example.csv")
                } else {
                        d = data.frame("Select data source"=c(0))
                } 
                format<-input$options
                if("lower" %in% format) {
                        names(d) <- tolower(names(d))
                }
                if("upper" %in% format) {
                        names(d) <- toupper(names(d))
                }
                if("space" %in% format) {
                        names(d) <- gsub(" ", "", names(d))
                }
                if("period" %in% format) {
                        names(d) <- gsub("\\.", "", names(d))
                }
                if("underscore" %in% format) {
                        names(d) <- gsub("\\_", "", names(d))
                }
                if("hyphen" %in% format) {
                        names(d) <- gsub("\\-", "", names(d))
                }
                if("dollar" %in% format) {
                        names(d) <- gsub("\\$", "", names(d))
                }
                DT::datatable(data.frame(Names=names(d)), rownames=FALSE, colnames=c("Names"))
        })
})