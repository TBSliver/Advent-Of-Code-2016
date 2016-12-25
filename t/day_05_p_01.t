use strict;
use warnings;

use FindBin qw/ $Bin /;
use lib "$Bin/../lib";

use Test::More;
use Solver;

my $solver = Solver->new(
  day => 5,
  puzzle => 1,
);

is $solver->run('abc'), '18f47a30';

done_testing;
