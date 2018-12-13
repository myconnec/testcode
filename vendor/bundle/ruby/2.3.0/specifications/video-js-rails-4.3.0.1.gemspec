# -*- encoding: utf-8 -*-
# stub: video-js-rails 4.3.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "video-js-rails".freeze
  s.version = "4.3.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Alexey Yurchenko".freeze]
  s.date = "2014-03-10"
  s.description = "Video.js is a JavaScript and CSS library that makes it easier to work with and build on HTML5 video".freeze
  s.email = ["alexes.dev@gmail.com".freeze]
  s.homepage = "https://github.com/alexesDev/video-js-rails".freeze
  s.rubygems_version = "2.7.7".freeze
  s.summary = "Video.js for Rails".freeze

  s.installed_by_version = "2.7.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<railties>.freeze, [">= 3.1"])
    else
      s.add_dependency(%q<railties>.freeze, [">= 3.1"])
    end
  else
    s.add_dependency(%q<railties>.freeze, [">= 3.1"])
  end
end
