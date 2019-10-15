package Path::Tiny::Rule;

use strict;
use warnings;
use namespace::autoclean;

our $VERSION = '0.02';

use Path::Tiny qw( path );

use parent 'Path::Iterator::Rule';

## no critic (Subroutines::ProhibitUnusedPrivateSubroutines)
sub _iter {
    my $self = shift;

    my $iter = $self->SUPER::_iter(@_);

    return sub {
        my $item = $iter->();
        return unless $item;
        return path($item);
    };
}

1;

# ABSTRACT: Path::Iterator::Rule subclass that returns Path::Tiny objects

__END__

=head1 SYNOPSIS

  use Path::Tiny::Rule;

  my $iter = Path::Tiny::Rule->new->name(qr/\.t$/)->iter('t');

  while ( my $test_file = $iter->() ) {
      print $test_file->basename, "\n";
  }

=head1 DESCRIPTION

This module is a very thin wrapper around L<Path::Iterator::Rule> that always
returns L<Path::Tiny> objects instead of strings. It should otherwise be a
drop-in replacement for L<Path::Iterator::Rule>, and any deviation from that
is a bug.

This module has no public API that is not provided by L<Path::Iterator::Rule>.

It exists because I got really tired of writing this:

  while ( my $path = $iter->() ) {
      $path = path($path);
      ...;
  }
