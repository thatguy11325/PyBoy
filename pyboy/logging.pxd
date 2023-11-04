cimport cython

cdef dict LOGGERS
cdef int CRITICAL, FATAL, ERROR, WARNING, INFO, DEBUG

cdef class Logger:
  cdef str name
  cdef int level
  
  cdef public inline void setLevel(self, int level) noexcept nogil
  cdef public inline void critical(self, const unsigned char[:] msg, ...) noexcept nogil
  cdef public inline void error(self, const unsigned char[:] msg, ...) noexcept nogil
  cdef public inline void warning(self, const unsigned char[:] msg, ...) noexcept nogil
  cdef public inline void info(self, const unsigned char[:] msg, ...) noexcept nogil
  cdef public inline void debug(self, const unsigned char[:] msg, ...) noexcept nogil


cpdef Logger getLogger(str) noexcept
