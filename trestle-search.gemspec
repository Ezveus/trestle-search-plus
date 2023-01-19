require_relative 'lib/trestle/search/version'

Gem::Specification.new do |spec|
  spec.name          = "trestle-search-plus"
  spec.version       = Trestle::Search::VERSION

  spec.authors       = ["Sam Pohlenz", "Matthieu Ciappara"]
  spec.email         = %w[sam@sampohlenz.com matthieu.ciappara@outlook.fr]

  spec.summary       = "Search plugin for the Trestle admin framework"
  spec.homepage      = "https://github.com/Ezveus/trestle-search-plus"
  spec.license       = "LGPL-3.0"

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(spec)/}) }
  end

  spec.require_paths = ["lib"]

  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Ezveus/trestle-search-plus"

  spec.add_dependency "trestle", "~> 0.9.0", ">= 0.9.3"

  spec.add_development_dependency "rspec-rails"
end
