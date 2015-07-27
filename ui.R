library(shiny)
library(DT)

shinyUI(fluidPage(
        # Application title
        titlePanel("Feature Names Format Pleaser"),
        
        sidebarLayout(
                sidebarPanel(
                        h4("1. Select .csv file with feature names you wish to format (max 15MB):"),
                        fileInput("file", ""),
                        h4("2. Format selected file or view/format example dataset:"),
                        actionButton("goButton", "View Selected Data"),
                        actionButton("example", "View Example Data"),
                        h4("3. Select the formatting elements desired:"),
                        checkboxGroupInput("options", "Format options:",
                                           c("lowercase" = "lower",
                                             "UPPERCASE" = "upper",
                                             "Remove Space ( )" = "space",
                                             "Remove Period (.)" = "period",
                                             "Remove Underscore (_)" = "underscore",
                                             "Remove Hyphen (-)" = "hyphen",
                                             "Remove Dollar Sign ($)" = "dollar"))
                ),
                mainPanel(
                        h4("4. Preview formatted feature names below!"),
                        DT::dataTableOutput('tbl')
                )
        )
))