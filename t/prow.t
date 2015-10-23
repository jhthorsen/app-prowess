use strict;
use Test::More;
use File::Spec::Functions 'catfile';

my $prow = do catfile qw( script prow );
ok $prow, 'compiled prow' or diag $@;

is_deeply $prow->parse_argv, {extra => [], watch => [qw( lib script t )]}, 'parse_argv';
is_deeply $prow->parse_argv(qw( -w t )), {extra => [], watch => ['t']}, 'parse_argv';
is_deeply $prow->parse_argv(qw( -l -w t -j6 )), {extra => [qw( -l -j6 )], watch => ['t']}, 'parse_argv';

done_testing;
