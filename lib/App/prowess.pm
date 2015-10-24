package App::prowess;

=head1 NAME

App::prowess - Watch files for changes and re-run prove

=head1 VERSION

0.01

=head1 DESCRIPTION

L<App::prowess> is an application which will watch files for changes and the
re-run C<prove> on change.

=head1 SYNOPSIS

  # Watch default directories
  $ prowess t/mytest.t

  # Watch just lib/ directory
  $ prowess -w lib t/mytest.t

  # Get debug information
  $ PROW_DEBUG=1 prowess -w lib t/mytest.t

=head1 SEE ALSO

L<App::Prove::Watch> is an alternative to C<prowess>. The main difference is:

=over 4

=item *

C<prowess> will restart the test run on every file change. This means that
if the test has not completed, it will be C<kill>ed and restarted. This is
nice when you have tests that might hang.

=back

=cut

use strict;
use warnings;

our $VERSION = '0.01';

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2014, Jan Henning Thorsen

This program is free software, you can redistribute it and/or modify it under
the terms of the Artistic License version 2.0.

=head1 AUTHOR

Jan Henning Thorsen - C<jhthorsen@cpan.org>

=cut

1;
