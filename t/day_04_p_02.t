use strict;
use warnings;

use FindBin qw/ $Bin /;
use lib "$Bin/../lib";

use Test::More;
use Solver;
use Solver::Day04::Parser;

my $solver = Solver->new(
  day => 4,
  puzzle => 2,
);

my %entries = (
  'aaaaa-bbb-z-y-x-123[abxyz]' => {
    raw_name => 'aaaaa-bbb-z-y-x',
    decoded => 'ttttt uuu s r q',
  },
  'a-b-c-d-e-f-g-h-987[abcde]' => {
    raw_name => 'a-b-c-d-e-f-g-h',
    decoded => 'z a b c d e f g',
  },
  'not-a-real-room-404[oarel]' => {
    raw_name => 'not-a-real-room',
    decoded => 'bch o fsoz fcca',
  },
  'totally-real-room-200[decoy]' => {
    raw_name => 'totally-real-room',
    decoded => 'lglsddq jwsd jgge',
  },
);

for my $item ( keys %entries ) {
  my $parser = Solver::Day04::Parser->new( input => $item );
  is $parser->raw_name, $entries{$item}->{raw_name};
  is $parser->decode_name, $entries{$item}->{decoded};
}

is $solver->run(
join ("\n", sort keys %entries ), 'bch o fsoz fcca',
), 404;

done_testing;
