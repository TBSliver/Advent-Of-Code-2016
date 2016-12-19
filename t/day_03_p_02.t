use strict;
use warnings;

use FindBin qw/ $Bin /;
use lib "$Bin/../lib";

use Test::More;
use Solver;

my $solver = Solver->new(
  day => 3,
  puzzle => 2,
);

is $solver->run(
' 1  1  5
  2  2  2
  5  2  6
  5  6  9
  8  6  3
  67 98 10004'
), 2;

done_testing;
