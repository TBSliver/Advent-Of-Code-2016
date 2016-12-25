use strict;
use warnings;

use FindBin qw/ $Bin /;
use lib "$Bin/../lib";

use Test::More;
use Solver;

my $solver = Solver->new(
  day => 5,
  puzzle => 2,
);

is $solver->run('abc'), '05ace8e3';

done_testing;
