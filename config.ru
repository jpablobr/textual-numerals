# To use with thin
# thin start -p PORT -R config.ru
require 'sinatra'
require 'rubygems'
require 'bundler/setup'

# include our Application code
require File.join(File.dirname(__FILE__), 'arabic_number_translator.rb')

# disable sinatra's auto-application starting
disable :run

# we're in dev mode
set :environment, :development

run Sinatra::Application
