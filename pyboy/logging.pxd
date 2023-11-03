from libc.stdio cimport stderr, stdout, fprintf, FILE
from libc.string cimport strchr

cimport cython

cdef extern from "stdarg.h":
    ctypedef struct va_list:
        pass
    ctypedef struct fake_type:
        pass
    cdef void va_start(va_list, void* arg) noexcept nogil
    cdef void* va_arg(va_list, fake_type) noexcept nogil
    cdef void va_end(va_list) noexcept nogil
    cdef fake_type int_type "int"

cdef extern from "stdio.h":
    cdef int vfprintf(FILE *stream, const char* format, va_list arg) noexcept nogil

# For now we won't worry about %% escaping in the format string

cdef inline int _pct_count(const unsigned char[:] msg) noexcept nogil:
    i = 0
    for c in msg:
        if c == 37: # % in ascii
            i += 1

    return i

cdef dict LOGGERS
cdef int CRITICAL, FATAL, ERROR, WARNING, INFO, DEBUG

@cython.final
cdef class Logger:
  cdef str name
  cdef int level
  
  cpdef inline void critical(self, const unsigned char[:] msg, ...) noexcept nogil:
      if self.level < CRITICAL:
          return
      fprintf(stderr, "CRITICAL: ")
      cdef va_list args
      va_start(args, <void*>_pct_count(msg))
      vfprintf(stderr, <const char*>&msg[0], args)
      fprintf(stderr, "\n")
      va_end(args)

  cpdef inline void error(self, const unsigned char[:] msg, ...) noexcept nogil:
      if self.level < ERROR:
          return
      fprintf(stderr, "ERROR: ")
      cdef va_list args
      va_start(args, <void*>_pct_count(msg))
      vfprintf(stderr, <const char*>&msg[0], args)
      fprintf(stderr, "\n")
      va_end(args)

  cpdef inline void warning(self, const unsigned char[:] msg, ...) noexcept nogil:
      if self.level < WARNING:
          return
      fprintf(stderr, "WARNING: ")
      cdef va_list args
      va_start(args, <void*>_pct_count(msg))
      vfprintf(stderr, <const char*>&msg[0], args)
      fprintf(stderr, "\n")
      va_end(args)

  cpdef inline void info(self, const unsigned char[:] msg, ...) noexcept nogil:
      if self.level < INFO:
          return
      fprintf(stdout, "INFO: ")
      cdef va_list args
      va_start(args, <void*>_pct_count(msg))
      vfprintf(stdout, <const char*>&msg[0], args)
      fprintf(stderr, "\n")
      va_end(args)

  cpdef inline void debug(self, const unsigned char[:] msg, ...) noexcept nogil:
      if self.level < DEBUG:
          return
      fprintf(stdout, "DEBUG: ")
      cdef va_list args
      va_start(args, <void*>_pct_count(msg))
      vfprintf(stdout, <const char*>&msg[0], args)
      fprintf(stderr, "\n")
      va_end(args)


cpdef Logger getLogger(str) noexcept
