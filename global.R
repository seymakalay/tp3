#rm(list=ls())

library(ggplot2);library(labeling);library(DT);library(tools);library(curl); library(rsconnect)
library(stringr); library(shiny);library(rpivotTable);library(readr)
library(leaflet); library(leaflet.extras);library(knitr);library(maps)
library(dplyr); library(readxl);library(sp);library(shp2graph)
library(htmltools); library(htmlwidgets); library(scales); library(raster); library(httr)   
library(shinyBS); library(raster); library(tidyverse)
library(kableExtra);library(magrittr)
#set_config(use_proxy(url="10.3.100.207",port=8080))

chfs15.prvnc <- read.csv("chfs15.prvnc.csv", sep = ",", header = TRUE)
chfs15.prvnc <- subset(chfs15.prvnc, select = -c(X,Insert_prov_CHN))

colnames(chfs15.prvnc) <- c("hhid","Cluster.No","Loan.Type","Access Loan","Formal","Informal","Both Loans","No.Loan",      
                            "Region", "Gender", "Education", "Party", "Married", "Employed","HR", "Age",          
                            "Income", "Networth","Liquid.Assets","NW.HE","Province")


table(chfs15.prvnc$HR)
chfs15.prvnc$HR <- ifelse(chfs15.prvnc$HR==1,0,1);
table(chfs15.prvnc$HR)

# Get UK polygon data
CHN <- getData("GADM", country = "CHN", level = 1); table(CHN$NAME_1)
CHN$NAME_1 <- word(CHN$NAME_1, start = 1L); table(CHN$NAME_1);  table(chfs15.prvnc$Province)


chfs15.prvnc <- chfs15.prvnc[!(chfs15.prvnc$Province== "Inner" | chfs15.prvnc$Province== "Nei"| 
                                 chfs15.prvnc$Province == "Xinjiang"|  chfs15.prvnc$Province== "Xizang"),]
##ALL
#mydf <-  chfs15.prvnc %>% 
#filter(Cluster.No == "1") %>%
#  dplyr::group_by( Province) %>%
#  dplyr:: summarise( n = n())

#mydf$Cluster.No <- factor(mydf$Cluster.No)
#mydf  <- data.frame(place = unique(mydf$Province),n= mydf$n)
### Create five colors for fill
#mypal <- colorQuantile(palette = "RdYlBu", domain = mydf$n, n = 5, reverse = TRUE)

##Cluster 1
mydf1 <-  chfs15.prvnc %>% 
  filter(Cluster.No == "1") %>%
  dplyr::group_by(Province) %>%
  dplyr:: summarise( n = n())

#mydf$Cluster.No <- factor(mydf$Cluster.No)
mydf1  <- data.frame(place = unique(mydf1$Province),n= mydf1$n)
### Create five colors for fill
mypal1 <- colorQuantile(palette = "RdYlBu", domain = mydf1$n, n = 5, reverse = TRUE)

#COMBINE CLUSTER2 AND CLUSTER3
a <-  chfs15.prvnc %>% 
  filter(Cluster.No == "2")

b <-  chfs15.prvnc %>% 
  filter(Cluster.No == "3")

c <- rbind(a,b)



##Cluster 2&3
mydf2 <- c %>% 
  #dplyr::select(chfs15.prvnc$Cluster.No == "2" & chfs15.prvnc$Cluster.No == "3" ) %>%  
  dplyr::group_by(Province) %>%
  dplyr:: summarise( n = n())

#mydf$Cluster.No <- factor(mydf$Cluster.No)
mydf2  <- data.frame(place = unique(mydf2$Province),n= mydf2$n)
### Create five colors for fill
mypal2 <- colorQuantile(palette = "RdYlBu", domain = mydf2$n, n = 5, reverse = TRUE)


dfpivot <- chfs15.prvnc[,c("Cluster.No","Loan.Type","Access Loan","Formal","Informal","Both Loans","No.Loan",      
                           "Region", "Gender", "Education", "Party", "Married", "Employed","HR","Province"), ]


data_table <- as.data.frame(chfs15.prvnc)




