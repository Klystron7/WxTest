#!/usr/bin/perl -w
use strict;
use Wx;

###########################################################
#
# Extend the Frame class to our needs
#
package MyFrame;

use Wx::Event qw( EVT_BUTTON );
use base qw/Wx::Frame/;            # Inherit from Wx::Frame

sub new {
    my $class = shift;

    my $self = $class->SUPER::new(@_);    # call the superclass' constructor

    # Then define a Panel to put the button on
    my $panel = Wx::Panel->new(
        $self,                            # parent
        -1                                # id
    );

    $self->{txt} = Wx::StaticText->new(
        $panel,                           # parent
        1,                                # id
        "A buttonexample.",               # label
        [ 50, 15 ]                        # position
    );

    my $BTNID = 1;                        # store the id of the button in $BTNID

    $self->{btn} = Wx::Button->new(
        $panel,                           # parent
        $BTNID,                           # ButtonID
        ">>> Press me <<<",               # label
        [ 50, 50 ]                        # position
    );

    EVT_BUTTON(
        $self,                            # Object to bind to
        $BTNID,                           # ButtonID
        \&ButtonClicked                   # Subroutine to execute
    );
    
    
    $self->{StaticText} = Wx::StaticText->new($panel, 2, "Select Output Format:");

    return $self;
}

sub ButtonClicked {
    my ( $self, $event ) = @_;

    # Change the contents of $self->{txt}
    $self->{txt}->SetLabel("The button was clicked!");
}

###########################################################
#
# Define our ButtonApp2 class that extends Wx::App
#
package ButtonApp2;

use base qw(Wx::App);    # Inherit from Wx::App

sub OnInit {
    my $self  = shift;
    my $frame = MyFrame->new(
        undef,                           # Parent window
        -1,                              # Window id
        'Button interaction example',    # Title
        [ 1,   1 ],                      # position X, Y
        [ 200, 150 ]                     # size X, Y
    );
    $self->SetTopWindow($frame);         # Define the toplevel window
    $frame->Show(1);                     # Show the frame
}

###########################################################
#
# The main program
#
package main;

my $wxobj = ButtonApp2->new();    # New ButtonApp application
$wxobj->MainLoop;
