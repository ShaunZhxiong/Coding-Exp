# Sources: [here](https://developer.mozilla.org/en-US/docs/Learn/HTML/Introduction_to_HTML/The_head_metadata_in_HTML)
1. Tags in HTML are not case-sensitive. This means they can be written in uppercase or lowercase. For example, a `<title>` tag could be written as `<title>`, `<TITLE>`, `<Title>`, `<TiTlE>`, etc., and it will work. However, it is best practice to write all tags in lowercase for consistency and readability.

2. Elements can be placed within other elements. This is called ***nesting***. If we wanted to state that our cat is **very** grumpy, we could wrap the word *very* in a [`<strong>`](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/strong) element, which means that the word is to have strong(er) text formatting:

   ```html
   <p>My cat is <strong>very</strong> grumpy.</p>
   ```

3. if you use one type of quote, you can include the other type of quote *inside* your attribute values:

   ```html
   <a href="https://www.example.com" title="Isn't this fun?">A link to my example.</a>

   OR

   <a href='https://www.example.com' title='Isn&apos;t this fun?'>A link to my example.</a>
   ```

4. `<!DOCTYPE html>`: The doctype. When HTML was young (1991-1992), doctypes were meant to act as links to a set of rules that the HTML page had to follow to be considered good HTML. Doctypes used to look something like this:

   ```
   <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
   ```

   More recently, the doctype is a historical artifact that needs to be included for everything else to work right. `<!DOCTYPE html>` is the shortest string of characters that counts as a valid doctype. That is all you need to know!
   
5. `<HEAD>` `</HEAD>`

   The [`<HEAD>`](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/head) element. This element acts as a container for everything you want to include on the HTML page, **that isn't the content** the page will show to viewers. 

   This includes keywords and a page description that would appear **in search results**, **CSS to style content**, **character set declarations**, and more. You'll learn more about this in the next article of the series.

6. | Literal character | Character reference equivalent |
	| :---------------: | :----------------------------: |
	|         <         |             `&lt;`             |
	|         >         |             `&gt;`             |
	|         "         |            `&quot;`            |
	|         '         |            `&apos;`            |
	|         &         |            `&amp;`             |

7. Change the link images

   ```html
   <meta property="og:image" content="https://developer.mozilla.org/static/img/opengraph-logo.png">
   <meta property="og:description" content="The Mozilla Developer Network (MDN) provides
   information about Open Web technologies including HTML, CSS, and APIs for both Web sites
   and HTML5 Apps. It also documents Mozilla products, like Firefox OS.">
   <meta property="og:title" content="Mozilla Developer Network">
   ```

   	![Open graph protocol data from the MDN homepage as displayed on facebook, showing an image, title, and description.](https://developer.mozilla.org/en-US/docs/Learn/HTML/Introduction_to_HTML/The_head_metadata_in_HTML/facebook-output.png)

​		**Also the custom icons in the site**

8. Applying CSS and JavaScript to HTML

   Just about all websites you'll use in the modern day will employ [CSS](https://developer.mozilla.org/en-US/docs/Glossary/CSS) to make them look cool, and [JavaScript](https://developer.mozilla.org/en-US/docs/Glossary/JavaScript) to power interactive functionality, such as video players, maps, games, and more. These are most commonly applied to a web page using the [``](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/link) element and the [``](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/script) element, respectively.

   The`<link>`element should always go inside the head of your document. This takes two attributes, `rel="stylesheet"`, which indicates that it is the document's stylesheet, and `href`, which contains the path to the stylesheet file:
   
   ```html
   <link rel="stylesheet" href="my-css-file.css">
   ```
   
   The [`<script>`](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/script) element should also go into the head, and should include a `src` attribute containing the path to the JavaScript you want to load, and `defer`, which basically instructs the browser to load the JavaScript after the page has finished parsing the HTML. This is useful as it makes sure that the HTML is all loaded before the JavaScript runs, so that you don't get errors resulting from JavaScript trying to access an HTML element that doesn't exist on the page yet. There are actually a number of ways to handle loading JavaScript on your page, but this is the most foolproof one to use for modern browsers (for others, read [Script loading strategies](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/First_steps/What_is_JavaScript#script_loading_strategies)).
   
   ```html
   <script src="my-js-file.js" defer></script>
   ```
   
9. Elements inside the `<body>`

   **header:** `<header>`

   **navigation bar:** `<nav>`

   **main content:** `<main>`, with subsections like `<article>`, `<section>`, and `<div>` elements

   **sidebar:** `<aside>`; often placed inside `<main>`

   **footer:** `<footer>`

10. `<class>`

    Sometimes you might want to just group a set of elements together to affect them all as a single entity with some [CSS](https://developer.mozilla.org/en-US/docs/Glossary/CSS) or [JavaScript](https://developer.mozilla.org/en-US/docs/Glossary/JavaScript). For cases like these, HTML provides the [`<div>`](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/div) and [`<span>`](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/span) elements. You should use these preferably with a suitable [`class`](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes#attr-class) attribute, to provide some kind of label for them so they can be easily targeted.
    
    > Divs are so convenient to use that it's easy to use them too much. As they carry no semantic value, they just clutter your HTML code. Take care to use them only when there is no better semantic solution and try to reduce their usage to the minimum otherwise you'll have a hard time updating and maintaining your documents.

11. **Break** elements

    `<br>`

    `<hr>`	create a horizontal rule in the document

    

12. **List** element

    `<ul>`  Every **unordered list** starts off with a [`<ul>`](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/ul) element—this wraps around all the list items:

	```html
	<ul>
	  <li>milk</li>
	  <li>eggs</li>
	  <li>bread</li>
	  <li>hummus</li>
	</ul>
	```
      `<ol>` for **ordered list**

	```HTML
	<ol>
	  <li>Drive to the end of the road</li>
	  <li>Turn right</li>
	  <li>Go straight across the first two roundabouts</li>
	  <li>Turn left at the third roundabout</li>
	  <li>The school is on your right, 300 meters up the road</li>
	</ol>
	```

​		**It is perfectly OK to nest one list inside another one.** 

13. **Link**
	```html
	<p>I'm creating a link to
	<a href="https://www.mozilla.org/en-US/"
	   title="The best place to find more information about Mozilla's
	          mission and how to contribute">the Mozilla homepage</a>.
	</p>
	```

e.g.	
​![image-20220111165211240](https://raw.githubusercontent.com/ShaunZhxiong/ImgGarage/main/img/image-20220111165211240.png)

​	A URL, or Uniform Resource Locator is a string of text that defines where   	something is located on the Web. For example, Mozilla's English homepage 	is located at `https://www.mozilla.org/en-US/`.



​	It's possible to link to a specific part of an HTML document, known as a **document fragment**, rather than just to the top of the document. to link to that specific `id`, you'd include it at the end of the URL, preceded by a hash/pound symbol (`#`), for example:

```html
<--! To id a fragment-->
<h2 id="Mailing_address">Mailing address</h2>

<--! To jump to a fragment-->
<p>Want to write us a letter? Use our <a href="contacts.html#Mailing_address">mailing address</a>.</p>
```

