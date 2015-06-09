require 'bundler/gem_tasks'
require 'rake/testtask'

Dir.glob('lib/awesome_admin_layout/tasks/*.rake').each { |r| load r }

Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.test_files = FileList['test/**/test_*.rb']
end

description = Rake::Task[:release].comment
Rake::Task[:release].clear
desc description
task release: 'awesome_admin_layout:release'

task default: :test
