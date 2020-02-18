# Alien::Hunspell [![Build Status](https://secure.travis-ci.org/Perl5-Alien/Alien-Hunspell.png)](http://travis-ci.org/Perl5-Alien/Alien-Hunspell) ![macos-share](https://github.com/Perl5-Alien/Alien-Hunspell/workflows/macos-share/badge.svg) ![macos-system](https://github.com/Perl5-Alien/Alien-Hunspell/workflows/macos-system/badge.svg) ![windows](https://github.com/Perl5-Alien/Alien-Hunspell/workflows/windows/badge.svg)

Install hunspell

# SYNOPSIS

In your Build.PL:

```perl
use Module::Build;
use Alien::Hunspell;
my $builder = Module::Build->new(
  ...
  configure_requires => {
    'Alien::Hunspell' => '0',
    ...
  },
  extra_compiler_flags => Alien::Hunspell->cflags,
  extra_linker_flags   => Alien::Hunspell->libs,
  ...
);

$build->create_build_script;
```

In your Makefile.PL:

```perl
use ExtUtils::MakeMaker;
use Config;
use Alien::Hunspell;

WriteMakefile(
  ...
  CONFIGURE_REQUIRES => {
    'Alien::Hunspell' => '0',
  },
  CCFLAGS => Alien::Hunspell->cflags . " $Config{ccflags}",
  LIBS    => [ Alien::Hunspell->libs ],
  ...
);
```

In your [FFI::Platypus](https://metacpan.org/pod/FFI::Platypus) script or module:

```perl
use FFI::Platypus;
use Alien::Hunspell;

my $ffi = FFI::Platypus->new(
  lib => [ Alien::Hunspell->dynamic_libs ],
);
```

# DESCRIPTION

This module provides the spelling library Hunspell.  It will either
detect it as provided by the operating system, or download the source
from the Internet and install it for you.  It uses [Alien::Base](https://metacpan.org/pod/Alien::Base).

# AUTHOR

Graham Ollis <plicease@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2015 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
