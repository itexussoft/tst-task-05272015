$:.unshift(File.join(File.dirname(__FILE__), 'api', 'v1'))

require 'grape'

Dir[File.expand_path('../api/helpers/*.rb', __FILE__)].each do |f|
  require f
end

Dir[File.expand_path('../models/*.rb', __FILE__)].each do |f|
  require f
end

require 'defaults'
require 'users'
require 'base'

require File.expand_path('../api/base', __FILE__)
