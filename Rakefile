require "bundler"
Bundler.setup

require "rspec/core/rake_task"
RSpec::Core::RakeTask.new(:spec)

task :default => :spec

desc "Run some examples to see the generated HTML"
task :examples do
  
  $LOAD_PATH.push('lib')
  require 'tile_renderer'
  
  puts "---- Video with preview image"
  video = Video.new(preview: 'video.mpg')
  puts TileRenderer.render(video)

  puts "---- Text with teaser image and long description"
  text = Text.new(teaser: 'teaser.mp4', description: "bla bla " * 100)
  puts TileRenderer.render(text)

  puts "---- a standard Link"
  link = Link.new(link: 'http://www.sinatrarb.com')
  puts TileRenderer.render(link)
end