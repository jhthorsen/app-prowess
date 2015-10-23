package App::prow;

=head1 NAME

App::prow - Watch files for changes and re-run prove

=head1 VERSION

0.01

=head1 DESCRIPTION

L<App::prow> is an application which will watch files for changes and the
re-run C<prove> on change.

=head1 SYNOPSIS

  $ prow t/mytest.t

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
