# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "meta_request"
  s.version = "0.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dejan Simic"]
  s.date = "2013-01-02"
  s.description = "Request your request"
  s.email = ["desimic@gmail.com"]
  s.homepage = "https://github.com/dejan/rails_panel/tree/master/meta_request"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.16"
  s.summary = "Supporting gem for Rails Panel (Google Chrome extension for Rails development)"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, [">= 0"])
      s.add_runtime_dependency(%q<rack-contrib>, [">= 0"])
    else
      s.add_dependency(%q<rails>, [">= 0"])
      s.add_dependency(%q<rack-contrib>, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>, [">= 0"])
    s.add_dependency(%q<rack-contrib>, [">= 0"])
  end
end
