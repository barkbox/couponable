$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "couponable/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "couponable"
  s.version     = Couponable::VERSION
  s.authors     = ["Cris Kim"]
  s.email       = ["cris@criskim.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Couponable."
  s.description = "TODO: Description of Couponable."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.1"
  s.add_dependency "activeadmin", ">= 0.5.1"

  # s.add_dependency "jquery-rails"
  s.add_development_dependency "sqlite3"
end
