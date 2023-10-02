unit module MyFoo;

use JSON::Fast;

=begin comment
%meta<auth ver api> //= '';
=end comment
sub get-auth() is export {
    say $?DISTRIBUTION.meta<auth>.Str
}

sub get-ver() is export {
    say $?DISTRIBUTION.meta<ver>.Str
}

sub get-api() is export {
    say $?DISTRIBUTION.meta<api>.Str
}

sub get-ver1() is export {
    my $jstr = $?DISTRIBUTION.content("META6.json").open.slurp;
    my %meta = from-json $jstr;
    say %meta<version>;
}

sub module-source() is export {
    say $?DISTRIBUTION.content("lib/MyFoo.rakumod")
}

sub module-source1() is export {
    say $?DISTRIBUTION.content("lib/MyFoo.rakumod").open.lines.head
}

sub module-source2() is export {
    say $?DISTRIBUTION.content("lib/MyFoo.rakumod").open.slurp
}

sub module-source3() is export {
    say $?DISTRIBUTION.content("lib/MyFoo.rakumod").open
}
