require 'rubygems'
require 'highline/import'

output = `git status --porcelain | grep "^[ ]\\?M" | sed s/^...//`

files = output.split("\n")

def show_diff_for(filename)
	system("git diff " + filename)
	exit 0
end

def show_menu
	choose do |menu|
		menu.prompt = "Please, select one file to see the diff "
		limit = files.size
		
		for i in 0...limit
			filename = files[i]

			menu.choice(filename) do
				show_diff_for(filename)
			end
		end
	end
end

if files.size == 0
	puts "There are not modified files"
	exit 0
elsif files.size == 1
	show_diff_for(files.first)
else
	show_menu
end

