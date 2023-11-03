#
# License: See LICENSE.md file
# GitHub: https://github.com/Baekalfen/PyBoy
#

from .base_mbc cimport BaseMBC
from pyboy.logging cimport Logger, getLogger

from cpython.array cimport array
# from array import array

import cython
from libc.stdint cimport uint8_t, uint16_t, uint32_t

cdef Logger logger

@cython.locals(carttype=int, cartname=uint8_t[:], cartdata=uint8_t[:], external_ram_count=int)
cpdef BaseMBC load_cartridge(str) noexcept
cdef bint validate_checksum(uint8_t[:,:]) noexcept

@cython.locals(romdata=array, banksize=int)
cdef uint8_t[:, :] load_romfile(str) noexcept

cdef dict CARTRIDGE_TABLE
cdef dict EXTERNAL_RAM_TABLE
