$LOAD_PATH.unshift 'lib'
require "git-shove/version"

Gem::Specification.new do |s|
  s.name              = "git-shove"
  s.version           = Git-shove::VERSION
  s.date              = Time.now.strftime('%Y-%m-%d')
  s.summary           = "Feed me."
  s.homepage          = "http://github.com//git-shove"
  s.email             = "max@maxcantor.net"
  s.authors           = [ "Max Cantor" ]
  s.has_rdoc          = false

  s.files             = %w( README.md Rakefile LICENSE )
  s.files            += Dir.glob("lib/**/*")
  s.files            += Dir.glob("bin/**/*")
  s.files            += Dir.glob("man/**/*")
  s.files            += Dir.glob("test/**/*")

#  s.executables       = %w( git-shove )
  s.description       = <<desc
  Feed me.
desc
end
