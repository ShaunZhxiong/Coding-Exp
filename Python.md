## Read file
### Geojson
`pd.read_json("file_path")`
`pd.read_json("file_path",orient="records",lines=True)`
##
## Data Wrangling
#### .sample()
Select n random rows from a datafram
`new_Dataframe = old_datafram.sample(n = 1000)`
#### .to_frame()
To convert the given series object to a dataframe.
#### Add new columns
`dataframe["newframe"]=value/string/something`
#### .dtype
Check data types

##
##
## Text Mining
#### Seperate and lower the character
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
## Graph Systems
>Seaborn is built on top of matplotlib,which means they should be loaded at the same time.
### Plot Examples
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