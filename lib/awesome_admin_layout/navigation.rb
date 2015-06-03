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

    def to_s
      __convert
    end

    private

    def __convert
      "<ul>#{__convert_items}</ul>"
    end

    def __convert_items
      @tree.map do |obj|
        case obj
        when String
          "<li>#{obj}</li>"
        when Item, Divider, FlexDivider
          obj.to_s
        end
      end.join
    end
  end
end
