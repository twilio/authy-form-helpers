namespace :css do
  desc "Compile"
  task :compile do
    case RUBY_PLATFORM
    when /linux/
      command = 'yui-compressor'
    else
      command = 'yuicompressor'
    end
    system "cat src/flags.authy.css src/form.authy.css | #{command} --type css -o src/form.authy.min.css"
  end
end


namespace :js do
  desc "Compile"
  task :compile do
    system "cat src/form.authy.js | yuicompressor --type js -o src/form.authy.min.js"
  end
end

task :compile => ["css:compile", "js:compile"] do
end

task :package => ["compile"] do
  puts "Generating form.authy.zip ..."
  system "cd src; zip form.authy.zip form.authy.min.js form.authy.min.css images/**/*; mv form.authy.zip .."
end

task :default => :compile