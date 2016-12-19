package Solver::Day02::Puzzle01;

use Moo;
use Devel::Dwarn;

has position => (
  is => 'rwp',
  default => 5,
);

sub _move {
  my $self = shift;
  my $amount = shift;

  $self->_set_position( $self->position + $amount );
}

sub move_up {
  my $self = shift;
  unless ( $self->position < 4 ) {
    $self->_move( -3 );
  }
}

sub move_down {
  my $self = shift;
  unless( $self->position > 6 ) {
    $self->_move( 3 );
  }
}

sub move_left {
  my $self = shift;
  unless (
    $self->position == 1 ||
    $self->position == 4 ||
    $self->position == 7
  ) {
    $self->_move( -1 );
  }
}

sub move_right {
  my $self = shift;
  unless (
    $self->position == 3 ||
    $self->position == 6 ||
    $self->position == 9
  ) {
    $self->_move( 1 );
  }
}

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
    $output .= $self->position;

  }

  return $output;
}

1;
