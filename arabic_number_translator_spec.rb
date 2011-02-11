require 'sinatra'
require 'arabic_number_translator.rb'
require 'spec'
require 'spec/interop/test'
require 'rack/test'
require 'builder'

set :environment, :test

def app
  Sinatra::Application
end

describe 'Arabic Number Translator' do
  include Rack::Test::Methods

  it "says hello via json" do
    post '/json', { :page => { :arabic => "2" } }
    last_response.should be_ok
    last_response.body.should == '{"page":{"arabic":"2","western":"two\n"}}'
  end

  it "says hello via xml" do
    post '/xml', { :page => { :arabic => "2" } }
    last_response.should be_ok
    last_response.body.should == "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<page>\n  <arabic>\n    <![CDATA[2]]>\n  </arabic>\n  <western>\n    <![CDATA[two\n]]>\n  </western>\n</page>\n"
  end

end
