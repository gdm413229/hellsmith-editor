
#include <cstdint>
#include <string>
#define PALETTE_COLORS ((2<<7)-1)

/* Hellsmith Editor : DOOM image format helpers (Header) */

namespace SmithHellforge {
    class DOOMPlaypal {
        // For palettes (DOOM image formats need this!)
        public:

        inline uint16_t get_numpalcols() {
            return num_palcols;
        }
        inline uint16_t get_numpalbytes() {
            return num_palbytes;
        }

        DOOMPlaypal(std::string input_filename); // Gets a palette from a WAD

        ~DOOMPlaypal();

        private:

        inline uint16_t count_palcols() {
        uint16_t counter=0;
        while(counter <= PALETTE_COLORS) {
            counter++;
        }
        return counter;
        }

        uint16_t num_palcols; uint16_t num_palbytes;
    };
    class DOOMImage {
        // For DOOM column encoded images
    };
    class DOOMFlat {
        // For DOOM flats
    };
}
