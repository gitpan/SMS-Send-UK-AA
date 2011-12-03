package
  SMS::Send::UK::AA::Response;
use strict;
use overload
  q{0+}   => '_status',
  q{bool} => '_status',
  q{""} => '_message';

sub new {
  my($class, $status, $message) = @_;

  return bless [$status, $message], $class;
}

sub _status {
  return shift->[0];
}

sub _message {
  return shift->[1];
}

1;

__END__
=pod

=head1 NAME

SMS::Send::UK::AA::Response

=head1 VERSION

version 0.002

=head1 AUTHOR

David Leadbeater <dgl@dgl.cx>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by David Leadbeater.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

