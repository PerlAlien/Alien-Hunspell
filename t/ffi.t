use strict;
use warnings;
BEGIN {
  unless(eval { require Test::Alien; require Test::Stream; 1 })
  {
    require Test::More;
    Test::More::plan(skip_all => 'Test requires Test::Alien and Test::Stream');
  }
}
use Test::Stream -V1;
use Test::Alien;
use Alien::Hunspell;

skip_all 'no dynamic libs' unless Alien::Hunspell->dynamic_libs;

plan 3;

alien_ok 'Alien::Hunspell';

note "libs:";
note "  - $_" for Alien::Hunspell->dynamic_libs;

ffi_ok { symbols => [qw( Hunspell_create Hunspell_destroy )] }, with_subtest {
  my($ffi) = @_;
  
  plan 2;
  
  
  $ffi->attach(Hunspell_create => ['string','string'] => 'opaque');
  my $ptr = Hunspell_create("t/supp.aff", "t/supp.dic");
  
  ok $ptr, "ptr = $ptr";
  
  $ffi->attach(Hunspell_destroy => ['opaque'] => 'void');
  Hunspell_destroy($ptr);
  
  ok 1, "did not crash";
};

