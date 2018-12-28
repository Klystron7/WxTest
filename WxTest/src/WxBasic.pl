#!/usr/bin/env perl

use warnings;
use strict;

use Wx;

package MyApp;

use base 'Wx::App';

sub OnInit {
  my $self = shift;

  my $frame = Wx::Frame->new(
                              undef,
                              -1,
                              'A wxPerl Application',
                              &Wx::wxDefaultPosition,
                              &Wx::wxDefaultSize,
                              &Wx::wxMAXIMIZE_BOX | &Wx::wxCLOSE_BOX
  );

  $frame->Show;
}

MyApp->new->MainLoop;
