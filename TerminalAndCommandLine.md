# Resources: Comes from [here](https://developer.mozilla.org/en-US/docs/Learn/Tools_and_testing/Understanding_client-side_tools/Command_line)


- Navigate your computer’s file system along with base level tasks such as create, copy, rename and delete:

  - Move around your directory structure: `cd`

    ```markdown
    cd ..
    
    `tab` can help autocomplete the directory name 
    
    if you are not sure of the path you can usually figure it out with a combination of the `ls` command
    
    `\``on your path makes the path absolute, for example ``cd Desktop\project\src`
    ```

    

  - Create directories: `mkdir`

  - Remove the named directory: `rmdir`

    ```markdown
    mkdir aNewFolderName
    rmdir deletedFolderName
    ```

  - Create files (and modify their metadata) in PowerShell: `New-Item`

  - Copy files: `cp` | Move files: `mv`

    ```
    # this can be used to rename/copy the file
    mv mdn-example.md mdn-example.txt 
    cp mdn-example.md mdn-example.txt
    
    # Also it can be used to move a file from the first specified file location to the second specified file location
    ```

  - Delete files or directories: `rm`

    ```markdown
    Many terminal commands allow you to use asterisks as "wild card" characters, meaning "any sequence of characters". This allows you to run an operation against a potentially large number of files at once, all of which match the specified pattern. As an example, 
    `rm mdn-* `
    would delete all files beginning with mdn-. 
    `rm mdn-*.bak`
    would delete all files that start with mdn- and end with .bak.

- Download files found at specific URLs: `curl`

- Search for fragments of text inside larger bodies of text: `grep`

- View a file's contents page by page: `less`, `cat`

- Manipulate and transform streams of text (for example changing all the instances of `<div>`s in an HTML file to `<article>`): `awk`, `tr`, `sed`