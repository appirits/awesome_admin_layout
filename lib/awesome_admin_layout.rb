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

    def normal_define(&block)
      awesome_admin_layout(&block)
    end

    def eager_define(options = {}, &block)
      (options[:only] || ActionController::Base).send(:before_filter, -> { AwesomeAdminLayout.awesome_admin_layout(self, &block) })
    end

    def define(options = {}, &block)
      @@request = options.delete(:request)
      defined?(Rails) ? eager_define(options, &block) : normal_define(&block)
    end

    # TODO: Deprecated
    alias_method :setup, :define
  end
end
