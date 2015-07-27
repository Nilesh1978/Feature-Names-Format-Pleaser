# Write a shiny application with associated supporting documentation. 
# The documentation should be thought of as whatever a user will need to get started using your application.
# Deploy the application on Rstudios shiny server
# Share the application link by pasting it into the text box below
# Share your server.R and ui.R code on github
# 4.You must also include enough documentation so that a novice user could use your application.
# 5.The documentation should be at the Shiny website itself. Do not post to an external link.

library(shiny)
library(DT)
library(dplyr)

shinyServer(function(input, output) {
        
        output$tbl <- DT::renderDataTable({
                if(length(input$data) == 0) {
                        data <- data.frame(column=c(0))
                } else {
                        data <- read.csv(input$data[[4]])
                        format <- input$options
                        if("lower" %in% format) {
                                names(data) <- tolower(names(data))
                        }
                        if("upper" %in% format) {
                                names(data) <- toupper(names(data))
                        }
                        if("space" %in% format) {
                                names(data) <- gsub(" ", "", names(data))
                        }
                        if("period" %in% format) {
                                names(data) <- gsub("\\.", "", names(data))
                        }
                        if("underscore" %in% format) {
                                names(data) <- gsub("\\_", "", names(data))
                        }
                        if("hyphen" %in% format) {
                                names(data) <- gsub("\\-", "", names(data))
                        }
                        if("dollar" %in% format) {
                                names(data) <- gsub("\\$", "", names(data))
                        }
                }
                DT::datatable(data.frame(Names=names(data)), rownames=FALSE, colnames=c("Names"))
        })
        output$downloadable <- downloadHandler(
                file <- "C:/Users/etb8dhv/Desktop",
                filename = function() {
                        paste(input$fileName, '.csv', sep='')
                },
                content = function(file) {
                        write.csv(data, file)
                }
        )
})