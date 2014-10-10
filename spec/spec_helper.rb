ENV['RACK_ENV'] = 'test'

require 'rubygems'
require 'bundler'

Bundler.setup

$LOAD_PATH.unshift File.expand_path('../..', __FILE__)

require 'rspec'
