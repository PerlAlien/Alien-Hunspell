# Alien::Hunspell [![Build Status](https://travis-ci.org/PerlAlien/Alien-Hunspell.svg)](http://travis-ci.org/PerlAlien/Alien-Hunspell) ![macos-share](https://github.com/PerlAlien/Alien-Hunspell/workflows/macos-share/badge.svg) ![macos-system](https://github.com/PerlAlien/Alien-Hunspell/workflows/macos-system/badge.svg) ![windows](https://github.com/PerlAlien/Alien-Hunspell/workflows/windows/badge.svg)

Install hunspell

# SYNOPSIS

In your Makefile.PL:

```perl
use ExtUtils::MakeMaker;
use Alien::Base::Wrapper ();

WriteMakefile(
  Alien::Base::Wrapper->new('Alien::Hunspell')->mm_args2(
    # MakeMaker args
    NAME => 'My::XS',
    ...
  ),
);
```

In your Build.PL:

```perl
use Module::Build;
use Alien::Base::Wrapper qw( Alien::Hunspell !export );

my $builder = Module::Build->new(
  ...
  configure_requires => {
    'Alien::Hunspell' => '0',
    ...
  },
  Alien::Base::Wrapper->mb_args,
  ...
);

$build->create_build_script;
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
