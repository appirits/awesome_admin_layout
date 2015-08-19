module AwesomeAdminLayout
  class Engine < ::Rails::Engine
    ActiveSupport.on_load(:action_view) do
      ActionView::Base.send(:include, AwesomeAdminLayout::Helpers)
    end

    ActiveSupport.on_load(:action_controller) do
      ActionController::Base.send(:extend, AwesomeAdminLayout::Helpers::ClassMethods)
    end

    config.to_prepare do
      engines = Rails::Engine.subclasses + [Rails]
      engines.each do |engine|
        Dir.glob(engine.root.join('app/navigations/**/*.rb')).each { |c| require_dependency(c) }
      end
    end
  end
end
