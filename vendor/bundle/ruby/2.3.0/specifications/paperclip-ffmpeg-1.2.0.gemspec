# -*- encoding: utf-8 -*-
# stub: paperclip-ffmpeg 1.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "paperclip-ffmpeg".freeze
  s.version = "1.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Omar Abdel-Wahab".freeze]
  s.date = "2014-06-19"
  s.description = "Process your attachments with FFMPEG".freeze
  s.email = ["owahab@gmail.com".freeze]
  s.homepage = "http://github.com/owahab/paperclip-ffmpeg".freeze
  s.licenses = ["MIT".freeze]
  s.rubyforge_project = "paperclip-ffmpeg".freeze
  s.rubygems_version = "2.7.7".freeze
  s.summary = "Process your attachments with FFMPEG".freeze

  s.installed_by_version = "2.7.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<paperclip>.freeze, [">= 2.5.2"])
      s.add_development_dependency(%q<rspec-rails>.freeze, ["~> 2.14.2"])
      s.add_development_dependency(%q<sqlite3>.freeze, [">= 0"])
      s.add_development_dependency(%q<database_cleaner>.freeze, [">= 0"])
      s.add_development_dependency(%q<shoulda>.freeze, [">= 0"])
      s.add_development_dependency(%q<image_size>.freeze, [">= 0"])
    else
      s.add_dependency(%q<rails>.freeze, [">= 0"])
      s.add_dependency(%q<paperclip>.freeze, [">= 2.5.2"])
      s.add_dependency(%q<rspec-rails>.freeze, ["~> 2.14.2"])
      s.add_dependency(%q<sqlite3>.freeze, [">= 0"])
      s.add_dependency(%q<database_cleaner>.freeze, [">= 0"])
      s.add_dependency(%q<shoulda>.freeze, [">= 0"])
      s.add_dependency(%q<image_size>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>.freeze, [">= 0"])
    s.add_dependency(%q<paperclip>.freeze, [">= 2.5.2"])
    s.add_dependency(%q<rspec-rails>.freeze, ["~> 2.14.2"])
    s.add_dependency(%q<sqlite3>.freeze, [">= 0"])
    s.add_dependency(%q<database_cleaner>.freeze, [">= 0"])
    s.add_dependency(%q<shoulda>.freeze, [">= 0"])
    s.add_dependency(%q<image_size>.freeze, [">= 0"])
  end
end
