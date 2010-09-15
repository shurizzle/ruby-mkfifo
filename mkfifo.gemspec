require 'rubygems'

Gem::Specification.new do |s|
    s.name          = 'mkfifo'
    s.version       = '0.0.1'
    s.author        = 'shura'
    s.email         = 'shura1991@gmail.com'
    s.homepage      = 'http://github.com/shurizzle/ruby-mkfifo'
    s.platform      = Gem::Platform::RUBY
    s.summary       = ''
    s.description   = ''
    s.files         = Dir['ext/*']
    s.extensions    = 'ext/extconf.rb'
    s.has_rdoc      = true
end
