library(shiny)
shinyUI(pageWithSidebar(
        headerPanel("Effect Size Calculator"),
        sidebarPanel(
                h4('Input the means of groups'),
                numericInput('mean1','Mean of group 1',0),
                numericInput('mean2','Mean of group 2',0),
                numericInput('sd1','Sd of group 1',0),
                numericInput('sd2','Sd of group 2',0),
                submitButton('Compute!')
        ),
        mainPanel(
                h4('Calculate d and r using means and standard deviations'),
                p("Calculate the value of Cohen's d and the effect-size correlation, rYl, using the means and standard deviations of two groups (treatment and control)."),
                
                h5("Cohen'd"),
                textOutput("cohen"),
                h5("effect-size r"),
                textOutput("rfi")
                
        )
        ))