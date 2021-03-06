# frozen_string_literal: true

require_relative 'lib/boatload/version'

Gem::Specification.new do |spec|
  spec.name          = 'boatload'
  spec.version       = Boatload::VERSION
  spec.authors       = ['Collin Styles']
  spec.email         = ['collingstyles@gmail.com']

  spec.summary       = 'A library for processing batches of work asynchronously'
  spec.description   = spec.summary
  spec.homepage      = 'https://github.com/mycase/boatload'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.5.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/mycase/boatload'
  spec.metadata['documentation_uri'] = "https://www.rubydoc.info/gems/boatload/#{spec.version}"
  # spec.metadata["changelog_uri"] = 'https://github.com/mycase/boatload/blob/master/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'bin'
  spec.executables   = []
  spec.require_paths = ['lib']

  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'minitest-reporters', '~> 1.4'
  spec.add_development_dependency 'mocha', '~> 1.11'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rubocop', '~> 1.7.0'
  spec.add_development_dependency 'rubocop-minitest', '~> 0.10.2'
  spec.add_development_dependency 'rubocop-rake', '~> 0.5.1'
  spec.add_development_dependency 'shoulda-context', '~> 2.0'
  spec.add_development_dependency 'simplecov', '~> 0.20.0'
  spec.add_development_dependency 'yard'
end
