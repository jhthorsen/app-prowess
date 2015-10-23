use strict;
use Test::More;
use Time::HiRes 'ualarm';

plan skip_all => 'Need *nix' unless -x 'script/prow' and $ENV{PATH};
my $prow = do 'script/prow' or die $@;
my $prove = 't/bin/prove';

{
  open my $FH, '>', $prove;
  print $FH "#!$^X\nsleep \$ENV{PROW_TEST_SLEEP} if \$ENV{PROW_TEST_SLEEP};\nexit;\n";
  chmod 0755, 't/bin/prove';
}

$SIG{ALRM} = sub {
  my $curr = (stat $prove)[9];
  my $time = $curr + 5 - int rand 10;
  $time-- if $time == $curr;
  diag "utime $time, $time, $prove";
  utime $time, $time, $prove;
};

$ENV{PATH}      = 't/bin';
$ENV{PROW_ONCE} = 1;

ualarm 300e3;
is $prow->run(qw( -w t -l )), 0, 'run once';

ualarm 300e3;
$ENV{PROW_TEST_SLEEP} = 3;
is $prow->run(qw( -w t -l )), 0, 'kill running test';

done_testing;
