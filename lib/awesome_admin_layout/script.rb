require 'awesome_admin_layout/navigation/item'
require 'awesome_admin_layout/navigation/divider'
require 'awesome_admin_layout/navigation/flex_divider'

module AwesomeAdminLayout
  class Script
    attr_accessor :nagigations

    def initialize
      @nagigations = {}
    end

    def navigation(key = :default, &block)
      nagigations[key] = block
      Navigation.new(key)
    end

    def to_s
      navigation_script_eval if nagigations.any?
      Navigation.find(:default)
    end

    alias_method :to_html, :to_s

    private

    def navigation_script_eval
      Navigation.each_pair do |key, navigation|
        code = nagigations.delete(key)
        next unless code
        navigation.instance_eval(&code)
      end
    end
  end
end
