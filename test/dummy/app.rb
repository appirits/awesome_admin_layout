require 'awesome_admin_layout'
require 'sinatra'
require 'slim'
require 'sass'

helpers AwesomeAdminLayout::ClassMethods

get '/awesome_admin_layout.css' do
  scss :awesome_admin_layout, style: :expanded
end

get '/' do
  admin_layout do
    item 'Orders'
    item 'Products'
    item 'Users'
    divider
    item 'Settings'
  end

  slim :index
end
