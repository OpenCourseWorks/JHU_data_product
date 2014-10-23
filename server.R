library(compute.es)
library(shiny)

spool<- function(s1,s2)
{
       sp<-sqrt((s1^2+s2^2)/2) 
       sp
}

cohen <- function(m1,m2,s1,s2)
{
        co<-m2-m1/spool(s1,s2)
        co
}

rfi<- function(co)
{
        rf<-co/sqrt(co^2+4)
        rf
}


shinyServer(
        function(input, output){       
        output$cohen <- renderPrint({cohen(input$mean1,input$mean2,input$sd1,input$sd2)})
        output$rfi<- renderPrint({rfi(cohen(input$mean1,input$mean2,input$sd1,input$sd2))})
        }
)
        
        
        
        
        
