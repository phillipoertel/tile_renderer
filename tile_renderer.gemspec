Gem::Specification.new do |s|
  s.name        = 'tile_renderer'
  s.version     = '0.0.1'
  s.date        = '2012-12-23'
  s.summary     = "Render a variety of domain models into a common HTML template (i.e. a partial), although each domain model has different properties."
  s.description = "Render a variety of domain models into a common HTML template (i.e. a partial), although each domain model has different properties."
  s.authors     = ["Phillip Oertel"]
  s.email       = 'me@phillipoertel.com'
  s.files       = Dir.glob('lib/**/*')
  s.add_dependency('haml')
  s.homepage    = 'https://github.com/phillipoertel/tile_renderer'
end