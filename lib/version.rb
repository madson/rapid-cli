require 'highline/import'

module Version
  class InvalidFormat < Exception; end
  
	class << self

		COMMANDS = ['major', 'minor', 'patch']
		REGEX = /^([0-9]+)\.?([0-9]*)\.?([0-9]*)/
    
    def upgrade_version version, command = nil
      raise ArgumentError unless version
      raise InvalidFormat unless version.to_s =~ REGEX
      
			parts = version.to_s.scan(REGEX)
			parts = parts.first
			parts.map! { |i| i.to_i }

			major = parts[0]
			minor = parts[1]
			patch = parts[2]

			if command == COMMANDS[0]
				major += 1
				minor = 0
				patch = 0
			elsif command == COMMANDS[1]
				minor += 1
				patch = 0
			else
				patch += 1
			end

			"#{major}.#{minor}.#{patch}"      
    end
		
		def run
			version = ARGV[0]
			command = ARGV[1]
      
			unless ARGV.size > 1 or version =~ REGEX
				puts 'Usage: version <version> <command>'
				puts
				puts 'Commands:'
				puts "\tmajor\tUpgrade major number"
				puts "\tminor\tUpgrade minor number"
				puts "\tpatch\tUpgrade patch number"
				puts
				puts 'Example:'
				puts "\tversion 1.3.5 minor"
				exit 0
			end

      puts upgrade_version version, command

			exit 1
		end # run
	
	end # class
end # module

