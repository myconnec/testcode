# -*- encoding: utf-8 -*-
# stub: imagesLoaded_rails 4.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "imagesLoaded_rails".freeze
  s.version = "4.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Guy Israeli".freeze]
  s.date = "2016-03-11"
  s.description = "imagesLoaded.js Wrapper for Rails 3.1+ Asset Pipeline ".freeze
  s.homepage = "https://github.com/guyisra/imagesLoaded-rails".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.7.7".freeze
  s.summary = "Asset pipeline is like \"I'll take care of that js for you sir\" and Rails is like \"You know thats right! and what about them images?!\"".freeze

  s.installed_by_version = "2.7.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.3"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<railties>.freeze, [">= 3.1"])
    else
      s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<railties>.freeze, [">= 3.1"])
    end
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<railties>.freeze, [">= 3.1"])
  end
end
