#best practice is an absolute path for gems (shorthand):
require 'pry'
require 'httparty'


#take a relative path for these things:
require_relative("../lib/cli")
require_relative ("../lib/api")
# require other classes here as well