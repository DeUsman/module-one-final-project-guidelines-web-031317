require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'

Dir[File.join(File.dirname(__FILE__), "../models", "*.rb")].each {|f| require f}
Dir[File.join(File.dirname(__FILE__), "../api/api.rb", "*.rb")].each {|f| require f}
Dir[File.join(File.dirname(__FILE__), "../bin/*.rb")].each {|f| require f}
Dir[File.join(File.dirname(__FILE__), "../cli/cli.rb", "*.rb")].each {|f| require f}

ActiveRecord::Base.logger = nil
