package Solver::Day01::Puzzle02;

use Moo;
use Devel::Dwarn;

extends 'Solver::Day01::Puzzle01';

has history => (
  is => 'lazy',
  builder => sub { [] },
);

has overlap => (
  is => 'rwp',
);

around add_distance => sub {
  my $orig = shift;
  my $self = shift;
  my $distance = shift;

  foreach( 1..$distance ) {
    $orig->($self, 1 );
    my $history_entry = {
      ns => $self->get_ns_distance,
      we => $self->get_we_distance,
    };
    $self->check_history( $history_entry );
    push @{$self->history}, $history_entry;
  }
};

sub check_history {
  my $self = shift;
  my $current_place = shift;

  return if defined $self->overlap;

  for my $history_entry ( @{$self->history} ) {
    if ( $history_entry->{we} == $current_place->{we}
      && $history_entry->{ns} == $current_place->{ns}
    ) {
      $self->_set_overlap( $current_place );
    }
  }
}

sub run {
  my ( $self, @args ) = @_;

  my @split = split( ', ', $args[0] );

  for my $command ( @split ) {
    if ( $command =~ /^R/ ) {
      $self->turn_right;
    } elsif ( $command =~ /^L/ ) {
      $self->turn_left;
    } else {
      die ("Unrecognised Command $command");
    }

    my ( $command_distance ) = $command =~ /.(\d*)/;

    $self->add_distance( $command_distance );
  }

  my $ns_distance = abs $self->overlap->{ns};
  my $we_distance = abs $self->overlap->{we};

  return $ns_distance + $we_distance;
}

1;
