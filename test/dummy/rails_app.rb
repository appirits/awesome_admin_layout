require 'rails'
require 'action_controller/railtie'
require 'action_view/railtie'

# Config
app = Class.new(Rails::Application)
app.config.secret_token = '45963286e934af01c53c0ff02ca19ecd'
app.config.session_store :cookie_store, key: '_dummy_app_session'
app.config.active_support.deprecation = :log
app.config.eager_load = false
app.config.root = File.dirname(__FILE__)
Rails.backtrace_cleaner.remove_silencers!
app.initialize!

# Engine
module Dummy
  class Engine < Rails::Engine
    isolate_namespace Dummy
  end
end

Dummy::Engine.routes.draw do
  get ':page', controller: :admin, action: :index
end

# Routes
app.routes.draw do
  mount Dummy::Engine, at: '/engine'
  get ':page', controller: :home, action: :index
end

# Controllers
class ApplicationController < ActionController::Base
  def erb
    <<-ERB
<%= render_admin_layout do %>
  <h1><%= @title %></h1>
  <h2>This is <%= @title %> Page.</h2>
<% end %>
    ERB
  end
end

class HomeController < ApplicationController
  def index
    @title = 'Home'
    @title = params[:page].capitalize if params[:page]
    render inline: erb
  end
end

module Dummy
  class AdminController < ApplicationController
    def index
      @title = 'Home'
      @title = params[:page].capitalize if params[:page]
      render inline: erb
    end
  end
end

# Helpers
Object.const_set(:ApplicationHelper, Module.new)
