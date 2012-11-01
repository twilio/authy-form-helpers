namespace :coffee do

  desc "Compile"
  task :compile do
    require 'coffee-script'
    puts "Compiling Coffeescript"

    js = CoffeeScript.compile File.read("#{Dir.pwd}/src/form.authy.coffee")
    File.open("#{Dir.pwd}/src/form.authy.js", 'w') { |file| file.write(js) }
  end
end
namespace :css do
  desc "Compile"
  task :compress do
    puts "Compressing css"
    require "yui/compressor"
    css = File.read("#{Dir.pwd}/src/flags.authy.css")
    css += File.read("#{Dir.pwd}/src/form.authy.css")

    compressor = YUI::CssCompressor.new
    min_css =  compressor.compress(css)
    File.open("#{Dir.pwd}/src/form.authy.min.css", 'w') { |file| file.write(min_css) }
  end
end


namespace :js do
  desc "Compile"
  task :compress do
    puts "Compressing javascript"
    js = File.read("#{Dir.pwd}/src/form.authy.js")
    compressor = YUI::JavaScriptCompressor.new
    min_js = compressor.compress(js)
    File.open("#{Dir.pwd}/src/form.authy.min.js", 'w') { |file| file.write(min_js) }
  end
end

task :compile => ["coffee:compile","css:compress", "js:compress"] do
end

task :package => ["compile"] do
  puts "Generating form.authy.zip ..."
  system "cd src; zip form.authy.zip form.authy.min.js form.authy.min.css images/**/*; mv form.authy.zip .."
end

task :default => :compile
