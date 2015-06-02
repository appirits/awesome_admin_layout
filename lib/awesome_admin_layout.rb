require 'awesome_admin_layout/version'
require 'awesome_admin_layout/script'
require 'awesome_admin_layout/converter'

module AwesomeAdminLayout
  def included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def script
      @script ||= AwesomeAdminLayout::Script.new
    end

    def admin_layout(&block)
      script.instance_eval(&block)
    end

    def render_admin_layout
      AwesomeAdminLayout::Converter.new(@script).to_html
    end
  end
end
