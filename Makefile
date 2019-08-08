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

## Godsend, an internal name (Hellsmith Editor-specific codename) for a custom variant of GZDoom's HW API layer.

## SlimDX can drink metric tons of drain cleaner while being smothered by fire and brimstone!

GODSEND_NAME := godsend_$(ARCHITECTURE).a


CC := gcc
CXX := g++
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

GFXLIB_SRC := $(wildcard src/gfxlib/*.cpp) \
		$(wildcard src/2d/*.cpp) \
		$(wildcard src/3d/*.cpp)
		src/carmack_helper/$(wildcard *.cpp)\

GFXLIB_OBJ := $(GFXLIB_SRC:.cpp=.o)

GZEXTRA_SRC := src/gzstuff/gz_parser.cpp \
		src/gzstuff/glowflats.cpp \
		src/gzstuff/zlib_helper.cpp \
		src/gzstuff/skybox.cpp \
		src/gzstuff/ambientsnd.cpp \
		src/gzstuff/animdefs.cpp \
		src/gzstuff/decorate.cpp \
		src/gzstuff/zscript.cpp \
		src/gzstuff/voxels.cpp \
		src/gzstuff/sndparse.cpp \
		src/gzstuff/state_struct.cpp \
		src/gzstuff/x11r6parse.cpp \
		src/gzstuff/gztext.cpp \
		
GZEXTRA_OBJ := $(GZEXTRA_SRC:.cpp=.o)

STATIC_LIBS := $(GFXLIB_NAME) \
		$(GZEXTRA_NAME) \
		$(FORGE_NAME) \
		$(ANVIL_NAME) \
		$(GODSEND_NAME)

GODSEND_SRC := $(wildcard src/vendor/gzdoom/rendering/2d/*.cpp) \
		$(wildcard src/vendor/gzdoom/rendering/gl/*.cpp) \
		$(wildcard src/vendor/gzdoom/rendering/gl_load/*.cpp) \
		$(wildcard src/vendor/gzdoom/rendering/hwrenderer/*.cpp) \
		$(wildcard src/vendor/gzdoom/rendering/polyrenderer/*.cpp) \
		$(wildcard src/vendor/gzdoom/rendering/swrenderer/*.cpp) \
		$(wildcard src/vendor/gzdoom/rendering/*.cpp) \
		$(wildcard src/vendor/gzdoom/rendering/gtk/*.cpp) \
		$(GODSEND_POSIX_SRC)

all: $(OBJS) $(DATA) $(NAME)

$(NAME):

scrgut_obj: libxml2
	$(CC) $(CFLAGS) `pkg-config --cflags --libs MagickWand`

scrgut_bin: scrgut_obj
	$(CC) $

static_libs:
	mkdir -p $(STATICLIB_PATHPREFIX)
	ar $(ARFLAGS) $(STATICLIB_PATHPREFIX)/$(GZEXTRA_NAME) $(GZEXTRA_OBJ)


.PHONY: all,scrgut,libxml2,static_libs,clean
.NOTPARALLEL: libxml2,clean
