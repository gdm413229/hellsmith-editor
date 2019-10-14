namespace SmithRenderLayers {

class SmithRenderer2D{
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
};

}
