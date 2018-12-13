# -*- encoding: utf-8 -*-
# stub: rubytree 0.8.3 ruby lib

Gem::Specification.new do |s|
  s.name = "rubytree".freeze
  s.version = "0.8.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Anupam Sengupta".freeze]
  s.date = "2012-08-21"
  s.description = "    RubyTree is a Ruby implementation of the generic tree data structure.\n    It provides a node-based model to store uniquely identifiable node-elements in\n    the tree and simple APIs to access, modify and traverse the structure.\n    RubyTree is node-centric, where individual nodes on the tree are the primary\n    compositional and structural elements.\n\n    This implementation also mixes in the Enumerable module to allow standard\n    access to the tree as a collection.\n".freeze
  s.email = "anupamsg@gmail.com".freeze
  s.extra_rdoc_files = ["README.rdoc".freeze, "COPYING.rdoc".freeze, "API-CHANGES.rdoc".freeze, "History.rdoc".freeze]
  s.files = ["API-CHANGES.rdoc".freeze, "COPYING.rdoc".freeze, "History.rdoc".freeze, "README.rdoc".freeze]
  s.homepage = "http://rubytree.rubyforge.org".freeze
  s.licenses = ["BSD".freeze]
  s.post_install_message = "    ========================================================================\n                    Thank you for installing rubytree.\n\n    Note that the TreeNode#siblings method has changed in 0.8.3.\n    It now returns an empty array for the root node.\n\n                 WARNING: SIGNIFICANT API CHANGE in 0.8.0 !\n                 ------------------------------------------\n\n    Please note that as of 0.8.0 the CamelCase method names are DEPRECATED.\n    The new method names follow the ruby_convention (separated by '_').\n\n    The old CamelCase methods still work (a warning will be displayed),\n    but may go away in the future.\n\n    Details of the API changes are documented in the API-CHANGES file.\n    ========================================================================\n".freeze
  s.rdoc_options = ["--title".freeze, "Rubytree Documentation".freeze, "--quiet".freeze]
  s.rubyforge_project = "rubytree".freeze
  s.rubygems_version = "2.7.7".freeze
  s.summary = "A generic tree data structure.".freeze

  s.installed_by_version = "2.7.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<structured_warnings>.freeze, [">= 0.1.3"])
      s.add_runtime_dependency(%q<json>.freeze, [">= 1.7.5"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0.9.2.2"])
      s.add_development_dependency(%q<yard>.freeze, [">= 0.8.2.1"])
      s.add_development_dependency(%q<rtagstask>.freeze, [">= 0.0.4"])
      s.add_development_dependency(%q<rcov>.freeze, ["~> 0.9.0"])
    else
      s.add_dependency(%q<structured_warnings>.freeze, [">= 0.1.3"])
      s.add_dependency(%q<json>.freeze, [">= 1.7.5"])
      s.add_dependency(%q<rake>.freeze, [">= 0.9.2.2"])
      s.add_dependency(%q<yard>.freeze, [">= 0.8.2.1"])
      s.add_dependency(%q<rtagstask>.freeze, [">= 0.0.4"])
      s.add_dependency(%q<rcov>.freeze, ["~> 0.9.0"])
    end
  else
    s.add_dependency(%q<structured_warnings>.freeze, [">= 0.1.3"])
    s.add_dependency(%q<json>.freeze, [">= 1.7.5"])
    s.add_dependency(%q<rake>.freeze, [">= 0.9.2.2"])
    s.add_dependency(%q<yard>.freeze, [">= 0.8.2.1"])
    s.add_dependency(%q<rtagstask>.freeze, [">= 0.0.4"])
    s.add_dependency(%q<rcov>.freeze, ["~> 0.9.0"])
  end
end
