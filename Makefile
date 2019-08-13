## get build architecture id

ARCHITECTURE := $(shell uname -m)

## Get child make jobs from an env. variable from the same name.
CHILD_MAKE_JOBS := $((origin CHILD_MAKE_JOBS))

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

## SlimDX can chug down oceans of bleach!!!

## You know what spirit made M$ develop DirectX!?
## Quite certain that Mammon and King Paimon were involved in DirectX's conception.

## This variant of GZDoom's HW abstraction layer will dispel that vile
## sorcery from Bill Gates in 1995!
## Even Bill Gates' wife is a witch! (Iran considers DirectX "sorcery and witchcraft"!)

## I'm absolutely looking forward to Windows' descent into Hell.

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
SCRGUT_LIBS := `pkg-config --libs `
PKGCONF_LIBS := zlib gl
LDFLAGS := -I.$(STATICLIB_PATHPREFIX) $(STATICLIB_LDFLAGS) `pkg-config --libs $(PKGCONF_LIBS)`
ARFLAGS := rcs

SCRGUT_NAME := scrgut.$(ARCHITECTURE)

## WAD.cs and Lump.cs are being ported and coalesced into wadlib.cpp/hpp.

SOURCES := src/main.cpp \
		src/core/wad/wadlib.cpp \
		src/core/g4_posix/logsys.cpp \
		src/config/cfg_enums.cpp \
		src/config/gen_specials.cpp \
		src/config/gamecfg.cpp \
		src/config/texset.cpp \
		src/config/flags.cpp \
		src/config/bspinfo.cpp \
		src/config/arg_info.cpp \
		src/config/linecfg.cpp \
		src/core/dictsys.cpp \
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

FORGE_SRC := src/core/forge/doom_imglib.cpp \
		src/core/forge/doom_maplib.cpp \
		src/core/forge/hexen_maplib.cpp \
		src/core/forge/udmf_maplib.cpp \
		src/core/forge/dirlib.cpp \
		src/core/forge/ziplib.cpp \
		src/core/forge/serializer.cpp \
		src/core/forge/alien_imglib.cpp

ANVIL_SRC := src/anvil/gridsys.cpp \
		$(wildcard src/anvil/anvil_*.cpp) \
		src/anvil/text_label.cpp \
		src/anvil/thing_filters.cpp \
		src/anvil/tool_system.cpp \
		src/anvil/planview.cpp

ANVIL_OBJ := $(ANVIL_SRC:.cpp=.o)
ANVIL_HEADERS := $(ANVIL_SRC:.cpp=.hpp)

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

STATIC_LIB_SRC := $(FORGE_SRC) \
		$(GFXLIB_SRC) \
		$(ANVIL_SRC) \
		$(GODSEND_SRC) \
		$(VISMODE_SRC) \
		$(GZEXTRA_SRC)

STATIC_LIB_OBJ := $(FORGE_OBJ) \
		$(GFXLIB_OBJ) \
		$(ANVIL_OBJ) \
		$(GODSEND_OBJ) \
		$(VISMODE_OBJ) \
		$(GZEXTRA_OBJ)

all: $(OBJS) $(DATA) $(NAME)

$(NAME):

scrgut_obj: libxml2
	$(CC) $(CFLAGS) `pkg-config --cflags --libs MagickWand`

scrgut_bin: scrgut_obj
	$(CC) $


## ＡＣＨＴＵＮＧ！ mkplugins will build the Hellsmith Editor! (for proper linkage!)

mkplugins: $(NAME)
	## TODO: translate existing GZDB-BF plugins and document Hellsmith's
	## plugin API.
	##
	## This make target invokes other Makefiles. (even this Makefile has child Makefiles!)
	
	cd src/plugins/visplane_explorer
	make -j $(CHILD_MAKE_JOBS)
	cd ../bsp_view
	make -j $(CHILD_MAKE_JOBS)
	cd ../automap_edit
	make -j $(CHILD_MAKE_JOBS)
	cd ../ez_3dfloor
	make -j $(CHILD_MAKE_JOBS)
	cd ../ez_sndenv
	make -j $(CHILD_MAKE_JOBS)
	cd ../../

libxml2:
	## TODO: figure out a way to build libxml2 from src from Hellsmith's
	## git repo.  Down with dependency hell! (for scrgut's sake!)

.PHONY static_lib_objs: $(STATIC_LIBS_SRC)

static_libs:
	## Build the static libs and send their objs to ar, the static librarian.
	mkdir -p $(STATICLIB_PATHPREFIX)
	ar $(ARFLAGS) $(STATICLIB_PATHPREFIX)/$(FORGE_NAME) $(FORGE_OBJ)
	ar $(ARFLAGS) $(STATICLIB_PATHPREFIX)/$(ANVIL_NAME) $(ANVIL_OBJ)
	ar $(ARFLAGS) $(STATICLIB_PATHPREFIX)/$(GZEXTRA_NAME) $(GZEXTRA_OBJ)
	ar $(ARFLAGS) $(STATICLIB_PATHPREFIX)/$(GFXLIB_NAME) $(GFXLIB_OBJ)

clean:
	rm -rf $(STATICLIB_PATHPREFIX)

.PHONY: all,scrgut_bin,libxml2,mkplugins,static_libs,clean
.NOTPARALLEL: static_libs,libxml2,mkplugins,clean
