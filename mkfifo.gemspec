require 'rubygems'

Gem::Specification.new do |s|
    s.name          = 'mkfifo'
    s.version       = '0.1.0'
    s.author        = 'shura'
    s.email         = 'shura1991@gmail.com'
    s.homepage      = 'http://github.com/shurizzle/ruby-mkfifo'
    s.platform      = Gem::Platform::RUBY
    s.summary       = 'Create named pipes (FIFOs) from Ruby'
    s.description   =<<-EOF
Provides Ruby's File class with a new method called ::mkfifo
that creates a named pipe (FIFO). This gem is a simple C
extension wrapping the *nixish mkfifo(3) function.
    EOF
    s.files         = Dir['ext/*.rb'] + Dir['ext/*.c']
    s.extensions    = 'ext/extconf.rb'
    s.extra_rdoc_files = %w[README.rdoc CHANGELOG.rdoc ext/mkfifo.c]
    s.rdoc_options  << "-m" << "README.rdoc" << "-t" << "ruby-mkfifo"
    s.has_rdoc      = true
end
