# Write a shiny application with associated supporting documentation. 
# The documentation should be thought of as whatever a user will need to get started using your application.
# Deploy the application on Rstudios shiny server
# Share the application link by pasting it into the text box below
# Share your server.R and ui.R code on github
# 4.You must also include enough documentation so that a novice user could use your application.
# 5.The documentation should be at the Shiny website itself. Do not post to an external link.

library(shiny)
library(DT)

shinyUI(fluidPage(
        # Application title
        titlePanel("Format Column Names"),
        
        sidebarLayout(
                sidebarPanel(
                        fileInput("data", ""),
                        checkboxGroupInput("options", "Format options:",
                                           c("Lowercase" = "lower",
                                             "Uppercase" = "upper",
                                             "Remove Space" = "space",
                                             "Remove Period" = "period",
                                             "Remove Underscore" = "underscore",
                                             "Remove Hyphen" = "hyphen",
                                             "Remove Dollar" = "dollar"))
                ),
                mainPanel(
                        DT::dataTableOutput('tbl')
                )
        )
))