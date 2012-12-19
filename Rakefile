require 'rake/testtask'

task :default => [:test]

Rake::TestTask.new do |t|
  t.libs = ['lib']
  t.test_files = FileList['test/test_*.rb']
  t.warning = true
end
