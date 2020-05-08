require_relative 'lib/central_park/version'

Gem::Specification.new do |spec|
  spec.name          = "central_park"
  spec.version       = CentralPark::VERSION
  spec.authors       = ["Dhrubot"]
  spec.email         = ["dhrubo.dh@gmail.com"]

  spec.summary       = %q{Central Park's current programs.}
  # spec.description   = %q{TODO: Write a longer description or delete this line.}
  spec.homepage      = "http://www.dhrubot.com"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "http://www.dhrubot.com"
  spec.metadata["changelog_uri"] = "http://www.dhrubot.com"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  
  spec.add_development_dependency "pry"
  spec.add_dependency "nokogiri"
end
