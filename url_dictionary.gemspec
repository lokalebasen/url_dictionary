lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'url_dictionary'

Gem::Specification.new do |spec|
  spec.name          = "url_dictionary"
  spec.version       = UrlDictionary::VERSION
  spec.authors       = ["MatchOffice"]
  spec.email         = ["udviklere@lokalebasen.dk"]
  spec.summary       = %q{Library for internationalizing Lokalebasen url segments}
  spec.homepage      = "https://github.com/lokalebasen/url_dictionary"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(spec)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 3.5.0"
end
