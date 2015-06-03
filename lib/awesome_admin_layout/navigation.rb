require 'awesome_admin_layout/navigation/item'
require 'awesome_admin_layout/navigation/divider'
require 'awesome_admin_layout/navigation/flex_divider'

module AwesomeAdminLayout
  class Navigation
    def initialize
      @tree = []
    end

    def item(name, &block)
      if block_given?
        item = Item.new(name)
        item.instance_eval(&block)
        @tree << item
      else
        @tree << name
      end
    end

    def divider
      @tree << Divider.new
    end

    def flex_divider
      @tree << FlexDivider.new
    end

    def to_a
      @tree
    end
  end
end
