use strict;
use warnings;

use FindBin qw/ $Bin /;
use lib "$Bin/../lib";

use Test::More;
use Solver;

my $solver = Solver->new(
  day => 1,
  puzzle => 2,
);

is $solver->run('R8, R4, R4, R8'), 4;

is $solver->run('R3, L2, R2, R2, R3'), 3;

done_testing;
