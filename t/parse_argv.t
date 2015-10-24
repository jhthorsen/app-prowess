use strict;
use Test::More;
use File::Spec::Functions 'catfile';

my $prowess = do catfile qw( script prowess );
ok $prowess, 'compiled prowess' or diag $@;

is_deeply $prowess->parse_argv, {prove => [], watch => [qw( lib script t )]}, 'parse_argv';
is_deeply $prowess->parse_argv(qw( -w -w t )), {prove => ['-w'], watch => ['t']}, 'parse_argv';
is_deeply $prowess->parse_argv(qw( -l -w t -j6 )), {prove => [qw( -l -j6 )], watch => ['t']}, 'parse_argv';

done_testing;
