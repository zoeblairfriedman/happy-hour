#best practice is an absolute path for gems (shorthand):
require 'pry'
require 'httparty'
require "open-uri"
require 'awesome_print'
require 'geocoder'


#take a relative path for these things:
require_relative ("../lib/cli")
require_relative ("../lib/api")
require_relative ("../lib/bar")
require_relative ("../lib/googleapi")
# require other classes here as well