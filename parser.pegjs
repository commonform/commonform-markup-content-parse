START
  = elements:( Element + )
    { return elements }

Element
  = Definition / Use / Reference / Blank / Text

Text
  = characters:( ( Space / Word ) + )
    { return characters.join('') }

Definition
  = "\"\"" term:Indentifier "\"\""
    { return { definition: term } }

Use
  = "<" term:Indentifier ">"
    { return { use: term } }

Reference
  = "{" heading:Indentifier "}"
    { return { reference: heading } }

Blank
  = "[" label:Indentifier "]"
    { return { blank: label } }

Word
  = characters:(
        ( ! ( Definition / Use / Reference / Blank )
            TextChar ) + )
    { return characters
        .map(function(x) { return x[1] })
        .join('') }

Indentifier
  = firstCharacter:IndentifierChar
    characters:( ( IndentifierChar / IndentifierSpace ) * )
    { return firstCharacter + characters.join('') }

IndentifierSpace
  = space:Space character:IndentifierChar
    { return space + character }

IndentifierChar
  = characters:[0-9A-Za-z\-\']
    { return characters }

TextChar
  = characters:[\x20-\x7E]
    { return characters }

Space
  = characters:( " " + )
    { return characters.join('') }
