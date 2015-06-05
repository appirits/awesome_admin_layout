require 'awesome_admin_layout/version'
require 'awesome_admin_layout/script'
require 'awesome_admin_layout/navigation'
require 'awesome_admin_layout/helpers'
require 'awesome_admin_layout/engine' if defined? Rails
require 'awesome_admin_layout/recognize_path'

module AwesomeAdminLayout
  extend AwesomeAdminLayout::RecognizePath

  @@context = nil
  @@request = nil
  @@script = nil

  class << self
    def request
      return @@request if @@request
      @@context.request if @@context
    end

    def script
      @@script
    end

    def awesome_admin_layout(context = nil, &block)
      @@context = context
      @@script ||= AwesomeAdminLayout::Script.new
      @@script.instance_exec(context, &block)
    end

    def setup(options = {}, &block)
      @@request = options[:request]
      if defined? Rails
        (options[:only] || ActionController::Base).send(:before_filter, -> { AwesomeAdminLayout.awesome_admin_layout(self, &block) })
      else
        awesome_admin_layout(&block)
      end
    end
  end
end
