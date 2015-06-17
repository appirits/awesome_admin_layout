require 'awesome_admin_layout/navigation/brand'
require 'awesome_admin_layout/navigation/item'
require 'awesome_admin_layout/navigation/divider'
require 'awesome_admin_layout/navigation/flex_divider'

module AwesomeAdminLayout
  class Navigation
    attr_accessor :parent

    @@collection = {}

    class << self
      def find(key)
        return unless @@collection
        return fail "Navigation '#{key}' was not faound!" unless @@collection.has_key? key
        element = @@collection[key]
        code = element.delete(:code)
        element[:object].instance_eval(&code) if code
        element[:object]
      end
    end

    def initialize(key = :default, &block)
      __add_to_collection(key, block)
      @tree = []
    end

    def brand(name, &block)
      brand = Brand.new(name)
      brand.instance_eval(&block) if block_given?
      @brand = brand
    end

    def item(name, &block)
      item = Item.new(name, parent: self)
      item.instance_eval(&block) if block_given?
      @tree << item
    end

    def divider
      @tree << Divider.new
    end

    def flex_divider
      @tree << FlexDivider.new
    end

    def to_s
      __wrapper do
        "#{@brand}<ul>#{__convered_nodes}</ul>"
      end
    end

    def __has_active_item?
      __items.any?(&:__active?)
    end

    def __has_active_nested_item?
      __items.any?(&:__has_active_nest?)
    end

    private

    def __add_to_collection(key, block)
      @@collection[key] = { object: self, code: block }
    end

    def __wrapper
      return yield if parent
      <<-WRAPPER
        <nav class="awesome_admin_layout-navigation #{'expanded' if __has_active_nested_item?}">
          <div class="awesome_admin_layout-wrapper">
            #{yield}
          </div>
        </nav>
      WRAPPER
    end

    def __convered_nodes
      @tree.join
    end

    def __items
      @tree.select { |node| node.is_a? Item }
    end
  end
end
