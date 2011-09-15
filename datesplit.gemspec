Gem::Specification.new do |s|
 s.name        = "datesplit"
 s.version     = '0.0.4'
 s.authors     = ["Sean Roberts"]
 s.email       = ["roberts.sean@gmail.com"]

 s.summary     = "Generate date objects from a date duration string (eg. 'September 9th-12th, 2012')"
 s.description = "Generate date objects from a date duration string (eg. 'September 9th-12th, 2012')"
 s.homepage    = "http://github.com/seanroberts/datesplit"
 s.files = Dir.glob("lib/**/*.rb")
 s.test_files  = Dir.glob("{spec,test}/**/*.rb")
end