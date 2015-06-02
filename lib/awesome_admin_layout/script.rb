module AwesomeAdminLayout
  class Script
    def initialize
      @tree = []
    end

    def item(name)
      @tree << name
    end

    def divider
      @tree << nil
    end

    def to_a
      @tree
    end
  end
end
