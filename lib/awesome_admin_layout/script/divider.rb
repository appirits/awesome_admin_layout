module AwesomeAdminLayout
  class Script
    class Divider
      def class_name
        'divider'
      end

      def to_s
        css_class = class_name.join(' ') if class_name.is_a? Array
        css_class ||= class_name
        %Q{<li class="#{css_class}"></li>}
      end
    end
  end
end
