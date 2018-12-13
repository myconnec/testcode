# -*- encoding: utf-8 -*-
# stub: handbrake 0.4.0 ruby lib

Gem::Specification.new do |s|
  s.name = "handbrake".freeze
  s.version = "0.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Rhett Sutphin".freeze]
  s.date = "2011-09-06"
  s.description = "A lightweight literate ruby wrapper for HandBrakeCLI, the command-line interface for the HandBrake video transcoder.".freeze
  s.email = ["rhett@detailedbalance.net".freeze]
  s.homepage = "https://github.com/rsutphin/handbrake.rb".freeze
  s.rubygems_version = "2.7.7".freeze
  s.summary = "A ruby wrapper for HandBrakeCLI".freeze

  s.installed_by_version = "2.7.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rubytree>.freeze, ["~> 0.8.1"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 2.5"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 0.9.0"])
      s.add_development_dependency(%q<yard>.freeze, ["~> 0.7.0"])
    else
      s.add_dependency(%q<rubytree>.freeze, ["~> 0.8.1"])
      s.add_dependency(%q<rspec>.freeze, ["~> 2.5"])
      s.add_dependency(%q<rake>.freeze, ["~> 0.9.0"])
      s.add_dependency(%q<yard>.freeze, ["~> 0.7.0"])
    end
  else
    s.add_dependency(%q<rubytree>.freeze, ["~> 0.8.1"])
    s.add_dependency(%q<rspec>.freeze, ["~> 2.5"])
    s.add_dependency(%q<rake>.freeze, ["~> 0.9.0"])
    s.add_dependency(%q<yard>.freeze, ["~> 0.7.0"])
  end
end
