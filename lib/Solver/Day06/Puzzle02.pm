package Solver::Day06::Puzzle02;

use Moo;
use Devel::Dwarn;

extends 'Solver::Day06::Puzzle01';

sub get_message {
  my ( $self, @hashes ) = @_;

  my $message = '';

  for my $hash ( @hashes ) {
    my ( $char ) = sort { $hash->{$a} <=> $hash->{$b} } keys %$hash;
    $message .= $char;
  }

  return $message;
}

1;
