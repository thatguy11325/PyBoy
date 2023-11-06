#
# License: See LICENSE.md file
# GitHub: https://github.com/Baekalfen/PyBoy
#

from pyboy.pyboy_plugins_base_plugin cimport PyBoyPlugin


cdef class RecordReplay(PyBoyPlugin):
    cdef public list recorded_input

