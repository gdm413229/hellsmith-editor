## get build architecture id

ARCHITECTURE := $(shell uname -m)

NAME := hellsmith-gtk.$(ARCHITECTURE)

STATICLIB_PATHPREFIX := ./static_libs

GZEXTRA_NAME := libgzextra_$(ARCHITECTURE).a
GFXLIB_NAME := libsmithgfx_$(ARCHITECTURE).a

## Hell Forge, the name for the map editor essentials.

FORGE_NAME := hellforge_$(ARCHITECTURE).a

## Anvil of Hate, the name for the map editor canvas engine.

ANVIL_NAME := hateanvil_$(ARCHITECTURE).a

## Vile Hammer, the built-in tool set of the map editor.

HAMMER_NAME := vilehammer_$(ARCHITECTURE).a

## Godsend, an internal name for a custom variant of GZDoom's HW API layer.

## SlimDX can burn forever in fire and brimstone!

GODSEND_NAME := godsend_$(ARCHITECTURE).a


CC := gcc
CFLAGS := -O3 -mtune=i486 -fexpensive-optimizations
CXXFLAGS := $(CFLAGS)
STATICLIB_LDFLAGS := -l
LDFLAGS := -lSDL_image -lSDL_mixer -lzlib -I.$(STATICLIB_PATHPREFIX) $(STATICLIB_LDFLAGS)
ARFLAGS := rcs

SCRGUT_NAME := scrgut.$(ARCHITECTURE)

## WAD.cs and Lump.cs are being ported and coalesced into wadlib.cpp/hpp.

SOURCES := src/main.cpp \
		src/core/wad/wadlib.cpp \
		src/core/doom_imglib.cpp \
		src/core/doom_maplib.cpp \
		src/core/hexen_maplib.cpp \
		src/core/udmf_maplib.cpp \
		src/core/dirlib.cpp \
		src/core/ziplib.cpp \
		src/core/serializer.cpp \
		src/core/alien_imglib.cpp

OBJS := $(SOURCES:.cpp=.o)

GFXLIB_SRC := src/gfxlib/vector.cpp \
		src/gfxlib/earclip.cpp \
		src/gfxlib/plane.cpp \
		src/gfxlib/sort_angles.cpp \
		src/gfxlib/mktris.cpp \
		src/2d/angle2d.cpp \
		src/2d/line2d.cpp \
		src/2d/frustum2d.cpp \
		src/3d/line3d.cpp \
		src/3d/sidedef.cpp

GFXLIB_OBJ := $(GFXLIB_SRC:.cpp=.o)

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
		
GZEXTRA_OBJ := $(GZEXTRA_SRC:.cpp=.o)

all: obj data $(NAME)

$(NAME):

scrgut: libxml2
	$(CC) $(CFLAGS) `pkg-config --cflags --libs MagickWand`

static_libs:
	mkdir -p $(STATICLIB_PATHPREFIX)
	ar $(ARFLAGS) $(STATICLIB_PATHPREFIX)/$(GZEXTRA_NAME) $(GZEXTRA_OBJ)


.PHONY: all,scrgut,libxml2,static_libs,clean
.NOTPARALLEL: libxml2,clean
