require 'awesome_admin_layout'
require 'sinatra'
require 'slim'

helpers AwesomeAdminLayout::ClassMethods

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
