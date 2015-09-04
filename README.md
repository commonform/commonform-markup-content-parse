```javascript
var parse = require('commonform-markup-content-parse')
```

The exported function takes a string argument containing a single line of text with common form markup tags and returns a common form.

# Definitions

Write the term being defined between double-double quotes:

```javascript
var assert = require('assert')

assert.deepEqual(
  parse('Define terms like ""Consideration""'),
  [ 'Define terms like ', { definition: 'Consideration' } ])
```

Terms cannot start or end with spaces:

```javascript
assert.throws(
  function() {
    parse('Define terms like ""Consideration ""') })

assert.throws(
  function() {
    parse('Define terms like "" Consideration""') })
```

# Uses

To use a term, type it between angle brackets:

```javascript
assert.deepEqual(
  parse('Use defined terms like <Consideration>'),
  [ 'Use defined terms like ', { use: 'Consideration' } ])
```

# References

Reference a form by typing its heading within curly brackets:

```javascript
assert.deepEqual(
  parse('Reference headings like {Services}'),
  [ 'Reference headings like ', { reference: 'Services' } ])
```

# Blanks

Write a label for a fill-in-the-blank in square brackets:

```javascript
assert.deepEqual(
  parse('Leave blanks like [Company Name]'),
  [ 'Leave blanks like ', { blank: 'Company Name' } ])
```

# All Together

```javascript
assert.deepEqual(
  parse(
    [ 'Define a term ""Apple"" ',
      'then use it <Apple> ',
      'while referencing {Orange} ',
      'with a blank for [Berry]' ]
      .join('')),
  [ 'Define a term ', { definition: 'Apple' },
    ' then use it ', { use: 'Apple' },
    ' while referencing ', { reference: 'Orange' },
    ' with a blank for ', { blank: 'Berry' } ])
```
