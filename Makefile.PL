
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Send SMS messages using Andrews and Arnold's gateway",
  "AUTHOR" => "David Leadbeater <dgl\@dgl.cx>",
  "BUILD_REQUIRES" => {
    "HTTP::Body" => 0,
    "SMS::Send" => 0,
    "Test::LWP::MockSocket::http" => 0,
    "Test::More" => "0.87"
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "SMS-Send-UK-AA",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "SMS::Send::UK::AA",
  "PREREQ_PM" => {
    "CACertOrg::CA" => 0,
    "Carp" => 0,
    "HTTP::Request::Common" => 0,
    "LWP::Protocol::https" => 0,
    "LWP::UserAgent" => "6.00",
    "SMS::Send::Driver" => 0,
    "URI" => "1.53",
    "constant" => 0,
    "overload" => 0,
    "parent" => 0,
    "strict" => 0
  },
  "VERSION" => "0.004",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



