$LOAD_PATH.unshift("lib")

# gems
require 'haml'

Dir.glob('lib/**/*.rb') { |file| require file }