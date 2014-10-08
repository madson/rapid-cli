# -*- encoding: utf-8 -*-

$LOAD_PATH.unshift 'lib'

require "rapid/version"

Gem::Specification.new do |s|
  s.name 					= "rapid-cli"
  s.version 			= Rapid::VERSION
  s.platform 			= Gem::Platform::RUBY
  s.licenses 			= ['MIT']
  s.date 					= Time.now.strftime('%Y-%m-%d')
  s.summary 			= "Rapid is a command-line toolset."
  s.author 				= "Madson Cardoso"
  s.email 				= "madsonmac@gmail.com"
  s.homepage 			= "http://madsonmac.com"
  s.require_path	= "lib"
  s.files 				= Dir["lib/*.rb"]
  s.executables 	= %w(review version)
  s.has_rdoc      = false


	s.description 		= <<END_DESC
Rapid is a simple command-line toolset to see diff for files in a git
repository more useful when it has more than one modified files.
END_DESC
end

