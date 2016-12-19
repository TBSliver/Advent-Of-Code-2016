package Solver::Day03::Puzzle01;

use Moo;
use Devel::Dwarn;

sub check {
  my $self = shift;
  my ( $a, $b, $c ) = @_;

  my $flag = 1;

  unless ( ( ( $a + $b ) > $c ) &&
           ( ( $a + $c ) > $b ) &&
           ( ( $b + $c ) > $a )
  ) {
    $flag = undef;
  }
  return $flag;
}

sub run {
  my ( $self, @args ) = @_;

  my @lines = split ( "\n", $args[0] );

  my $count = 0;

  for my $line ( @lines ) {
    my ( $a, $b, $c ) = $line =~ /^\s*(\d+)\s+(\d+)\s+(\d+)$/;

    $count++ if $self->check( $a, $b, $c );
  }

  return $count;
}

1;
