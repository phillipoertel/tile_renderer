require 'haml'

module TileRenderer; end

require 'tile_renderer/template_data'
Dir.glob('lib/tile_renderer/**/*.rb').each { |f| require f.gsub('lib/', '') }