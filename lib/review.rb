require 'highline/import'

module Review
	class << self

		def files
			output = `git status --porcelain | grep "^\\(.\\)\\+M" | sed s/^...//`
			output.split("\n")
		end

		def show_diff_for(filename)
			cmd = "git diff " + filename
			system(cmd)
			ask_to_add filename
		end

		def ask_to_add(filename)
			choose do |cmd|
				cmd.index = :none
				cmd.prompt = "Add to stage? "
				cmd.layout = :one_line
				cmd.choice("yes") { add_to_stage filename  }
				cmd.choice("no")
			end
		end

		def add_to_stage(filename)
			cmd = "git add " + filename
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

				for i in 0...files.size
					filename = files[i]
					option_string = "<%= color('#{filename}', :simple_option)  %>"

					menu.choice(option_string) do
						show_diff_for filename
					end
				end
			end

			show_menu
		end

		def run
			if files.size == 0
				puts "There are no unstaged files"
				exit 0
			elsif files.size == 1
				show_diff_for(files.first)
			else
				show_menu
			end

			system("git status -s")
			exit 1
		end

	end # class
end # module

