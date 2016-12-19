package Solver::Day04::Puzzle01;

use Moo;
use Solver::Day04::Parser;

sub run {
  my ( $self, @args ) = @_;

  my @lines = split ( "\n", $args[0] );

  my $output = 0;

  for my $line ( @lines ) {
    my $parsed = Solver::Day04::Parser->new( input => $line );
    $output += $parsed->sector_id if $parsed->valid;
  }

  return $output;
}

1;
