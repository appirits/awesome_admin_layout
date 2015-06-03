require 'awesome_admin_layout/navigation/item'
require 'awesome_admin_layout/navigation/divider'
require 'awesome_admin_layout/navigation/flex_divider'

module AwesomeAdminLayout
  class Script
    def navigation(key = :default, &block)
      navigation = Navigation.new(key)
      navigation.instance_eval(&block)
    end

    def to_s
      Navigation.find(:default)
    end

    alias_method :to_html, :to_s
  end
end
