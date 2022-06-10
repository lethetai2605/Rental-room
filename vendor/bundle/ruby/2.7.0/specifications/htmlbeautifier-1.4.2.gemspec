# -*- encoding: utf-8 -*-
# stub: htmlbeautifier 1.4.2 ruby lib

Gem::Specification.new do |s|
  s.name = "htmlbeautifier".freeze
  s.version = "1.4.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Paul Battley".freeze]
  s.date = "2022-04-05"
  s.description = "A normaliser/beautifier for HTML that also understands embedded Ruby.".freeze
  s.email = "pbattley@gmail.com".freeze
  s.executables = ["htmlbeautifier".freeze]
  s.files = ["bin/htmlbeautifier".freeze]
  s.homepage = "http://github.com/threedaymonk/htmlbeautifier".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.6.0".freeze)
  s.rubygems_version = "3.1.4".freeze
  s.summary = "HTML/ERB beautifier".freeze

  s.installed_by_version = "3.1.4" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_development_dependency(%q<rake>.freeze, ["~> 13"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 3"])
    s.add_development_dependency(%q<rubocop>.freeze, ["~> 1"])
    s.add_development_dependency(%q<rubocop-rspec>.freeze, ["~> 2"])
    s.add_development_dependency(%q<rubocop-rake>.freeze, ["~> 0.6"])
  else
    s.add_dependency(%q<rake>.freeze, ["~> 13"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3"])
    s.add_dependency(%q<rubocop>.freeze, ["~> 1"])
    s.add_dependency(%q<rubocop-rspec>.freeze, ["~> 2"])
    s.add_dependency(%q<rubocop-rake>.freeze, ["~> 0.6"])
  end
end
