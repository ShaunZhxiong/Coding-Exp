## Read file
### Geojson
`pd.read_json("file_path")`
`pd.read_json("file_path",orient="records",lines=True)`
`holc = gpd.read_file("./data/redlining.geojson")`
##
## Data Wrangling
#### Deal with NA
- Replace the null values with a space(“ “).
- Replace the null values with mean/median/mode of the respective columns.
- The final resort : delete the record/row containing the null value.NOTE: Do this only if your data is not important. Doing this might delete crucial information from your dataset.
```
# Check for null values.
dataset.isnull()

# Check the sum of NA values.
dataset.isnull().sum()

# To fill the null values
modifiedDataset=dataset.fillna(" ")

# To replace the null values with mean/median/mode
dataset.fillna(dataset.mean())

# To delete the entire cell with the null value
modifiedDataset = dataset.dropna()
```
#### Rename
`df.rename(columns={"A": "a"}, errors="raise")`

#### [Subeset dataframe from a datafram](https://datacarpentry.org/python-ecology-lesson/03-index-slice-subset/)
```
# Column

## Easy ways
new_Df=DF[[column]]

## Select all rows for columns:
new_df.loc[:,["column_name1",column_name2"]]

##
Within the data frame, to trime to the columns we want
columns = ['GEO.display-label', 'HD01_VD01', 'HD01_VD03']
census_df = census_df[columns]

# Row
## Select all columns for rows [0,10] 
surveys_df.loc[[0, 10], :]
```
#### .sample()
Select n random rows from a datafram `new_Dataframe = old_datafram.sample(n = 1000)`
#### .to_frame()
To convert the given series object to a dataframe.
#### Get all columns name
`df.columns`
#### Add new columns
`dataframe["newframe"]=value/string/something`
#### Drop Column
`df.drop(columns=['B', 'C'])`
#### .dtype
Check data types
#### .pd.merge() & pd.concat() & join()
>- .pd.merge()

`df3 = pd.merge(df1, df2, on="ID")`
```
new_df = old_df1.merge(
    old_df2,
    left_on=["column1", "column2", "column3"],
    right_on=["column1.1", "column2.2", "column3.3"],
)
```

>- pd.concat()
1. Can concat multiple dataframes at one time
2. However, if there exists same columns in each dataframe, they will be remained.
#### .shape[]
- The shape attribute for numpy arrays returns the dimensions of the array. If Y has n rows and m columns, then Y.shape is (n,m)
- Y.shape[0] is n. 
##
##
## Text Mining
#### [Seperate and lower the character](https://piazza.com/class/ksndf5uswe77dq?cid=72)
`.lower()` makes all words lower cased
`.split()` splits a string into the individual words

E.g. how to add a new column and do the text mining (examples are used as following)
`dataframe["new_column"] = dataframe["old_column"].str.lower().str.split()`

