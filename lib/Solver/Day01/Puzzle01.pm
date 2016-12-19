package Solver::Day01::Puzzle01;

use Moo;
use Devel::Dwarn;

sub run {
  my ( $self, @args ) = @_;

  my @split = split( ', ', $args[0] );

  my @dirs = (qw/ north east south west /);
  my %distances = map { $_ => 0 } @dirs;

  my $dir_index = 0;

  for my $command ( @split ) {
    if ( $command =~ /^R/ ) {
      $dir_index++;
      $dir_index = $dir_index > 3 ? 0 : $dir_index;
    } elsif ( $command =~ /^L/ ) {
      $dir_index--;
      $dir_index = $dir_index < 0 ? 3 : $dir_index;
    } else {
      die ("Unrecognised Command $command");
    }

    my ( $command_distance ) = $command =~ /.(\d*)/;
    $distances{$dirs[$dir_index]} += $command_distance;
  }

  my $ns_distance = $distances{'north'} - $distances{'south'};
  $ns_distance = $ns_distance < 0 ? -$ns_distance : $ns_distance;

  my $we_distance = $distances{'east'} - $distances{'west'};
  $we_distance = $we_distance < 0 ? -$we_distance : $we_distance;

  return $ns_distance + $we_distance;
}

1;
