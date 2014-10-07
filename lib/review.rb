require 'rubygems'
require 'highline/import'

module Review
	class << self

		OUTPUT = `git status --porcelain | grep "^[ ]\\?M" | sed s/^...//`
		FILES = OUTPUT.split("\n")

		def show_diff_for(filename)
			cmd = "git diff " + filename
			system(cmd)
		end

		def show_menu
			HighLine.color_scheme = HighLine::ColorScheme.new do |cs|
				cs[:system_option] = [ :green ]
				cs[:simple_option] = [ :magenta ]
			end

			choose do |menu|
				menu.header = "Select file to see"
				menu.prompt = "> "

				menu.choice("<%= color('Stop stage review', :system_option) %>") { exit 1 }

				for i in 0...FILES.size
					filename = FILES[i]

					menu.choice("<%= color('#{filename}', :simple_option)  %>") do
						show_diff_for(filename)
					end
				end
			end

			show_menu
		end

		def run
			if FILES.size == 0
				puts "There are no modified files"
				exit 0
			elsif FILES.size == 1
				show_diff_for(FILES.first)
			else
				show_menu
			end
		end

	end # class
end # module

