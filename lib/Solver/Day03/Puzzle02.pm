package Solver::Day03::Puzzle02;

use Moo;
use Devel::Dwarn;

extends 'Solver::Day03::Puzzle01';

sub split_input {
  my $self = shift;
  my $input = shift;

  my @lines = split ( "\n", $input );

  my @interim_lines = map { [ $_ =~ /^\s*(\d+)\s+(\d+)\s+(\d+)$/ ] } @lines;

  my @output_lines;
  for my $xdx ( 0 .. ( ( scalar( @interim_lines ) / 3 ) - 1 ) ) {
    for my $ydx ( 0 .. 2 ) {
      push @output_lines, [
        $interim_lines[( $xdx * 3 )][ $ydx ],
        $interim_lines[( $xdx * 3 ) + 1][ $ydx ],
        $interim_lines[( $xdx * 3 ) + 2][ $ydx ],
      ];
    }
  }
  
  return @output_lines;
}

1;
