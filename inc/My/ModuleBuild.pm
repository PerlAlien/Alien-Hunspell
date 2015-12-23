package My::ModuleBuild;

use strict;
use warnings;
use base qw( Alien::Base::ModuleBuild );

sub new
{
  my($class, %args) = @_;
  
  if($^O eq 'MSWin32')
  {
    $args{alien_bin_requires}->{'Alien::libtool24'} = '0.02';
    $args{alien_helper}->{ltbase} = q{
      require Alien::libtool24;
      my $dir = Alien::libtool24->dist_dir;
      $dir =~ s{/}{\\\\}g;
      $dir;
    };
    my $make = pop @{ $args{alien_build_commands} };
    push @{ $args{alien_build_commands} }, 'copy %{ltbase}\\bin\\libtool libtool', $make;
  }
  
  my $self = $class->SUPER::new(%args);
  $self;
}

1;
