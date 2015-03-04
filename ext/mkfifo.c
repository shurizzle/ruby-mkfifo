#include <ruby/ruby.h>
#include <string.h>
#include <sys/stat.h>

VALUE rb_cFile_mkfifo(int, VALUE*, VALUE);

void
Init_mkfifo(void) {
    rb_define_singleton_method(rb_cFile, "mkfifo", rb_cFile_mkfifo, -1);
}

/* Document-method: File::mkfifo
 *
 * call-seq:
 * mkfifo(path[, mode]) -> an_integer
 *
 * Creates a named pipe at +path+. Raises +IOError+ if
 * the operation fails.
 * If +mode+ is given, creates +path+ with the permission.  If it is
 * not given or _nil_, user and group are readable and writable.
 */
VALUE
rb_cFile_mkfifo(int argc, VALUE *argv, VALUE self) {
    VALUE name;
    VALUE mode;
    mode_t perm = S_IRUSR | S_IWUSR | S_IRGRP | S_IWGRP;

#ifdef rb_check_arity
    rb_check_arity(argc, 1, 2);
    name = argv[0];
    mode = argv[1];
#else
    rb_scan_args(argc, argv, "11", &name, &mode);
#endif

    FilePathValue(name);
    if (!NIL_P(mode)) perm = NUM2MODET(mode);

    if (mkfifo(RSTRING_PTR(name), perm) < 0) {
        rb_raise(rb_eIOError, "Cannot create named pipe");
    }

    return INT2FIX(1);
}
