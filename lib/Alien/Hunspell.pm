package Alien::Hunspell;

use strict;
use warnings;
use parent 'Alien::Base';

# ABSTRACT: Install hunspell
# VERSION
# ALIEN SYNOPSIS

=head1 DESCRIPTION

This module provides the spelling library Hunspell.  It will either 
detect it as provided by the operating system, or download the source 
from the Internet and install it for you.  It uses L<Alien::Base>.

=cut

sub dynamic_libs
{
  my($self) = @_;
  $self->install_type ne 'system'
    ? $self->SUPER::dynamic_libs
    : do {
      require FFI::CheckLib;
      FFI::CheckLib::find_lib(
        lib => '*',
        verify => sub { $_[0] =~ /hunspell/ },
        symbol => 'Hunspell_create',
      );
    };
}

1;
