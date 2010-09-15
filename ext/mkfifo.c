#include <ruby/ruby.h>
#include <sys/stat.h>

VALUE rb_cFile_mkfifo(VALUE, VALUE);

void Init_mkfifo() {
    rb_define_singleton_method(rb_cFile, "mkfifo", rb_cFile_mkfifo, 1);
}

VALUE
rb_cFile_mkfifo(VALUE self, VALUE name) {
    if (rb_type(name) != T_STRING) {
        rb_raise(rb_eArgError, "Argument must be a string");
    }

    if (mkfifo(RSTRING_PTR(name), S_IRUSR | S_IWUSR | S_IRGRP | S_IWGRP) < 0) {
        rb_raise(rb_eException, "Cannot create named pipe");
    }

    return INT2FIX(1);
}
