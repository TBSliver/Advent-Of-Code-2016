use strict;
use warnings;

use FindBin qw/ $Bin /;
use lib "$Bin/../lib";

use Test::More;
use Solver;

my $solver = Solver->new(
  day => 3,
  puzzle => 1,
);

is $solver->run(' 5  10  25
4  6  3
13    56    23'
), 1;

done_testing;
