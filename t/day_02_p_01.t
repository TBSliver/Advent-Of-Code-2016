use strict;
use warnings;

use FindBin qw/ $Bin /;
use lib "$Bin/../lib";

use Test::More;
use Solver;

my $solver = Solver->new(
  day => 2,
  puzzle => 1,
);

is $solver->run(
'ULL
RRDDD
LURDL
UUUUD'
), 1985;

done_testing;
