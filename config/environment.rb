require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'
require_all 'app'
require_all 'classes'
require_all 'bin/q*'
require_all 'music'






 #require_all '/app/models/'

