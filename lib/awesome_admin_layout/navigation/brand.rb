module AwesomeAdminLayout
  class Navigation
    class Brand
      def initialize(name = nil)
        @item = { name: name }
      end

      def name(name = nil, &block)
        @item[:name] = block_given? ? block : name
      end

      def link(link)
        @item[:link] = link
      end

      def external_link(link)
        @item[:external_link] = link
      end

      def to_s
        %Q{<div class="#{__css_class}">#{__link_to("#{__name}")}#{__enternal_link}</div>}
      end

      private

      def __css_class
        'awesome_admin_layout-navigation-brand'
      end

      def __name
        "<span>#{@item[:name].is_a?(Proc) ? @item[:name].call : @item[:name]}</span>"
      end

      def __link_to(name)
        return name unless @item[:link]
        %Q{<a href="#{@item[:link]}">#{name}</a>}
      end

      def __enternal_link
        return unless @item[:external_link]
        %Q{<a href="#{@item[:external_link]}" target="_blank" class="awesome_admin_layout-external-link">#{__external_link_icon}</a>}
      end

      def __external_link_icon
        '<i class="fa fa-external-link"></i>'
      end
    end
  end
end
