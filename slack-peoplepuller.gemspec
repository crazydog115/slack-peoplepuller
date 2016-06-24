# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'slack/peoplepuller/version'

Gem::Specification.new do |spec|
  spec.name          = "slack-peoplepuller"
  spec.version       = Slack::Peoplepuller::VERSION
  spec.authors       = ["Jonah Hirsch"]
  spec.email         = ["jonahwh@gmail.com"]

  spec.summary       = %q{Get profile data for usergroups in Slack}
  spec.homepage      = "https://github.com/crazydog115/slack-peoplepuller"
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org'
  else
    raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ['lib']

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_runtime_dependency 'slack-ruby-client'
end
