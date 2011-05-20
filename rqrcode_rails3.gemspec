# Provide a simple gemspec so you can easily use your enginex
# project in your rails apps through git.
Gem::Specification.new do |s|
  s.name = "rqrcode-rails3"
  s.summary = "Render QRCodes within your Rails 3 application."
  s.description = "Render QRCodes within your Rails 3 application."
  s.files = Dir["{app,lib,config}/**/*"] + ["MIT-LICENSE", "Rakefile", "Gemfile", "README.rdoc"]
  s.version = "0.0.1"
end