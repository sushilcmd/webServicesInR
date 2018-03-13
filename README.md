# webServicesInR
How to convert r model in webservice and deploy on server.

## Prerequesties
Package dependencies for creating webservice-> plumber, httr, jsonlite

## Installing
```
install.packages("plumber")
install.packages("httr")
install.packages("jsonlite")
```


## load library

```
library(plumber)
library(httr)
library(jsonlite)
```

## Create function

```
#* @post /getSum
numberSum<-function(a,b)
{
  retun (a+b)
}
```

## Run server

```
server<-plumb("file path")
server$run(host="your ip",port=4500)
```

## Servic calling through postman or swagger

```
http://youIP:portNo/getSum?a=10&b=20
```


### For better understanding you can go through service.R code, in which 3-4 services are written.
