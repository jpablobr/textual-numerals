# Textual numerals web service

    $ git clone http://
    $ bundle install

### To use with thin

    $ thin start -p PORT -R config.ru

### Api

It works properly with json and xml.

You can also ru
n the convert via a RestClient or Curl Client.

### Sample json call:

        $(function() {
           $.post("/json",  { page: { arabic: "2" }, commit: "Convert 2 English" }, function(data) { console.log(data);}, "json");
       });

### Testing

[RSpec](http://wiki.github.com/dchelimsky/rspec)

[Sinatra testing](http://www.sinatrarb.com/testing.html)

Sinatra now relies on Rack::Test and has deprecated the use of Sinatra::Test.

        $ sudo gem install rack-test

See `./arabic_number_translator_spec.rb`

To run the test:

        $ ruby ruby arabic_number_translator_spec.rb

### TODO

Add or even returns depending on user input.

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
|-- README.md
|-- REVISION
`-- views
    |-- index.haml
    `-- layout.haml
