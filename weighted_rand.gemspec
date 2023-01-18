# frozen_string_literal: true

require_relative 'lib/weighted_rand/version'

Gem::Specification.new do |spec|
  spec.name = 'weighted_rand'
  spec.version = WeightedRand::VERSION
  spec.authors = ['YuheiNakasaka']
  spec.email = ['yuhei.nakasaka@gmail.com']

  spec.summary = 'Weighted random selection for Ruby'
  spec.description = 'Provides a method to select a element by weighted randomization from a hash with weights.'
  spec.homepage = 'https://github.com/YuheiNakasaka/weighted_rand'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 2.7.0'

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/YuheiNakasaka/weighted_rand'
  spec.metadata['changelog_uri'] = 'https://github.com/YuheiNakasaka/weighted_rand/blob/main/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.metadata = {
    'rubygems_mfa_required' => 'true'
  }
end
