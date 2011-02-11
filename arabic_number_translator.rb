require 'rubygems'
require 'bundler'
Bundler.require
require 'sinatra'
require 'google_translate'

helpers do
  include Rack::Utils
  alias_method :h, :escape_html
end

get "/" do
  haml :index
end

#  Main handler for data parsing.
post "/*" do
  if params["page"]
    @arabic = params["page"]["arabic"]

    # Parses depending on requested format.
    # It would be very simple to add moreformats
    # with something like a drop-down in the HTML form.
    if params["commit"] == "Convert 2 English"
      @western = arabic_to_english(@arabic)
    else
      @western = arabic_to_spanish(@arabic)
    end

    # JSON or XML
    if params[:splat].include?("json")
      {:page => {:arabic => @arabic, :western => @western}}.to_json
    elsif params[:splat].include?("xml")
      to_xml
    else
      haml :index
    end
  end
end

# This should return
# the arabic number in western format.
def arabic_to_english(arabic);
  Linguistics::EN.numwords(arabic)
end

def arabic_to_spanish(arabic);
  t = Google::Translator.new
  en_results = arabic_to_english(arabic)
  t.translate :en, :es, en_results
end

def to_xml
  builder do |xml|
    xml.instruct!
    xml.page do
      xml.arabic do
        xml.cdata! @arabic
      end
      xml.western do
        xml.cdata! @western
      end
    end
  end
end
