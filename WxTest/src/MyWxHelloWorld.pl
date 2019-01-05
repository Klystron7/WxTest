#!/usr/bin/perl -w
use strict;
use Wx;

# Define our HelloWorld class that extends Wx::App

package HelloWorld;
use base qw(Wx::App);    # Inherit from Wx::App

sub OnInit

  # Every application has its own OnInit method that will
  # be called when the constructor is called.
{
    my $self  = shift;
    my $frame = Wx::Frame->new(
        undef,            # Parent window
        -1,               # Window id
        'Hello World',    # Title
        [ 1,   1 ],       # position X, Y
        [ 300, 300 ]      # size X, Y
    );
    $self->SetTopWindow($frame);    # Define the toplevel window
    $frame->Show(1);                # Show the frame
}

###########################################################
#
# The main program
#
package main;

my $wxobj = HelloWorld->new();    # New HelloWorld application
$wxobj->MainLoop;
