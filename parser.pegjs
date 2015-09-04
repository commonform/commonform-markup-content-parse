start = elements:( Element + ) { return elements }

Element
  = Definition / Use / Reference / Blank / Text

Text
  = chars:( ( Space / Word ) + )
    { return chars.join('') }

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
  = chars:(
      ( ! ( "\"\"" /
            "<" / ">" /
            "{" / "}" /
            "[" / "]" )
        Char ) + )
    { return chars
        .map(function(x) { return x[1] })
        .join('') }

Indentifier
  = a:SafeChar chars:( ( SafeChar / SafeSpace ) * )
    { return a + chars.join('') }

SafeSpace
  = a:Space b:SafeChar
    { return a + b }

SafeChar
  = char:[0-9A-Za-z\-\']
    { return char }

Char
  = char:[\x20-\x7E]
    { return char }

Space
  = chars:( " " + )
    { return chars.join('') }
