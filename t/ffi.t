use strict;
use warnings;
use Test::Stream -V1;
use Test::Alien;
use Alien::Hunspell;

plan 3;

alien_ok 'Alien::Hunspell';

ffi_ok { symbols => [qw( Hunspell_create Hunspell_destroy )] }, with_subtest {
  my($ffi) = @_;
  
  plan 2;
  
  
  my $ptr = $ffi
    ->function(Hunspell_create => ['string','string'] => 'opaque')
    ->call("t/supp.aff", "t/supp.dic");
  
  ok $ptr, "ptr = $ptr";
  
  $ffi->function(Hunspell_destroy => ['opaque'] => 'void')->call($ptr);
  
  ok 1, "did not crash";
};

