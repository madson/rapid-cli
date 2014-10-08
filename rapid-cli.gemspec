# -*- encoding: utf-8 -*-

$:.unshift File.expand_path("../lib", __FILE__)

require "rapid/version"

Gem::Specification.new do |s|
  s.name = "rapid-cli"
  s.version = Rapid::VERSION
  s.licenses = ['MIT']
  s.date = "2013-10-07"
  s.summary = "Rapid is a command-line toolset."
  s.author = "Madson Cardoso"
  s.email = "madsonmac@gmail.com"
  s.homepage = "http://madsonmac.com"
  s.require_paths = ["lib"]
  s.files = Dir["lib/*.rb"]
  s.executables = ["review", "version"]

	s.description = <<END_DESC
Rapid is a simple command-line toolset to see diff for files in a git
repository more useful when it has more than one modified files.
END_DESC
end

