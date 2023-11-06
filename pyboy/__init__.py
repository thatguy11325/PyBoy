#
# License: See LICENSE.md file
# GitHub: https://github.com/Baekalfen/PyBoy
#

__pdoc__ = {
    "core": False,
    "logger": False,
    "pyboy": False,
    "utils": False,
    # docs exclude
    "window_headless": False,
    "window_open_gl": False,
    "screen_recorder": False,
    "rewind": False,
    "window_dummy": False,
    "disable_input": False,
    "manager_gen": False,
    "auto_pause": False,
    "manager": False,
    "record_replay": False,
    "screenshot_recorder": False,
    "debug": False,
    "window_sdl2": False,
    # docs exclude end
}
# __all__ = ["PyBoy", "WindowEvent"]

# from .pyboy import PyBoy
# from .pyboy_utils import WindowEvent
# from .pyboy_botsupport_manager import BotSupportManager
# from . import pyboy_core_mb
# from .pyboy_core_cartridge_cartridge import load_cartridge

from . import bootstrap
bootstrap.bootstrap_cython_submodules()
