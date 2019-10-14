/* Hellsmith Editor : 2D Renderer API Abstraction Layer */

#include "renderer_structs.hpp"
#include "renderer_enums.hpp"
#include <cstdint>

namespace SmithRendererLayers {

/* This class of virtual functions is the backbone of Hellsmith's
 * 2D renderer infrastructure. OpenGL 1.x and 2.x are the first ones here.
 *
 * Potential future 2D renderers could be based on Metal and Direct2D. */

class SmithRenderer2D {

    public:

    enum class canvas_api {
    	NONE=0, // No renderer :Ｃ
    	OPENGL_1PX=1, // For Linux and all the other systems
    	OPENGL_2PX=2, // ditto
    	DIRECT2D=3, // For the windows of Satan's synagogue
    	DIRECTDRAW=13, // ditto, but for legacy Windows
    	METAL=4, // for Macs
    	IRISGL=5, // for a good laugh and for time travel operations
    	SOFTWARE_RENDERING=6 // as a fallback XD
    };

    enum class prim_type {
    	POINTS=1,
    	LINES=2,
    	TRIS=3,
    	QUADS=4,
    	LINE_LOOP=12,
    	TRI_STRIP=13,
    	TRI_FAN=23,
    	QUAD_STRIP=14,
    	CONVEX_NGON=1993 // In GL terms, that is GL_POLYGON
    };

    enum class blend_factor {
    	ZERO = 0, ONE = 1,
    	ONE_MINUS_SRC_COLOR = 2,
    	ONE_MINUS_SRC_ALPHA = 3,
    	ONE_MINUS_DST_COLOR = 4,
    	ONE_MINUS_DST_ALPHA = 5
    };

    enum class blend_equation {
    	ADD = 0, SUBTRACT = 1
    };

    public:

    // TODO: define API [being fulfilled!]
    // Commonly used functions
    virtual void init()=0; // Initialize 2D renderer
    virtual void set_viewport(uint32_t width,uint32_t height)=0; // Set viewport
    virtual void clear()=0; // Clear canvas
    virtual void submit()=0; // Submit batch to renderer
    virtual void canvas_begin(prim_type primtype)=0; // Put that pen down!
    virtual void canvas_end()=0; // ＰＥＮ　ＵＰ！
    // Texture stuff
    virtual void register_tex()=0; // register this tex. into registry
    virtual void unregister_tex()=0; // bleach the tex's field off the reg.
    // Blending stuff
    virtual void set_blend_state()=0; // Set blending mode

    inline static canvas_api get_api() {return i_canvasAPI;}

    private:
    static canvas_api i_canvasAPI;
};

}
