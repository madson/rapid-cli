Gem::Specification.new do |s|
  s.name = "review"
  s.version = "0.0.1"
  s.licenses = ['MIT']
  s.date = "2013-10-07"
  s.summary = "Review is a command-line tool to see the diff of modified files in a git repository."
  s.author = "Madson Cardoso"
  s.email = "madsonmac@gmail.com"
  s.homepage = "http://madsonmac.com"
  s.require_paths = ["lib"]
  s.files = ["lib/review.rb"]
  s.executables << "review"

	s.description = <<END_DESC
Review is a simple command-line tool to see diff for files in a git
repository more useful when it has more than one modified files.
END_DESC
end

