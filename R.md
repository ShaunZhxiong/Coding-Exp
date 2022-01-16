# Markdown Setup
```
---
title: "Assignment3"
author: "Xiong Zheng"
date: "10/24/2021"
output:
  html_document:
    toc: true
    toc_depth: 4
    toc_float: true
    code_folding: hide
  pdf_document: default
---
```
table of contents (TOC) - Get different-level titles
code_folding: hide - Fold the Code

Below is how to format the font in Markdown

```
<style>
p.caption {
  font-size: 0.8em;
  text-align: center;
}
    caption {
      color: grey;
      font-size: 0.8em;
    } 
body{
  font-size: 11pt;
  font-family: Times New Roman;
}
h1,h2,h3,h4,h5,h6{
  font-family: Times New Roman;
}
</style>
```

Code Chunk Setting
```
---No include but run---
{r, include=FALSE,message = FALSE, warning = FALSE, results='hide'}

---Normal---
{r, message = FALSE, warning = FALSE, results='hide'}

---Plot---
{r, message = FALSE, warning = FALSE, results='hide'，fig.width=24, fig.height=16,out.width = '65%',fig.cap = "Figure 1",fig.align = 'center'}

---Include but not run - Fake Code ---
{r message=FALSE,eval = FALSE, warning=FALSE, results='hide'}

```

# Spatial Operation

# Data Operation
## read.csv()
```
churn <-read.csv(file.path(root.dir,"/Chapter6/churnBounce.csv"))

carSpeeds <- read.csv(file = 'data/car-speeds.csv')
```
## st_read()
geojson file
`nhoods <- st_read("Neighborhood_Names_GIS.geojson")`


## as.factor()
> Specify a column type to be factor (also called categorical or enumerative), rather than numeric.
## cbind()
## reindex
`rownames(HCD2) <- 1:nrow(HCD2)`
## rbind()
Add **legend** tags into each dataframe and combine them into one datafram in row aspect
```
rbind(mutate(policeDistricts, Legend = "Police Districts"), 
      mutate(policeBeats, Legend = "Police Beats"))
```
## Logical Operation
```
Logical Operators
Operator	Description
<	less than
<=	less than or equal to
>	greater than
>=	greater than or equal to
==	exactly equal to
!=	not equal to
!x	Not x
x | y	x OR y
x & y	x AND y
isTRUE(x)	test if X is TRUE
```
##
### sort();order()
`HCD2 <- HCD[order(HCD$HCD_Outcome, decreasing = TRUE),]`
### rename()
`rename(dataframe, newcolumn_name=oldcolumn_name)`
###
### unique()
obtain unique value `unique(v)`
obtain frequence of specific unique value `length(v[v==1])`
###
### colnames(df)
Get the List of column names
### lapply(dataframe,class)
Get a list of all classes of the dataframe
###
### Sample()
`sample(x, size, replace = FALSE`
Allocate number within x into a random number set with 'size' number
```
p.s. This function can be used to generate K folds
nrow(fishnet) is 2402
cvID = sample(round(nrow(fishnet) / 24), size=nrow(fishnet), replace = TRUE))
```
##
### table ()
>Count the number of times each unique value appears
```
a_df <- as.data.frame(
    table(b_df))

a_df <- as.data.frame(
    table(b_df$c_column))
```
##
### gsub ()
> Replace specific strings
```df -< mutate(new_column = gsub("[()]", "", old_column))```

E.g. The original column format is `(41.900069913, -87.720123959)`
The after-transferred column format is `41.900069913, -87.720123959`
##
### separate ()
> Separate a string into several parts using specific signals.

```df -< separate(old_column,into= c("new1","new2"), sep=",")```
##
### grid.arrange()
> Organize independent plots

```
grid.arrange(
    ncol=2,
    ggplot ()+
        geom_sf(),
    ggplot ()+
        geom_sf()）
```
##
## Join Section
### full_join()
> Include all rows from a and b dataframs
### left_join()
`new_dataframe <-left_join(datafram1, dataframe2, by="specificcolumn")`
##
## NA Section
To **check** whether a datafram or a column has NA
 `sum(is.na(dataframe$column))`

To return the **names** of all columns and a **sum** of NA values
```
cbind(
   lapply(
     lapply(airquality, is.na), sum))
```

To **omit** the NA Value in calculation
`na.omit()`

# Data Visualization
too many open devices
```
 for (i in dev.list()[1]:dev.list()[length(dev.list())]) {
     dev.off()}
 dev.list()
```
###
There are two types of bar charts: `geom_bar()` and `geom_col()`. `geom_bar()` makes the height of the bar proportional to the number of cases in each group (or if the weight aesthetic is supplied, the sum of the weights). If you want the heights of the bars to represent values in the data, use `geom_col()` instead.

### https://cran.r-project.org/web/packages/kableExtra/vignettes/awesome_table_in_html.html