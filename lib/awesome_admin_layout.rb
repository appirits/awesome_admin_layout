require 'awesome_admin_layout/version'
require 'awesome_admin_layout/script'
require 'awesome_admin_layout/navigation'
require 'awesome_admin_layout/helpers'
require 'awesome_admin_layout/engine' if defined? Rails

module AwesomeAdminLayout
  @@request = nil
  @@script = nil

  class << self
    def request
      @@request
    end

    def script
      @@script
    end

    def awesome_admin_layout(request = nil, &block)
      @@request = request
      @@script ||= AwesomeAdminLayout::Script.new
      @@script.instance_eval(&block)
    end
  end

  def awesome_admin_layout(*args, &block)
    AwesomeAdminLayout.awesome_admin_layout(*args, &block)
  end
end
