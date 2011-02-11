require 'rubygems'
require 'bundler/setup'
require 'sinatra'

set :environment, :production
disable :run

require 'arabic_number_translator.rb'

run Sinatra::Application
