require 'awesome_admin_layout'
require 'sinatra'
require 'slim'
require 'sass'

helpers AwesomeAdminLayout::ClassMethods

get '/awesome_admin_layout.css' do
  scss :awesome_admin_layout
end

get '/' do
  admin_layout do
    item 'Dashboard' do
      link '/dashboard'
      icon 'dashboard'
    end

    item 'Orders' do
      link '/orders'
      icon 'shopping-cart'
      active true
    end

    item 'Products' do
      link '/products'
      icon 'cube'
    end

    item 'Users' do
      link '/users'
      icon 'user'
    end

    item 'Promotions' do
      link '/promotions'
      icon 'bullhorn'
    end

    item 'Analytics' do
      link '/analytics'
      icon 'bar-chart'
      badge true
    end

    divider

    item 'Store' do
      link '/store'
      icon 'home'
    end

    divider

    item 'Extentions' do
      link '/extentions'
      icon 'puzzle-piece'
      badge 10
    end

    item 'Settings' do
      link '/settings'
      icon 'cog'
    end

    flex_divider

    item 'Profile' do
      link '/profile'
      icon 'gift'
    end
  end

  slim :index
end
