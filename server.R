library(shiny)
library(DT)
library(dplyr)

options(shiny.maxRequestSize = 15*1024^2)
shinyServer(function(input, output) {
        v <- reactiveValues(d = NULL)
        v$d <- data.frame("Select data source"=c(0))
        observeEvent(input$goButton, {
                if (is.null(input$file)) return(v$d <- data.frame("Select data source"=c(0)))
                v$d <- read.csv(input$file[[4]])
        })
        observeEvent(input$example, {
                v$d <- read.csv("data/example.csv")
        })
        output$tbl <- DT::renderDataTable({
                format<-input$options
                if("lower" %in% format) {
                        names(v$d) <- tolower(names(v$d))
                }
                if("upper" %in% format) {
                        names(v$d) <- toupper(names(v$d))
                }
                if("space" %in% format) {
                        names(v$d) <- gsub(" ", "", names(v$d))
                }
                if("period" %in% format) {
                        names(v$d) <- gsub("\\.", "", names(v$d))
                }
                if("underscore" %in% format) {
                        names(v$d) <- gsub("\\_", "", names(v$d))
                }
                if("hyphen" %in% format) {
                        names(v$d) <- gsub("\\-", "", names(v$d))
                }
                if("dollar" %in% format) {
                        names(v$d) <- gsub("\\$", "", names(v$d))
                }
                DT::datatable(data.frame(Names=names(v$d)), rownames=FALSE, colnames=c("Names"))
        })
})