$LOAD_PATH.unshift('.')
require 'lib/tile_renderer'
require 'rspec_tag_matchers'

RSpec.configure do |config|
  config.include(RspecTagMatchers)
end

require 'rspec/given'
Dir.glob('spec/fixtures/models/*.rb').each { |f| require f }