module AwesomeAdminLayout
  class Script
    def initialize
      @tree = []
    end

    def item(name, &block)
      if block_given?
        item_script = AwesomeAdminLayout::ItemScript.new(name)
        item_script.instance_eval(&block)
        @tree << item_script
      else
        @tree << name
      end
    end

    def divider
      @tree << nil
    end

    def to_a
      @tree
    end
  end
end