![alt text](https://github.com/ShaunZhxiong/Coding-Exp/blob/main/Pics/FireShot%20Capture%20010%20-%20assignment-4%20-%20Jupyter%20Notebook%20-%20localhost.png?raw=true)

#### Remove the stop words
```
import nltk
import string
stop_words = list(set(nltk.corpus.stopwords.words('english')))
punctuation = list(string.punctuation)
ignored = stop_words + punctuation
```
```
# to lists in dataframs or just lists

dataframe["text_column"] = [
    [i for i in b if i not in ignored] 
    for b in dataframe["text_column"]
    ]
```
#### Sentiment Analysis
`blobs = [textblob.TextBlob(" ".join(b)) for b in datafram["formatted_text"]]`

p.s.`" ".join(b)` is to convert a list to string, by which the `textblob.TextBlob()` function could use.
##
## Web Scrapping
`soup.select_one(selector)`finds the first element matching the selector query and returns one element
`soup.select(selector)`finds all elements matching the selector

##
## Geospatial Wrangling
`boundary = cascaded_union(clv_MMedHHInc_M['geometry'])`
Geometry points do not have crs, only polygons have.
#### FIPS CODE
```
counties = cenpy.explorer.fips_table("COUNTY")
counties.loc[ counties[3].str.contains("Philadelphia") ]
```
#### Coordinate System
```
DF['geometry'] = gpd.points_from_xy(DF['longitude'], DF['latitude'])
DF = gpd.GeoDataFrame(DF, geometry='geometry', crs="EPSG:XXXXX")
```

## Graph Systems
>Seaborn is built on top of matplotlib,which means they should be loaded at the same time.

>What is the difference between **plt** and **ax** in matplotlib [Clik](https://stackoverflow.com/questions/37970424/what-is-the-difference-between-drawing-plots-using-plot-axes-or-figure-in-matpl)
### Plot Examples

#### [Matplot Colormap](https://matplotlib.org/2.0.2/users/colormaps.html)
#### Scatter Plot
```
# Plot Scatter
fig, ax = plt.subplots(figsize=(90,55))
size_scatter=12*filtered['count']
plt.scatter('polarity', 'stars', s=size_scatter,
            data=filtered,color="red", alpha=0.5,
           edgecolors="white", linewidth=2)
plt.xlim(0.05, 0.42)
plt.ylim(2, 4.5)
plt.grid(color='#A8A8A8', lw=5,linestyle='dashed')

# Plot Text
for a in range(len(filtered)):
    ax.text(x=filtered.iloc[a,3]+0.001,y=filtered.iloc[a,2],s=filtered.iloc[a,0])

# Setting
ax.axvline(x=mean_polarity, c='k', lw=10,linestyle='dashed')
ax.axhline(y=mean_stars, c='k', lw=10,linestyle='dashed')
ax.set_xlabel("Polarity", fontsize=75)
ax.set_ylabel("Stars", fontsize=75);
ax.set_title("Polarity as a function of Reviews' stars", fontsize=100);
ax.tick_params(axis='both', which='major', labelsize=65)
ax.spines["left"].set_color("black")
ax.spines["bottom"].set_color("black")

# Regression Line
linear_regressor = LinearRegression()
polarity=filtered['polarity'].values
stars=filtered['stars'].values
polarity=polarity.reshape(-1,1)
linear_regressor = LinearRegression()
linear_regressor.fit(np.log(polarity), stars)
x_pred = np.log(np.linspace(0.05, 0.42, num=200).reshape(-1, 1))
y_pred = linear_regressor.predict(x_pred)
ax.plot(np.exp(x_pred), y_pred, color="#696969", lw=10)

plt.rcParams['axes.facecolor'] = 'white'
```
![alt text](https://github.com/ShaunZhxiong/Coding-Exp/blob/main/Pics/scatter1.png?raw=true)

#### Plot Chronopleth
[BASEMap Tuorial](https://geopandas.org/gallery/plotting_basemap_background.html)
[BASEMap Library ](https://towardsdatascience.com/free-base-maps-for-static-maps-using-geopandas-and-contextily-cd4844ff82e1)
```
fig, ax = plt.subplots(figsize=(20,10))
clv_MMedHHInc_M.plot(
    ax=ax, 
    column='MedHHInc',
    legend=True,
    cmap='viridis',
    scheme='quantiles', 
    alpha=0.4, 
    edgecolor='k'
)

cx.add_basemap(ax,zoom=12, crs=clv_MMedHHInc_M.crs, source=cx.providers.OpenStreetMap.Mapnik)
ax.set_axis_off()
ax.set_title("Median Household Income, Cleveland", fontsize=25);
```
![alt text](https://github.com/ShaunZhxiong/Coding-Exp/blob/main/Pics/choropleth1.png?raw=true)

```
from mpl_toolkits.axes_grid1 import make_axes_locatable
import contextily as cx

fig, ax = plt.subplots(figsize=(10,10))

divider = make_axes_locatable(ax)
cax = divider.append_axes("right", size="5%", pad=0.1)

c_limit.plot(ax=ax, edgecolor='black', facecolor='none', linewidth=4)

geo_philly.plot(ax=ax, edgecolor='black', facecolor='none', linewidth=0.1)

st_trees.plot(
    column='NDVI', 
    legend=True, 
    ax=ax,
    cax=cax,
    cmap='OrRd',
    s = 55,
    alpha = 0.5)

cx.add_basemap(ax,
               zoom=12, 
               crs=st_trees.crs)

plt.title("Brooklyn",fontsize=10)
ax.set_title("Tree NDVI in Philadelphia EPSG:32618", fontsize=18);
```
![alt text](https://github.com/ShaunZhxiong/Coding-Exp/blob/main/Pics/choropleth2.png?raw=true)

```
# Set canvas
fig, axs = plt.subplots(ncols=2,figsize=(20,10))
ax1=axs[0]
ax2=axs[1]

# hexbin coordinate
xcoords = mergedf.geometry.x
ycoords = mergedf.geometry.y
polarity = mergedf.polarity

# Tract plot
clv_MMedHHInc_M.plot(ax=ax1,facecolor="none", edgecolor="black", linewidth=0.25)
clv_MMedHHInc_M.plot(ax=ax2,facecolor="none", edgecolor="black", linewidth=0.25)

# Hexbin plot
hex_vals1 = ax1.hexbin(
    xcoords, 
    ycoords, 
    gridsize=30,
    C=mergedf.polarity,
    reduce_C_function=np.median)

hex_vals2 = ax2.hexbin(
    xcoords, 
    ycoords, 
    gridsize=30,
    C=mergedf.stars,
    reduce_C_function=np.median)

ax1.set_title("Map of Review Polarities, Celveland", fontsize=18);
ax2.set_title("Map of Restaurant, Celveland", fontsize=18);

ax1.set_axis_off()
ax2.set_axis_off()

# Color bar
divider1 = make_axes_locatable(ax1)
cax1 = divider1.append_axes('right', size='5%', pad=0.05)
colorbar_polarity=fig.colorbar(hex_vals1, cax=cax1, orientation='vertical')

divider2 = make_axes_locatable(ax2)
cax2 = divider2.append_axes('right', size='5%', pad=0.05)
colorbar_stars=fig.colorbar(hex_vals2, cax=cax2, orientation='vertical')

colorbar_polarity.ax.set_title('Polarity')
colorbar_stars.ax.set_title('Star')

# Basemap plot
cx.add_basemap(ax1,zoom=13, crs=clv_MMedHHInc_M.crs, source=cx.providers.OpenStreetMap.Mapnik)
cx.add_basemap(ax2,zoom=13, crs=clv_MMedHHInc_M.crs, source=cx.providers.OpenStreetMap.Mapnik)
```
![alt text](https://github.com/ShaunZhxiong/Coding-Exp/blob/main/Pics/choropleth3.png?raw=true)
#### Seaborn Boxplot
```
figure, axes = plt.subplots(1, 2)
figure.suptitle("Polarity & Subjectivity Plots based on Review Stars",fontsize=25)
flierprops = dict(marker='+', markerfacecolor='black', markersize=1, markeredgecolor='black')
sns.set_style("whitegrid")
sns.set(rc={'axes.facecolor':'#F0F0F1'})

boxplot1=sns.boxplot(
    y='polarity', 
    x='stars', 
    linewidth=1,
    data=review_clv, 
    color="#5687BA",
    ax=axes[0],
    width=0.6,
    flierprops=flierprops)

boxplot2=sns.boxplot(
    y='subjectivity', 
    x='stars', 
    linewidth=1,
    data=review_clv, 
    color="#E23446",
    ax=axes[1],
    width=0.6,
    flierprops=flierprops)

boxplot1.set_xlabel("Stars", fontsize=14)
boxplot1.set_ylabel("Polarity", fontsize=14)
boxplot2.set_xlabel("Stars", fontsize=14)
boxplot2.set_ylabel("Subjectivity", fontsize=14)
axes[0].axhline(y=0, c='k', lw=2,linestyle='--') 
axes[1].axhline(y=0, c='k', lw=2,linestyle='--') 

for patch in boxplot1.artists:
 r, g, b, a = patch.get_facecolor()
 patch.set_facecolor((r, g, b, .6))
for patch in boxplot2.artists:
 r, g, b, a = patch.get_facecolor()
 patch.set_facecolor((r, g, b, .6))
for line in boxplot1.get_lines():
   line.set_color('black')
for line in boxplot2.get_lines():
   line.set_color('black')

plt.rcParams["figure.figsize"] = [16,10]
plt.show()
```
![alt text](https://github.com/ShaunZhxiong/Coding-Exp/blob/main/Pics/seaborn_boxplots.png?raw=true)