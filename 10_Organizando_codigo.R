---
title: "Economia Naranja"
author: "Fer Mavec"
date: "06-sept-2022"
output: html_document
---
  
## Generacion de archivos PDF (pdf_document), DOCX(word_document) y HTML (html_document) con R-MARKDOWN
### Comandos para instalar y ejecutar archivo *.rmd
- install.packages("rmarkdown")
- library(rmarkdown)
- install.packages("knitr")
- library(knitr)
- rmarkdown::render('class25.rmd')

̣̣̣'''{r}
orangeec = read.csv(file="orangeec.csv", header=TRUE, sep=",")
̣̣̣'''
̣̣̣'''{r}
summary(orangeec)
̣̣̣'''

### Parece que hay correlacion entre aporte de economia naranja al PIB y la tasa de desempleo.

̣̣̣'''{r}
pairs(orangeec[,6:10])
̣̣̣'''
̣̣̣'''{r}
library(ggplot2)
̣̣̣'''
̣̣̣'''{r}
ggplot()+geom_histogram(data=orangeec,aes(x=orangeec$Internet.penetration...population),
    fill="lightblue",color="darkblue",binwidth=5)+
labs(x="Penetración de Internet (%) población", y="Cantidad de Paises", 
    title="Penetración de Internet en LATAM")+
scale_x_continuous(breaks=seq(38, max(96), 2))+
theme(legend.position="none")+
theme(panel.background=element_blank(), 
    panel.grid.major=element_blank(), panel.grid.minor=element_blank())
̣̣̣'''
̣̣̣'''{r}
library(dplyr)
̣̣̣'''
̣̣̣'''{r}
mean <- mean(orangeec$GDP.PC)
̣̣̣'''
̣̣̣'''{r}
orangeec <- orangeec %>% mutate(strongEconomy = ifelse(GDP.PC < mean, 
    "Por debajo del promedio PIB", "Por encima del promedio PIB"))
̣̣̣'''
̣̣̣'''{r}
ggplot(orangeec, aes(x=strongEconomy, y=Creat.Ind...GDP, fill=strongEconomy))+
geom_boxplot(alpha=0.4)+
labs(x="Tipo de País", y="Aporte Economía Naranja al PIB", 
    title="Aporte Economía Naranja en PIB en LATAM con alto y bajo PIB per cápita")
̣̣̣'''

### El boxplot indica que los paises por encima del promedio del PIB tienen una dispersión mucho mas alta en relación a los aportes de la economía naranja al PIB del país. CUIDADO, contrastar con desviación estándar.