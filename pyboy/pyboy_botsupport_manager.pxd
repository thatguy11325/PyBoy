#
# License: See LICENSE.md file
# GitHub: https://github.com/Baekalfen/PyBoy
#
cimport cython
from pyboy.pyboy_core_mb cimport Motherboard
from pyboy.pyboy_botsupport_screen cimport Screen
from pyboy.pyboy_botsupport_sprite cimport Sprite
from pyboy.pyboy_botsupport_tile cimport Tile
from pyboy.pyboy_botsupport_tilemap cimport TileMap



cdef class BotSupportManager:
    cdef object pyboy
    cdef Motherboard mb
    cpdef Screen screen(self) noexcept
    cpdef Sprite sprite(self, int) noexcept
    cpdef list sprite_by_tile_identifier(self, list, on_screen=*) noexcept
    cpdef Tile tile(self, int) noexcept
    cpdef TileMap tilemap_background(self) noexcept
    cpdef TileMap tilemap_window(self) noexcept
