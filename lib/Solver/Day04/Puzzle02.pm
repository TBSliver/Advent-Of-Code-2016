package Solver::Day04::Puzzle02;

use Moo;
use Solver::Day04::Parser;

sub run {
  my ( $self, @args ) = @_;

  my @lines = split ( "\n", $args[0] );

  my $target = $args[1] or die "Must define a search term";

  for my $line ( @lines ) {
    my $parsed = Solver::Day04::Parser->new( input => $line );
    return $parsed->sector_id if $parsed->decode_name eq $target;
  }

  return "Nothing Found";
}

1;
