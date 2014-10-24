---
title: "Project Data Product - calculating effect sizes"
author: "Wei-Cheng Yang"
date: "2014/10/23"
output: html_document
mode:  selfcontained
---

# Calculator for effect sizes

This application in shinyapps get input of means and standard deviations from the user,   
and calculate the cohen's d and effect size from the data input.

first get pooled standard deviation from original standard deviations

pooled_sd = sqrt( (sd1^2 + sd2^2) / 2)

cohen's d is calculated by:
(mean1 - mean2)/pooled standard deviation

Then effect size r can be calculated by cohen's d:
r = d/sqrt(d^2+4)

---

# calculation in server.R

We use three functions for calculation , 
and use input for calculation.


```r
spool<- function(s1,s2){
       sp<-sqrt((s1^2+s2^2)/2) 
       sp}

cohen <- function(m1,m2,s1,s2){
        co<-m2-m1/spool(s1,s2)
        co}
rfi<- function(co){
        rf<-co/sqrt(co^2+4)
        rf}
shinyServer(
        function(input, output){       
        output$cohen <- renderPrint({cohen(input$mean1,input$mean2,input$sd1,input$sd2)})
        output$rfi<- renderPrint({rfi(cohen(input$mean1,input$mean2,input$sd1,input$sd2))})
        }
)
```

---

# Example

We give the corresponding mean1=5,mean2=6, sd1=1.3,sd2=1.5 and check for the result



```r
m1<-5
m2<-6
sd1<-1.3
sd2<-1.5

co<-cohen(m1,m2,sd1,sd2)
co
```

```
## [1] 2.438
```

```r
rfi(co)
```

```
## [1] 0.7731
```

---

Thank you !
