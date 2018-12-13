# -*- encoding: utf-8 -*-
# stub: mail_form 1.6.0 ruby lib

Gem::Specification.new do |s|
  s.name = "mail_form".freeze
  s.version = "1.6.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Jos\u{e9} Valim".freeze, "Carlos Ant\u{f4}nio".freeze]
  s.date = "2016-10-31"
  s.description = "Send e-mail straight from forms in Rails with I18n, validations, attachments and request information.".freeze
  s.email = "contact@plataformatec.com.br".freeze
  s.homepage = "https://github.com/plataformatec/mail_form".freeze
  s.licenses = ["MIT".freeze]
  s.rubyforge_project = "mail_form".freeze
  s.rubygems_version = "2.7.7".freeze
  s.summary = "Send e-mail straight from forms in Rails with I18n, validations, attachments and request information.".freeze

  s.installed_by_version = "2.7.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<actionmailer>.freeze, ["< 5.1", ">= 3.2"])
      s.add_runtime_dependency(%q<activemodel>.freeze, ["< 5.1", ">= 3.2"])
    else
      s.add_dependency(%q<actionmailer>.freeze, ["< 5.1", ">= 3.2"])
      s.add_dependency(%q<activemodel>.freeze, ["< 5.1", ">= 3.2"])
    end
  else
    s.add_dependency(%q<actionmailer>.freeze, ["< 5.1", ">= 3.2"])
    s.add_dependency(%q<activemodel>.freeze, ["< 5.1", ">= 3.2"])
  end
end
