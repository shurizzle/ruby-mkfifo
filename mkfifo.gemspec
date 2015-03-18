# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'mkfifo/version'

Gem::Specification.new do |s|
    s.name          = 'mkfifo'
    s.version       = Mkfifo::VERSION
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
    s.files         = Dir.glob("{lib}/**/*") + Dir['ext/*.rb'] + Dir['ext/*.c']
    s.require_paths = ["lib"]
    s.extensions    = 'ext/extconf.rb'
    s.extra_rdoc_files = %w[README.rdoc CHANGELOG.rdoc ext/mkfifo.c]
    s.rdoc_options  << "-m" << "README.rdoc" << "-t" << "ruby-mkfifo"
    s.has_rdoc      = true
end
