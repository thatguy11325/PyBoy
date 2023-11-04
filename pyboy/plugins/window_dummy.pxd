#
# License: See LICENSE.md file
# GitHub: https://github.com/Baekalfen/PyBoy
#

from pyboy.logging cimport Logger, getLogger
from pyboy.plugins.base_plugin cimport PyBoyWindowPlugin

cdef Logger logger

cdef class WindowDummy(PyBoyWindowPlugin):
    pass
