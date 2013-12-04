# Provide a simple gemspec so you can easily use your enginex
# project in your rails apps through git.
Gem::Specification.new do |s|
  s.name        = "rqrcode-rails3"
  s.summary     = "Render QR codes with Rails 3"
  s.description = "Render QR codes with Rails 3"

  s.files       = Dir["{app,lib,config}/**/*"] + ["MIT-LICENSE", "Rakefile", "Gemfile", "README.md"]

  s.author      = "Sam Vincent"
  s.email       = "sam.vincent@mac.com"
  s.homepage    = "http://github.com/samvincent/rqrcode-rails3"
  s.version     = "0.1.7"

  s.add_dependency              'rqrcode', '>= 0.4.2'
  s.add_development_dependency  'capybara', '>= 2.2.0'
  s.add_development_dependency  'rails', '>= 3.1'
  s.add_development_dependency  'mini_magick'
end
