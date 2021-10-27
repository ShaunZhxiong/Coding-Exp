## Read file
### Geojson
`pd.read_json("file_path")`
`pd.read_json("file_path",orient="records",lines=True)`

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