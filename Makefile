## get build architecture id

ARCHITECTURE := $(shell uname -m)

NAME := hellsmith-gtk.$(ARCHITECTURE)

STATICLIB_PATHPREFIX := ./static_libs

WADLIB_NAME := libsmithwad_$(ARCHITECTURE).a
GZEXTRA_NAME := libgzextra_$(ARCHITECTURE).a
GFXLIB_NAME := libsmithgfx_$(ARCHITECTURE).a

## Hell Forge, the name for the map editor essentials.

FORGE_NAME := hellforge_$(ARCHITECTURE).a

## Anvil of Hate, the name for the map editor canvas engine.

ANVIL_NAME := hateanvil_$(ARCHITECTURE).a

## Vile Hammer, the built-in tool set of the map editor.

HAMMER_NAME := vilehammer_$(ARCHITECTURE).a

## Godsend, an internal name (Hellsmith Editor-specific codename) for a custom variant of GZDoom's HW API layer.

## SlimDX can chug down oceans of bleach!!!

GODSEND_NAME := godsend_$(ARCHITECTURE).a

## Purified Visual Mode : A cross-platform reincarnation of GZDB's visual mode.
## The Purified Visual Mode is built as a static lib prior to the big link.

VISMODE_NAME := libvismode_$(ARCHITECTURE).a

CC := gcc
CXX := g++
CFLAGS := -O3 -mtune=i486 -fexpensive-optimizations
CXXFLAGS := $(CFLAGS)
STATICLIB_LDFLAGS := -l
SCRGUT_CFLAGS := -O3 -mtune=i386
PKGCONF_LIBS :=
LDFLAGS := -I.$(STATICLIB_PATHPREFIX) $(STATICLIB_LDFLAGS) `pkg-config --cflags $(PKGCONF_LIBS)`
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
		src/core/alien_imglib.cpp \
		src/core/g4_posix/logsys.cpp \
		src/config/cfg_enums.cpp \
		src/config/gen_specials.cpp \
		src/config/gamecfg.cpp \
		src/config/texset.cpp \
		src/config/flags.cpp \
		src/config/bspinfo.cpp \
		src/config/arg_info.cpp \
		src/config/linecfg.cpp \
		src/config/skillcfg.cpp \
		src/config/thingcfg.cpp \
		src/prefab/prefab_sys.cpp \
		src/prefab/prefab_mgr.cpp \
		src/plugin/plugin_api.cpp \
		src/plugin/plugin_sys.cpp \
		src/plugin/plugin_mgr.cpp

OBJS := $(SOURCES:.cpp=.o)
HEADERS := $(SOURCES:.cpp=.hpp)

GFXLIB_SRC := $(wildcard src/gfxlib/*.cpp) \
		$(wildcard src/2d/*.cpp) \
		$(wildcard src/3d/*.cpp) \
		$(wildcard src/carmack_helper/*.cpp)\
		$(wildcard src/3d/models/*.cpp)

GFXLIB_OBJ := $(GFXLIB_SRC:.cpp=.o)
GFXLIB_HEADERS := $(GFXLIB_SRC:.cpp=.hpp)

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
GZEXTRA_HEADERS := $(GZEXTRA_SRC:.cpp=.hpp)

ANVIL_SRC := src/anvil/

STATIC_LIBS := $(GFXLIB_NAME) \
		$(GZEXTRA_NAME) \
		$(FORGE_NAME) \
		$(ANVIL_NAME) \
		$(GODSEND_NAME) \
		$(VISMODE_SRC)

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


mkplugins:
	## TODO: translate existing GZDB-BF plugins and document Hellsmith's
	## plugin API.
	##
	## This make target calls other Makefiles.

libxml2:
	## TODO: figure out a way to build libxml2 from src from Hellsmith's
	## git repo.  Down with dependency hell! (for scrgut's sake!)

static_libs:
	## Build the static libs and send their objs to ar, the static librarian.
	mkdir -p $(STATICLIB_PATHPREFIX)
	ar $(ARFLAGS) $(STATICLIB_PATHPREFIX)/$(GZEXTRA_NAME) $(GZEXTRA_OBJ)

clean:
	rm -rf $(STATICLIB_PATHPREFIX)/$(STATIC_LIBS)

.PHONY: all,scrgut_bin,libxml2,mkplugins,static_libs,clean
.NOTPARALLEL: libxml2,mkplugins,clean
