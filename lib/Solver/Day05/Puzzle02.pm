package Solver::Day05::Puzzle02;

use Moo;
use Devel::Dwarn;

extends 'Solver::Day05::Puzzle01';

has _password_array => (
  is => 'ro',
  default => sub { [] },
);

sub decrypt {
  my ( $self, $digest ) = @_;


  if ( $digest =~ /^0{5}/ ) {
    my $index = substr $digest, 5, 1;
    my $decrypted = substr $digest, 6, 1;

    if ( hex( $index ) < 8 ) {
      unless ( defined $self->_password_array->[ $index ] ) {
        $self->_password_array->[ $index ] = $decrypted;
        $self->_set_password( join( '',
          # Change undef to empty string
          map { defined $_ ? $_ : '' } @{$self->_password_array}
        ) );
      }
    }
  }
}

1;
