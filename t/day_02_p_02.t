use strict;
use warnings;

use FindBin qw/ $Bin /;
use lib "$Bin/../lib";

use Test::More;
use Solver;

my $solver = Solver->new(
  day => 2,
  puzzle => 2,
);

is $solver->run(
'ULL
RRDDD
LURDL
UUUUD'
), '5DB3';

is $solver->run(
'RRRRRRRRRRRRRRRR
LLDDDDDDDDDD
UULLLLLLLLLL
RRUUUUUUUUUU'
), '9D51';

is $solver->run(
'RRUU
DL
R
R
DLLL
R
R
R
R
LLLD
R
R
LD'
), '123456789ABCD';

is $solver->run(
'L
U
D'
), '555';

is $solver->run(
'R
UD
DU
LR
RL'
), '66666';

done_testing;
