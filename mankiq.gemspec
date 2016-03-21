# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mankiq/version'

Gem::Specification.new do |spec|
  spec.name          = "mankiq"
  spec.version       = Mankiq::VERSION
  spec.authors       = ["pokka"]
  spec.email         = ["ifunafu@gmail.com"]

  spec.summary       = %q{Add manual workers to sidekiq}
  spec.description   = %q{Add manual workers to sidekiq}
  spec.homepage      = "https://github.com/pokka/mankiq"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_dependency "sidekiq"
end
