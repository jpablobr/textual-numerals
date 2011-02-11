require 'sinatra'
require "haml"
require "json"

# Helpers for filtering data
helpers do
  include Rack::Utils
  alias_method :h, :escape_html
end

get "/" do
  haml :index
end

#  Main handler for the posted data.
post "/*" do
  puts params["commit"]
  if params["page"]
    @arabic = params["page"]["arabic"]

    # Parses depending on requested format. It would be very simple to add more
    # formats with something like a drop-down in the HTML form.
    if params["commit"] == "Convert 2 English"
      @western = arabic_to_english(@arabic)
    else
      @western = arabic_to_spanish(@arabic)
    end

    # If json requested parse data to json.
    if params[:splat].include?("json")
      {:page => {:arabic => @arabic, :western => @western}}.to_json
    elsif params[:splat].include?("xml")
      to_xml
    else
      haml :index
    end
  end
end

# This should retur
# the arabic number in western format.
def arabic_to_english(arabic); end

def arabic_to_spanish(arabic); end

# XML builder for xml representation
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
