use strict;
use warnings;

use FindBin qw/ $Bin /;
use lib "$Bin/../lib";

use Test::More;
use Solver;
use Solver::Day04::Parser;

my $solver = Solver->new(
  day => 4,
  puzzle => 1,
);

my %entries = (
  'aaaaa-bbb-z-y-x-123[abxyz]' => {
    valid => 1,
    id => 123,
    checksum => 'abxyz',
    calc_checksum => 'abxyz',
    name => 'aaaaabbbzyx',
  },
  'a-b-c-d-e-f-g-h-987[abcde]' => {
    valid => 1,
    id => 987,
    checksum => 'abcde',
    calc_checksum => 'abcde',
    name => 'abcdefgh',
  },
  'not-a-real-room-404[oarel]' => {
    valid => 1,
    id => 404,
    checksum => 'oarel',
    calc_checksum => 'oarel',
    name => 'notarealroom',
  },
  'totally-real-room-200[decoy]' => {
    valid => 0,
    id => 200,
    checksum => 'decoy',
    calc_checksum => 'loart',
    name => 'totallyrealroom',
  },
);

for my $item ( keys %entries ) {
  my $parser = Solver::Day04::Parser->new( input => $item );
  is $parser->valid, $entries{$item}->{valid};
  is $parser->sector_id, $entries{$item}->{id};
  is $parser->checksum, $entries{$item}->{checksum};
  is $parser->calc_checksum, $entries{$item}->{calc_checksum};
  is $parser->name, $entries{$item}->{name};
}

is $solver->run(
join ("\n", sort keys %entries )
), 1514;

done_testing;
