require 'awesome_admin_layout/navigation/brand'
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

      def each_pair(&block)
        @collection.each_pair(&block)
      end
    end

    def initialize(key = :default)
      __add_to_collection(key)
      @tree = []
    end

    def brand(name, &block)
      brand = Brand.new(name)
      brand.instance_eval(&block) if block_given?
      @brand = brand
    end

    def item(name, &block)
      item = Item.new(name)
      item.instance_eval(&block) if block_given?
      @tree << item
    end

    def divider
      @tree << Divider.new
    end

    def flex_divider
      @tree << FlexDivider.new
    end

    def nest(key)
      @tree << Navigation.find(key)
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
      "#{@brand}<ul>#{__convert_items}</ul>"
    end

    def __convert_items
      @tree.map(&:to_s).join
    end
  end
end
