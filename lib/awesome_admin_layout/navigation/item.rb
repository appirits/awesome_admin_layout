module AwesomeAdminLayout
  class Navigation
    class Item
      def initialize(name = nil)
        @item = { name: name }
      end

      def name(name = nil, &block)
        @item[:name] = block_given? ? block : name
      end

      def link(href, option = {})
        @item[:link] = option.merge(href: href)
      end

      def active(active)
        @item[:active] = active
      end

      def icon(icon)
        @item[:icon] = icon
      end

      def badge(badge)
        @item[:badge] = badge
      end

      def nest(key)
        @item[:nest] = Navigation.find(key)
      end

      def to_s
        %Q{<li#{" class=\"#{__css_class}\"" unless __css_class.empty?}>#{__link_to("#{__name_with_icon}#{__badge}#{__arrow}")}#{__nest}</li>}
      end

      private

      def __active?
        return true if @item[:active]
        return false unless AwesomeAdminLayout.request
        return false unless @item[:link]
        AwesomeAdminLayout.request.fullpath.split('?').first == @item[:link][:href].split('?').first
      end

      def __nested?
        @item[:nest] ? true : false
      end

      def __arrow
        '<i class="fa fa-angle-right"></i>' if __nested?
      end

      def __nest
        %Q{<div class="awesome_admin_layout-nested-navigation">#{@item[:nest]}</div>} if __nested?
      end

      def __css_class
        css_class = []
        css_class << 'active' if __active?
        css_class << 'nested' if __nested?
        css_class.join(' ')
      end

      def __name_with_icon
        %Q{#{__icon}<span class="awesome_admin_layout-text">#{__name}</span>}
      end

      def __name
        @item[:name].is_a?(Proc) ? @item[:name].call : @item[:name]
      end

      def __icon
        return unless @item[:icon]
        %Q{<i class="fa fa-#{@item[:icon]}"></i>}
      end

      def __badge
        return unless @item[:badge]
        case @item[:badge]
        when TrueClass, FalseClass
          %Q{<span class="awesome_admin_layout-notice"></span>}
        else
          %Q{<span class="awesome_admin_layout-badge">#{@item[:badge]}</span>}
        end
      end

      def __link_to(name)
        if __nested?
          %Q{<a href="javascript:void(0);">#{name}</a>}
        else
          return name unless @item[:link]
          return ActionController::Base.helpers.link_to(name.html_safe, @item[:link][:href], @item[:link]) if defined? Rails
          %Q{<a href="#{@item[:link][:href]}" #{__link_attributes}>#{name}</a>}
        end
      end

      def __link_attributes
        attributes = {}
        attributes = { 'data-method' => @item[:link][:method] } if @item[:link][:method]
        attributes.map { |(key, value)| %Q{#{key}="#{value}"} }.join(' ')
      end
    end
  end
end
