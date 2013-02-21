ENV['RAILS_ENV'] = 'test'

require File.expand_path('../dummy/config/environment.rb', __FILE__)
require 'rails/test_help'

require 'minitest/unit'
require 'minitest/pride'
require 'minitest/autorun'
require 'minitest/reporters'

require 'database_cleaner'

require 'miniskirt'
require 'factories'

require 'recommendable'

MiniTest::Reporters.use!

DatabaseCleaner.strategy = :transaction
Rails.backtrace_cleaner.remove_silencers!

DatabaseCleaner.start

MiniTest::Unit.after_tests do
  DatabaseCleaner.clean
  Recommendable.redis.flushdb
end
