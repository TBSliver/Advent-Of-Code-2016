requires 'Moo';
requires 'MooX::Options';
requires 'namespace::clean';
requires 'Devel::Dwarn';

on 'test' => sub {
  requires 'Test::More';
};
