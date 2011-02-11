# Textual numerals web service

## Task
We usually write western numerals using Arabic number characters (1, 2, 3, ...), but we can
also use textual phrases to represent those numbers.

For example (in English and Spanish):
7 → seven → siete
42 → forty-two → cuarenta y dos
2001 → two thousand and one → dos mil uno
1999 → one thousand nine hundred and ninety-nine
Your task is to design and implement a web service implementing the algorithm to translate a
number into its textual representation and some related services.

## Requirements

The web service should follow the best practices you know about web services.
The web service do not need to have a elaborated graphical user interface, but it will
need a basic one (one that allows the user to input the parameters of the web service).
It will also need a machine-oriented interface (using some data exchange format like
simple text, JSON or XML).

You can implement several languages if you want, but at least one of the must be
English.

One endpoint of the application will receive an Arabic numeral and will return its textual
representation to the user.

Optionally another endpoint of the application will receive two Arabic numerals and a
parameter indicating if the user wants an odd or even answer, and it will return which
odd or even number between the two numbers would be sorted first when written in its
textual representation.

The use of external libraries is allowed as long as they are necessary (a web framework
for example, is allowed). But otherwise try to use as few 3rd party libraries as possible.
The algorithms that you implement should have the lowest possible Big-O complexity
both in time and space.
## What we look at

This task should give us an idea of how you think about solving problems with a limited amount
of time. We look at how you structure your code, how it can be easily extended in the future
when the requirements change, how easy is to understand and modify by others and how well
it adheres to good object oriented practices. We also look at how efficient your code is, both in
terms of space and time, code commenting, code structure and testing.
## Questions?

Any open question should be answered freely by the candidate. We want you to show initiative,
and defend your point of view, so provide us with an explanation that can convice us.

## Implementation:

### To use with thin
$ thin start -p PORT -R config.ru

### Api

It works properly with json and xml.

You can also run the convert via a RestClient or Curl Client.

### Testing

[RSpec](http://wiki.github.com/dchelimsky/rspec)

[Sinatra testing](http://www.sinatrarb.com/testing.html)

Sinatra now relies on Rack::Test and has deprecated the use of Sinatra::Test.

`sudo gem install rack-test`

See `./arabic_number_translator_spec.rb`

### TODO

Implement the following methods:

`def arabic_to_english(arabic); end`

`def arabic_to_spanish(arabic); end`

Odd or even returns depending on user input.

### Directory Structure:
.
|-- arabic_number_translator.rb
|-- arabic_number_translator_spec.rb
|-- config.ru
|-- doc
|-- Gemfile
|-- Gemfile.lock
|-- lib
|-- public
|   `-- stylesheets
|       |-- 960.css
|       |-- app.css
|       |-- reset.css
|       `-- text.css
|-- readme.markdown
|-- REVISION
`-- views
    |-- index.haml
    `-- layout.haml

