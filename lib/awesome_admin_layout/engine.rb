module AwesomeAdminLayout
  class Engine < ::Rails::Engine
    ActiveSupport.on_load(:action_view) do
      ActionView::Base.send(:include, AwesomeAdminLayout::Helpers)
    end

    ActiveSupport.on_load(:action_controller) do
      ActionController::Base.send(:extend, AwesomeAdminLayout::Helpers::ClassMethods)
    end
  end
end
