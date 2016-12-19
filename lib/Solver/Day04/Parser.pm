package Solver::Day04::Parser;

use Moo;
use Devel::Dwarn;

has input => (
  is => 'ro',
  required => 1
);

has raw_name => (
  is => 'lazy',
  builder => sub {
    my $self = shift;
    my ( $name ) = $self->input =~ /^([a-z\-]+)/;
    $name =~ s/\-$//;
    return $name;
  },
);

has name => (
  is => 'lazy',
  builder => sub {
    my $self = shift;
    my $name = $self->raw_name;
    $name =~ s/\-//g;
    return $name;
  },
);

has checksum => (
  is => 'lazy',
  builder => sub {
    my $self = shift;
    my ( $checksum ) = $self->input =~ /\[(.*)\]/;
    return $checksum;
  },
);

has valid => (
  is => 'lazy',
  builder => sub {
    my $self = shift;
    return $self->checksum eq $self->calc_checksum ? 1 : 0;
  },
);

has sector_id => (
  is => 'lazy',
  builder => sub {
    my $self = shift;
    my ( $id ) = $self->input =~ /(\d+)/;
    return $id;
  },
);

sub calc_checksum {
  my $self = shift;

  my %count;
  map { $count{$_}++ } split( '', $self->name );
  my @sorted = sort { $count{$b} <=> $count{$a} || $a cmp $b } keys %count;
  return substr join('', @sorted), 0, 5;
 
}

sub decode_name {
  my $self = shift;
  
  my @input = split( '', $self->raw_name );

  my $remainder = $self->sector_id % 26;
  my %decode = map {
    my $oa = ord('a');
    chr($_) => chr(
      (
        ($_ - $oa + $remainder) % 26
      ) + $oa
    )
  } ord ('a') .. ord ('z');
  $decode{ '-' } = ' ';
  $decode{ ' ' } = ' ';
  
  my @output = map { $decode{$_ } } @input;

  return join('', @output);
}

1;
