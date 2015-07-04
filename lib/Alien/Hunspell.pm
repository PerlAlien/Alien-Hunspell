package Alien::Hunspell;

use strict;
use warnings;
use parent 'Alien::Base';

# ABSTRACT: Install hunspell
# VERSION

=head1 SYNOPSIS

Build.PL:

 use Alien::Hunspell;
 use Module::Build;
 
 Module::Build->new(
   ...
   extra_compiler_flags => Alien::Hunspell->cflags,
   extra_linker_flags   => Alien::HunSpell->libs,
   ...
 )->create_build_script;

Makefile.PL:

 use Alien:Hunspell;
 use ExtUtils::MakeMaker;
 
 WriteMakefile(
   ...
   CCFLAGS => $alien->cflags,
   LIBS    => $alien->libs,
   ...
 );

FFI::Platypus:

 use Alien::Hunspell;
 use FFI::Platypus;
 
 my $ffi = FFI::Platypus->new(
   lib => [Alien::Hunspell->new->dynamic_libs],
 );
 ...

=head1 DESCRIPTION

This module provides the spelling library Hunspell.  It will either 
detect it as provided by the operating system, or download the source 
from the Internet and install it for you.  It uses L<Alien::Base>.

=cut

1;
