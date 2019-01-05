#!/usr/bin/env perl

use warnings;
use strict;

use Wx;

package MyFrame;

use base 'Wx::App';

sub OnInit {
  my $self = shift;

  my $frame = Wx::Frame->new(
                              undef,
                              -1,
                              'Frame',
                              &Wx::wxDefaultPosition,
                              &Wx::wxDefaultSize,
                              &Wx::wxMAXIMIZE_BOX | &Wx::wxCLOSE_BOX
  );

  $frame->Show;
  
}

MyFrame->new->MainLoop;
