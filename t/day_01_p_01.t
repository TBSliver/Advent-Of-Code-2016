use strict;
use warnings;

use FindBin qw/ $Bin /;
use lib "$Bin/../lib";

use Test::More;
use Solver;

my $solver = Solver->new(
  day => 1,
  puzzle => 1,
);

is $solver->run('R2, L3'), 5;

is $solver->run('R2, R2, R2'), 2;

is $solver->run('R5, L5, R5, R3'), 12;

done_testing;
