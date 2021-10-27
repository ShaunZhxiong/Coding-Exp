## Read file
### Geojson
`pd.read_json("file_path")`
`pd.read_json("file_path",orient="records",lines=True)`

## Text Mining
`.lower()` makes all words lower cased
`.split()` splits a string into the individual words

E.g. how to add a new column and do the text mining
`dataframe["new_column"] = dataframe["old_column"].str.lower().str.split()`

![alt text](https://github.com/ShaunZhxiong/Coding-Exp/blob/main/Pics/FireShot%20Capture%20010%20-%20assignment-4%20-%20Jupyter%20Notebook%20-%20localhost.png?raw=true)
