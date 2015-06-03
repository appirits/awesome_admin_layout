require 'awesome_admin_layout/navigation/item'
require 'awesome_admin_layout/navigation/divider'
require 'awesome_admin_layout/navigation/flex_divider'

module AwesomeAdminLayout
  class Script
    def navigation(key = :default, &block)
      Navigation.new(key, &block)
    end

    def to_s
      Navigation.find(:default)
    end

    alias_method :to_html, :to_s
  end
end
