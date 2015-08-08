require 'awesome_admin_layout/navigation/item'
require 'awesome_admin_layout/navigation/divider'
require 'awesome_admin_layout/navigation/flex_divider'

module AwesomeAdminLayout
  class Script
    def navigation(key = nil, &block)
      key ||= :default
      Navigation.new(key, &block)
    end

    def to_s(key = nil)
      key ||= :default
      Navigation.find(key)
    end

    alias_method :to_html, :to_s
  end
end
