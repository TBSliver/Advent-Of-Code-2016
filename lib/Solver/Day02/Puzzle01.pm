package Solver::Day02::Puzzle01;

use Moo;
use List::Util qw/ any /;
use Devel::Dwarn;

has position => (
  is => 'rwp',
  default => 5,
);

sub get_position {
  my $self = shift;

  return $self->position;
}

sub _move {
  my $self = shift;
  my $amount = shift;
  my $deny = shift;

  unless ( any { $_ eq $self->position } @{$deny} ) {
    $self->_set_position( $self->position + $amount );
  }
}

has deny_up => ( is => 'lazy', builder => sub { [ 1, 2, 3 ] } );
has step_up => ( is => 'ro', default => -3 );
sub move_up { my $self = shift; $self->_move( $self->step_up, $self->deny_up ) }

has deny_down => ( is => 'lazy', builder => sub { [ 7, 8, 9 ] } );
has step_down => ( is => 'ro', default => 3 );
sub move_down { my $self = shift; $self->_move( $self->step_down, $self->deny_down ) }

has deny_left => ( is => 'lazy', builder => sub { [ 1, 4, 7 ] } );

sub move_left { my $self = shift; $self->_move( -1, $self->deny_left ) }

has deny_right => ( is => 'lazy', builder => sub { [ 3, 6, 9 ] } );

sub move_right { my $self = shift; $self->_move( 1, $self->deny_right ) }

sub run {
  my ( $self, @args ) = @_;

  my @lines = split( "\n", $args[0] );

  my $output = '';

  for my $line (@lines) {
    my @commands = split('', $line);

    for my $command (@commands) {
      if ( $command eq 'U' ) {
        $self->move_up;
      } elsif ( $command eq 'D' ) {
        $self->move_down;
      } elsif ( $command eq 'L' ) {
        $self->move_left;
      } elsif ( $command eq 'R' ) {
        $self->move_right;
      } else {
        die "Unrecognised command $command";
      }
    }
    $output .= $self->get_position;

  }

  return $output;
}

1;
