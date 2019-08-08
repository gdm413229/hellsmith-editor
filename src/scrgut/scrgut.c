#include "scrgut.h"

/* scrgut -- make individual imgs from big imgs and xml defs
 * SYNOPSIS: scrgut [suitable xml file path]
 *
 * */

scrgut_status_t crop_img(MagickWand* basewand_ptr) {
  MagickWand workwand=CloneMagickWand(basewand_ptr);
  return SCRGUT_SUCCESS;
}

int main(uint32_t argc,char** argv) {
  MagickWand *bigimg = NULL;
  MagickWandGenesis();
  MagickWandTerminus();
  return EXIT_SUCCESS;
}

