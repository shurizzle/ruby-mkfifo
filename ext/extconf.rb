require 'mkmf'

if have_func('mkfifo', %[sys/stat.h])
  create_makefile('mkfifo')
end
