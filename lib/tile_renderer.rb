require 'haml'
Dir.glob('lib/tile_renderer/**/*.rb').each { |f| require f.gsub('lib/', '') }