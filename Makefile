NAME := hellsmith-gtk.$(ARCHITECTURE)
GZEXTRA_NAME := libgzextra_$(ARCHITECTURE).a
GFXLIB_NAME := libsmithgfx_$(ARCHITECTURE).a
FORGE_NAME := hellforge_$(ARCHITECTURE).a
ANVIL_NAME := hateanvil_$(ARCHITECTURE).a
HAMMER_NAME := vilehammer_$(ARCHITECTURE).a
GODSEND_NAME := godsend_$(ARCHITECTURE).a


CC := gcc
CXXFLAGS := -O3 -fexpensive-optimizations -flto
LDFLAGS := -lSDL_image -lSDL_mixer -lzlib -I./static_libs
ARFLAGS := rcs

## get build architecture id

ARCHITECTURE := $(shell uname -m)

## WAD.cs and Lump.cs are being ported and coalesced into wadlib.cpp/hpp.

SOURCES := main.cpp \
		core/wadlib.cpp \
		core/doom_gfxlib.cpp \
		core/doom_maplib.cpp \
		core/hexen_maplib.cpp \
		core/udmf_maplib.cpp \
		core/dirlib.cpp \
		core/ziplib.cpp \
		core/serializer.cpp \
		core/alien_imglib.cpp

GFXLIB_SRC := gfxlib/vector.cpp \
		gfxlib/earclip.cpp \
		gfxlib/plane.cpp \
		gfxlib/sort_angles.cpp \
		gfxlib/mktris.cpp \
		2d/angle2d.cpp \
		2d/line2d.cpp \
		2d/frustum2d.cpp \
		3d/line3d.cpp \
		3d/

GZEXTRA_SRC := gzstuff/gz_parser.cpp \
		gzstuff/glowflats.cpp \
		gzstuff/zlib_helper.cpp \
		gzstuff/skybox.cpp \
		gzstuff/ambientsnd.cpp \
		gzstuff/animdefs.cpp \
		gzstuff/decorate.cpp \
		gzstuff/zscript.cpp \
		gzstuff/voxels.cpp \
		gzstuff/sndparse.cpp \
		gzstuff/state_struct.cpp \
		gzstuff/x11r6parse.cpp \
		gzstuff/gztext.cpp \
		
