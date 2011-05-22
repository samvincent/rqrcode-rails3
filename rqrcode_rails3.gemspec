# Provide a simple gemspec so you can easily use your enginex
# project in your rails apps through git.
Gem::Specification.new do |s|
  s.name = "rqrcode-rails3"
  s.summary = "Render QR Codes with Rails 3"
  s.description = "Render QR Codes with Rails 3"
  s.files = Dir["{app,lib,config}/**/*"] + ["MIT-LICENSE", "Rakefile", "Gemfile", "README.rdoc"]
  s.version = "0.1.0"
end