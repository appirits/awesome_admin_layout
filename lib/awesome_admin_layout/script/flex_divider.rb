module AwesomeAdminLayout
  class Script
    class FlexDivider < AwesomeAdminLayout::Script::Divider
      def class_name
        ['divider', 'flex-divider']
      end
    end
  end
end
