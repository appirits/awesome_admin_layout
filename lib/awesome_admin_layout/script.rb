require 'awesome_admin_layout/navigation/item'
require 'awesome_admin_layout/navigation/divider'
require 'awesome_admin_layout/navigation/flex_divider'

module AwesomeAdminLayout
  class Script
    def initialize
      @navigations = {}
    end

    def navigation(key = :default, &block)
      navigation = Navigation.new
      navigation.instance_eval(&block)
      @navigations[key] = navigation
    end

    def to_s
      @navigations[:default]
    end

    alias_method :to_html, :to_s
  end
end
