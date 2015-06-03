require 'awesome_admin_layout/version'
require 'awesome_admin_layout/script'
require 'awesome_admin_layout/navigation'
require 'awesome_admin_layout/helpers'
require 'awesome_admin_layout/engine' if defined? Rails

module AwesomeAdminLayout
  @@context = nil
  @@script = nil

  class << self
    def request
      @@context.request
    end

    def script
      @@script
    end

    def awesome_admin_layout(context = nil, &block)
      @@context = context
      @@script ||= AwesomeAdminLayout::Script.new
      @@script.instance_exec(context, &block)
    end
  end

  def awesome_admin_layout(*args, &block)
    AwesomeAdminLayout.awesome_admin_layout(*args, &block)
  end
end
