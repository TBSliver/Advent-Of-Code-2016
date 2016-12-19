package Solver::Day01::Puzzle01;

use Moo;
use Devel::Dwarn;

has directions => (
  is => 'lazy',
  builder => sub {
    return [qw/ north east south west /];
  },
);

has distances => (
  is => 'lazy',
  builder => sub {
    my $self = shift;
    my %distances = map { $_ => 0 } @{$self->directions};
    return \%distances;
  },
);

has dir_index => (
  is => 'rwp',
  default => 0,
);

sub turn_right {
  my $self = shift;
  $self->_set_dir_index( $self->dir_index + 1 );
  $self->_set_dir_index( 0 ) if $self->dir_index > 3;
}

sub turn_left {
  my $self = shift;
  $self->_set_dir_index( $self->dir_index - 1 );
  $self->_set_dir_index( 3 ) if $self->dir_index < 0;
}

sub add_distance {
  my $self = shift;
  my $distance = shift;

  $self->distances->{$self->directions->[$self->dir_index]} += $distance;
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

  my $ns_distance = $self->distances->{'north'} - $self->distances->{'south'};
  $ns_distance = $ns_distance < 0 ? -$ns_distance : $ns_distance;

  my $we_distance = $self->distances->{'east'} - $self->distances->{'west'};
  $we_distance = $we_distance < 0 ? -$we_distance : $we_distance;

  return $ns_distance + $we_distance;
}

1;
