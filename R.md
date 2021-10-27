## Data Operation
## Spatial Operation
## rbind()
Add **legend** tags into each dataframe and combine them into one datafram in row aspect
```
rbind(mutate(policeDistricts, Legend = "Police Districts"), 
      mutate(policeBeats, Legend = "Police Beats"))
```
##
### rename()
`rename(dataframe, newcolumn_name=oldcolumn_name)`
##
### unique()
obtain unique value `unique(v)`
obtain frequence of specific unique value `length(v[v==1])`
##
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