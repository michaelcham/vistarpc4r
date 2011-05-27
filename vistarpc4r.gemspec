# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{vistarpc4r}
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Mike Cham"]
  s.date = %q{2011-05-27}
  s.description = %q{more}
  s.email = %q{mike@blenderhouse.com}
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "examples/add_problems.rb",
    "examples/add_vitals.rb",
    "examples/test.rb",
    "lib/vistarpc4r.rb",
    "lib/vistarpc4r/rpc_broker_connection.rb",
    "lib/vistarpc4r/rpc_response.rb",
    "lib/vistarpc4r/vista_rpc.rb",
    "test/helper.rb",
    "test/test_vistarpc4r.rb",
    "vistarpc4r.gemspec"
  ]
  s.homepage = %q{http://github.com/michaelcham/vistarpc4r}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.5.3}
  s.summary = %q{Provides capability to make rpc calls to VistA EHR systems that have rpcbroker running}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.6.0"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
    else
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.6.0"])
      s.add_dependency(%q<rcov>, [">= 0"])
    end
  else
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.6.0"])
    s.add_dependency(%q<rcov>, [">= 0"])
  end
end

