$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'awesome_admin_layout'

require 'minitest/autorun'
require 'minitest/mock'


begin
  require 'rails'
rescue LoadError
  # Not load rails
end

if defined? Rails
  require 'dummy/rails_app'
end
