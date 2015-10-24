use strict;
use Test::More;
use File::Spec::Functions 'catfile';

my $prowess = do catfile qw( script prowess );
ok $prowess, 'compiled prowess' or diag $@;

is_deeply $prowess->parse_argv, {extra => [], watch => [qw( lib script t )]}, 'parse_argv';
is_deeply $prowess->parse_argv(qw( -w t )), {extra => [], watch => ['t']}, 'parse_argv';
is_deeply $prowess->parse_argv(qw( -l -w t -j6 )), {extra => [qw( -l -j6 )], watch => ['t']}, 'parse_argv';

done_testing;
