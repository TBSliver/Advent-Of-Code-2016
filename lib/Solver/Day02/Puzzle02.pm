package Solver::Day02::Puzzle02;

use Moo;
use Devel::Dwarn;

extends 'Solver::Day02::Puzzle01';

has deny_up => ( is => 'lazy', builder => sub { [ 1, 2, 5, 4, 9 ] } );
has deny_down => ( is => 'lazy', builder => sub { [ 5, 10, 12, 13, 9 ] } );
has deny_left => ( is => 'lazy', builder => sub { [ 1, 2, 5, 10, 13 ] } );
has deny_right => ( is => 'lazy', builder => sub { [ 1, 4, 9, 12, 13 ] } );

sub step_up {
  my $self = shift;
  return -2 if $self->position == 3;
  return -2 if $self->position == 13;
  return -4;
}

sub step_down {
  my $self = shift;
  return 2 if $self->position == 1;
  return 2 if $self->position == 11;
  return 4;
}

has _position_lookup => (
  is => 'lazy',
  builder => sub { [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 'A', 'B', 'C', 'D' ] },
);

sub get_position {
  my $self = shift;
  return $self->_position_lookup->[ $self->position - 1 ];
}

1;
