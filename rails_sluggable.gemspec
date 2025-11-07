# frozen_string_literal: true

require_relative "lib/rails_sluggable/version"

Gem::Specification.new do |spec|
  spec.name = "rails_sluggable"
  spec.version = RailsSluggable::VERSION
  spec.authors     = [ "aric.zheng" ]
  spec.email       = [ "1290657123@qq.com" ]

  spec.summary = "A Rails plugin for generating configurable model slugs"
  spec.description = "A Rails plugin to generate configurable slugs for models, replacing ID-based URLs with user-friendly identifiers."
  spec.homepage = "https://github.com/afeiship/rails_sluggable"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  
  spec.add_dependency "rails", ">= 6.0.0"
end