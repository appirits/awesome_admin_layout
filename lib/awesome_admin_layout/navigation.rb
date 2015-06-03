require 'awesome_admin_layout/navigation/item'
require 'awesome_admin_layout/navigation/divider'
require 'awesome_admin_layout/navigation/flex_divider'

module AwesomeAdminLayout
  class Navigation
    class << self
      def find(key)
        return unless @collection
        @collection[key]
      end
    end

    def initialize(key = :default)
      __add_to_collection(key)
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

    def __add_to_collection(key)
      collection = self.class.instance_variable_get(:@collection) || {}
      collection[key] = self
      self.class.instance_variable_set(:@collection, collection)
    end

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
