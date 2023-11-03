cimport cython

cdef dict LOGGERS
cdef int CRITICAL, FATAL, ERROR, WARNING, INFO, DEBUG

cdef class Logger:
  cdef str name
  cdef int level
  
  cdef public void setLevel(self, int level) noexcept nogil
  cdef public void critical(self, const unsigned char[:] msg, ...) noexcept nogil
  cdef public void error(self, const unsigned char[:] msg, ...) noexcept nogil
  cdef public void warning(self, const unsigned char[:] msg, ...) noexcept nogil
  cdef public void info(self, const unsigned char[:] msg, ...) noexcept nogil
  cdef public void debug(self, const unsigned char[:] msg, ...) noexcept


cpdef Logger getLogger(str) noexcept
