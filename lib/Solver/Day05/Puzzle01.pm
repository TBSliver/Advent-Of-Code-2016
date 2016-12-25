package Solver::Day05::Puzzle01;

use Moo;
use Devel::Dwarn;
use Digest::MD5 qw/ md5_hex /;

has password => (
  is => 'rwp',
  default => '',
);

sub run {
  my ( $self, $door_id ) = @_;

  my $index = 0;
  while ( 1 ) {

    my $input = $door_id . $index;
    my $digest = md5_hex( $input );

    $self->decrypt( $digest );

    last if length $self->password >= 8;
    $index++;
  }

  return $self->password;
}

sub decrypt {
  my ( $self, $digest ) = @_;

  my $decrypted = undef;

  if ( $digest =~ /^0{5}/ ) {
    $decrypted = substr $digest, 5, 1;

    $self->_set_password( $self->password . $decrypted );
  }
}

1;
