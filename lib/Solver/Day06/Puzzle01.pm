package Solver::Day06::Puzzle01;

use Moo;
use Devel::Dwarn;

sub run {
  my ( $self, $input ) = @_;

  my @lines = split "\n", $input;

  my @hashes; push( @hashes, {} ) for 1 .. length( $lines[0] );

  for my $line ( @lines ) {
    for my $index ( 0 .. length( $line ) - 1) {
      my $char = substr $line, $index, 1;
      $hashes[$index]->{$char}++;
    }
  }

  my $message = $self->get_message( @hashes );
  return $message;
}

sub get_message {
  my ( $self, @hashes ) = @_;

  my $message = '';

  for my $hash ( @hashes ) {
    my ( $char ) = sort { $hash->{$b} <=> $hash->{$a} } keys %$hash;
    $message .= $char;
  }

  return $message;
}

1;
