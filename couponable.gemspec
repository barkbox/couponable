$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "couponable/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "couponable"
  s.version     = Couponable::VERSION
  s.authors     = ["Cris Kim"]
  s.email       = ["cris@criskim.com"]
  s.homepage    = "http://bark.co"
  s.summary     = "Summary of Couponable."
  s.description = "Description of Couponable."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.12"
  s.add_dependency "activeadmin", ">= 0.5.1"

  # s.add_dependency "jquery-rails"
  s.add_development_dependency "sqlite3"
end
