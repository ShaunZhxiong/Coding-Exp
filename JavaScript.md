# What is JavaScript

- JavaScript is primarily known as the language of most modern web browsers

- http://132.72.155.230:3838/js/index.html#preface

# Variables

There are a few general rules for naming variables:

- Variable names cannot start with numbers.
- Variable names are case sensitive, so `myName` and `myname` would be different variables. It is bad practice to create two variables that have the same name using different cases.
- Variable names cannot be the same as *keywords*. For a comprehensive list of keywords check out [MDN’s keyword documentation](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#Keywords).




```javascript
let myVariable = 'I Exist!';
 
if (myVariable) {
   console.log(myVariable)
} else {
   console.log('The variable does not exist.')
}
```

>The code block in the `if` statement will run because `myVariable` has a *truthy* value; even though the value of `myVariable` is not explicitly the value `true`, when used in a boolean or conditional context, it evaluates to `true` because it has been assigned a non-falsy value.
>
>**So which values are *falsy*— or evaluate to `false` when checked as a condition? The list of falsy values includes:**
>
>- `0`
>- Empty strings like `""` or `''`
>- `null` which represent when there is no value at all
>- `undefined` which represent when a declared variable lacks a value
>- `NaN`, or Not a Number



# short-hand syntax

In a boolean condition, JavaScript assigns the truthy value to a variable if you use the `||` operator in your assignment:

```javascript
let username = '';
let defaultName = username || 'Stranger';
 
console.log(defaultName); // Prints: Stranger
```



# **Ternary Operator**

we can use a *ternary operator* to simplify an `if...else` statement.

```javascript
let isLocked = false;

isLocked ? console.log('You will need a key to open the door.'):
console.log('You will not need a key to open the door.');

let isCorrect = true;

isCorrect ? console.log('Correct!') :
console.log('Incorrect!');

let favoritePhrase = 'Love That!';

favoritePhrase === 'Love That!' ? console.log('I love that!'):
console.log("I don't love that!");
```



# Function

**We should also be aware of the *hoisting* feature in JavaScript which allows access to function declarations before they’re defined.**

```javascript
greetWorld(); // Output: Hello, World!
 
function greetWorld() {
  console.log('Hello, World!');
}
```



## **Concise Body Arrow Functions**

JavaScript also provides several ways to refactor arrow function syntax. The most condensed form of the function is known as *concise body*. We’ll explore a few of these techniques below:

1. Functions that take only a single parameter do not need that parameter to be enclosed in parentheses. However, if a function takes zero or multiple parameters, parentheses are required.

   ![showcasing how arrow functions parameters differ for different amounts of parameters](https://raw.githubusercontent.com/ShaunZhxiong/ImgGarage/main/img/parameters.svg)

2. A function body composed of a single-line block does not need curly braces. Without the curly braces, whatever that line evaluates will be automatically returned. The contents of the block should immediately follow the arrow `=>` and the `return` keyword can be removed. This is referred to as *implicit return*.

![comparing single line and multiline arrow functions](https://raw.githubusercontent.com/ShaunZhxiong/ImgGarage/main/img/return.svg)

So if we have a function:

```javascript
const squareNum = (num) => {
  return num * num;
};
```

We can refactor the function to:

```javascript
const squareNum = num => num * num;
```



## Array

[More Resources](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array)



## Functions

In JavaScript, functions are *first class objects*. This means that, like other objects you’ve encountered, JavaScript functions can have properties and methods.

Since functions are a type of object, they have properties such as `.length` and `.name` and methods such as `.toString()`. You can see more about the methods and properties of functions [in the documentation](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function).

And also function as the object can encode to invoke or pass as a function



# Leaflet

[leaflet-provider](https://leaflet-extras.github.io/leaflet-providers/preview/)