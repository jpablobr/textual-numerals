## Textual numerals web service

Disclaimer: This is just some hacked stuff that I did in a few hours...

[http://textual-numerals.heroku.com/](http://textual-numerals.heroku.com/)

    $ git clone https://github.com/jpablobr/textual-numerals.git
    $ cd textual-numerals
    $ bundle install
    $ rackup

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

    $ ruby arabic_number_translator_spec.rb

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

### Note on Patches/Pull Requests

Fork the project.
Make your feature addition or bug fix.
Add tests for it. This is important so I don’t break it in a future version unintentionally.
Commit, do not mess with rakefile, version, or history. (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
Send me a pull request. Bonus points for topic branches.

### Copyright

Copyright 2011 Jose Pablo Barrantes. MIT Licence, so go for it.
