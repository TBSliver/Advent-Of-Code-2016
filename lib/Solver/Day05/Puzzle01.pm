package Solver::Day05::Puzzle01;

use Moo;
use Devel::Dwarn;
use Digest::MD5 qw/ md5_hex /;

sub run {
  my ( $self, $door_id ) = @_;

  my $index = 0;
  my $password = '';
  while ( 1 ) {

    my $input = $door_id . $index;
    my $digest = md5_hex( $input );

    if ( $digest =~ /^0{5}/ ) {
      $password .= substr $digest, 5, 1;
    }

    last if length $password >= 8;
    $index++;
  }

  return $password;
}

1;
