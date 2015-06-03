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
    navigation do
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
        nest :products
        icon 'cube'
        badge true
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
        nest :store
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
        nest :profile
        icon 'gift'
      end
    end

    navigation :products do
      item 'Products' do
        link '/products'
      end

      item 'Stocks' do
        link '/stocks'
      end

      item 'Categories' do
        link '/categories'
      end
    end

    navigation :store do
      item 'Pages' do
        link '/pages'
      end

      item 'Links' do
        link '/links'
      end

      item 'Themes' do
        link '/themes'
      end
    end

    navigation :profile do
      item 'Edit Profile' do
        link '/profile/edit'
      end

      divider

      item 'Sign Out' do
        link '/signout'
      end
    end
  end

  slim :index
end
