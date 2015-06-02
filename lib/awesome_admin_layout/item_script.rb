module AwesomeAdminLayout
  class ItemScript
    def initialize(name = nil)
      @item = { name: name }
    end

    def name(name = nil, &block)
      @item[:name] = block_given? ? block : name
    end

    def link(link)
      @item[:link] = link
    end

    def active(active)
      @item[:active] = active
    end

    def icon(icon)
      @item[:icon] = icon
    end

    def to_s
      %Q{<li#{' class="active"' if __active?}>#{__link_to __name_with_icon}</li>}
    end

    private

    def __active?
      @item[:active] ? true : false
    end

    def __name_with_icon
      "#{__icon}<span>#{__name}</span>"
    end

    def __name
      @item[:name].is_a?(Proc) ? @item[:name].call : @item[:name]
    end

    def __icon
      return unless @item[:icon]
      %Q{<i class="fa fa-#{@item[:icon]}"></i>}
    end

    def __link_to(name)
      return name unless @item[:link]
      %Q{<a href="#{@item[:link]}">#{name}</a>}
    end
  end
end
