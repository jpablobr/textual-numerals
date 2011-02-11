require 'rack/test'
require File.join(File.dirname(__FILE__), 'arabic_number_translator.rb')

set :environment, :test

def app
  Sinatra::Application
end

describe 'Arabic Number Translator' do
  include Rack::Test::Methods

  it "should be valid" do
    get '/'
    last_response.body.should =~ /Western numerals using Arabic number characters/
  end

  it "should return the correct content-type when viewing root" do
    get '/'
    last_response.headers["Content-Type"].should == "text/html;charset=utf-8"
  end

  it "should return 404 when page cannot be found" do
    get '/404'
    last_response.status.should == 404
  end

  it "respond to json" do
    post '/json', { :page => { :arabic => "2" }, :commit => "Convert 2 English" }
    last_response.should be_ok
    last_response.body.should == '{"page":{"arabic":"2","western":"two"}}'
  end

  it "respond to xml" do
    post '/xml', { :page => { :arabic => "2"}, :commit => "Convert 2 English" }
    last_response.should be_ok
    last_response.body.should == '<?xml version="1.0" encoding="UTF-8"?>
<page>
  <arabic>
    <![CDATA[2]]>
  </arabic>
  <western>
    <![CDATA[two]]>
  </western>
</page>
'
  end
  it "respond proper json if spanish if requested" do
    post '/json', { :page => { :arabic => "2" }, :commit => "Convert 2 Spanish" }
    last_response.should be_ok
    last_response.body.should == '{"page":{"arabic":"2","western":"dos"}}'
  end

  it "respond proper xml if spanish if requested" do
    post '/xml', { :page => { :arabic => "2"}, :commit => "Convert 2 Spanish" }
    last_response.should be_ok
    last_response.body.should == '<?xml version="1.0" encoding="UTF-8"?>
<page>
  <arabic>
    <![CDATA[2]]>
  </arabic>
  <western>
    <![CDATA[dos]]>
  </western>
</page>
'
  end

end
