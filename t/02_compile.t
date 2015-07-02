use strict;
use warnings;
use Test::More;
use Test::CChecker;
use Alien::Hunspell;

plan tests => 1;

compile_output_to_note;

compile_with_alien 'Alien::Hunspell';

compile_run_ok <<C_CODE, "basic compile test";
#include <hunspell.h>

int
main(int argc, char *argv[])
{
  Hunhandle *h;
  
  h = Hunspell_create("","");
  Hunspell_destroy(h);
  
  return 0;
}
C_CODE

