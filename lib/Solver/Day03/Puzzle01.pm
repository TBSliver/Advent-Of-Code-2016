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

sub split_input {
  my $self = shift;
  my $input = shift;

  my @lines = split ( "\n", $input );

  my @output_lines = map { [ $_ =~ /^\s*(\d+)\s+(\d+)\s+(\d+)$/ ] } @lines;
  
  return @output_lines;
}

sub run {
  my ( $self, @args ) = @_;

  my @lines = $self->split_input( $args[0] );

  my $count = 0;

  for my $line ( @lines ) {
    $count++ if $self->check( @$line );
  }

  return $count;
}

1;
