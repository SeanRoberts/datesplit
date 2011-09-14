require 'rubygems'
require 'rake'
require 'echoe'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new('spec')


Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }

Rake::TestTask.new do |t|
 t.libs << 'test'
end

desc "Run tests"
task :default => :spec