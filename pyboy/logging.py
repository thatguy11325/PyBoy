import logging

try:
    from cython import compiled
    cythonmode = compiled
except ImportError:
    cythonmode = False

LOGGERS = {}
CRITICAL = logging.CRITICAL
FATAL = logging.FATAL
ERROR = logging.ERROR
WARNING = logging.WARNING
INFO = logging.INFO
DEBUG = logging.DEBUG

if cythonmode:

    class Logger:
        def __init__(self, name):
            self.name = name
            self.level = logging.ERROR

        def setLevel(self, level):
            self.level = level

"""
else:
    class Logger:
        def __init__(self, name):
            self.name = name

        def error(self, *args, **kwargs):
            logging.error(*args, **kwargs)
        
        def warning(self, *args, **kwargs):
            logging.warning(*args, **kwargs)
        
        def info(self, *args, **kwargs):
            logging.info(*args, **kwargs)
        
        def debug(self, *args, **kwargs):
            logging.debug(*args, **kwargs)
"""
    
def getLogger(name):
    if cythonmode:
      if name not in LOGGERS:
          LOGGERS[name] = Logger(name)
      return LOGGERS[name]
    else:
      return logging.getLogger(name)