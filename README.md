# NAME

Path::Tiny::Rule - Path::Iterator::Rule subclass that returns Path::Tiny objects

# VERSION

version 0.02

# SYNOPSIS

    use Path::Tiny::Rule;

    my $iter = Path::Tiny::Rule->new->name(qr/\.t$/)->iter('t');

    while ( my $test_file = $iter->() ) {
        print $test_file->basename, "\n";
    }

# DESCRIPTION

This module is a very thin wrapper around [Path::Iterator::Rule](https://metacpan.org/pod/Path::Iterator::Rule) that always
returns [Path::Tiny](https://metacpan.org/pod/Path::Tiny) objects instead of strings. It should otherwise be a
drop-in replacement for [Path::Iterator::Rule](https://metacpan.org/pod/Path::Iterator::Rule), and any deviation from that
is a bug.

This module has no public API that is not provided by [Path::Iterator::Rule](https://metacpan.org/pod/Path::Iterator::Rule).

It exists because I got really tired of writing this:

    while ( my $path = $iter->() ) {
        $path = path($path);
        ...;
    }

# SUPPORT

Bugs may be submitted at [https://github.com/houseabsolute/Path-Tiny-Rule/issues](https://github.com/houseabsolute/Path-Tiny-Rule/issues).

I am also usually active on IRC as 'autarch' on `irc://irc.perl.org`.

# SOURCE

The source code repository for Path-Tiny-Rule can be found at [https://github.com/houseabsolute/Path-Tiny-Rule](https://github.com/houseabsolute/Path-Tiny-Rule).

# DONATIONS

If you'd like to thank me for the work I've done on this module, please
consider making a "donation" to me via PayPal. I spend a lot of free time
creating free software, and would appreciate any support you'd care to offer.

Please note that **I am not suggesting that you must do this** in order for me
to continue working on this particular software. I will continue to do so,
inasmuch as I have in the past, for as long as it interests me.

Similarly, a donation made in this way will probably not make me work on this
software much more, unless I get so many donations that I can consider working
on free software full time (let's all have a chuckle at that together).

To donate, log into PayPal and send money to autarch@urth.org, or use the
button at [http://www.urth.org/~autarch/fs-donation.html](http://www.urth.org/~autarch/fs-donation.html).

# AUTHOR

Dave Rolsky <autarch@urth.org>

# COPYRIGHT AND LICENSE

This software is Copyright (c) 2017 - 2019 by Dave Rolsky.

This is free software, licensed under:

    The Artistic License 2.0 (GPL Compatible)

The full text of the license can be found in the
`LICENSE` file included with this distribution.
