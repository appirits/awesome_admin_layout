module AwesomeAdminLayout
  class Engine < ::Rails::Engine
    ActiveSupport.on_load(:action_view) do
      ActionView::Base.send(:include, AwesomeAdminLayout::Helpers)
    end

    ActiveSupport.on_load(:action_controller) do
      ActionController::Base.send(:extend, AwesomeAdminLayout::Helpers::ClassMethods)
    end

    config.to_prepare do
      Dir.glob(Rails.root.join('app/navigations/**/*.rb')).each do |c|
        Rails.configuration.cache_classes ? require_dependency(c) : load(c)
      end
    end
  end
end
