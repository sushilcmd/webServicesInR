#load package

library(plumber)
library(httr)
library(jsonlite)

#plumber package is use for creating web servic.
#httr used for GET and POST request on server.
#jsonlite use for play with json data.

#create web service for clustering 


#* @post /getCluster
clustering<-function(columnName)
{
  data<-getData("your data url")
  column<-as.integer(unlist(select(data, contains(columnName))))
  removeOutliers<-data.frame(column[column <= quantile(column,0.85) & column > quantile(column,0.20)])
  filterData<-subset(removeOutliers,select=c("removeOutliers"))
  set.seed(10)
  kmCluster<-kmeans(filterData,3)
  ctable<-data.frame(kmCluster$cluster,removeOutliers$removeOutliers)
  ctable<-rename(ctable,c("kmCluster.cluster"="cluster","removeOutliers.removeOutliers"="value"))
  return(ctable)
}

getData<-function(url)
{
  get <- GET(url)
  textContent<-content(get,as="text",encode="UTF-8")
  data<-textContent %>% fromJSON
  return(data)
}

