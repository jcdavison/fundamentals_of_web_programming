require 'sinatra'
require 'json'

set :bind, '127.0.0.1'
set :port, 5000
set :views, settings.root + '/html'
