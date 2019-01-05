#!/usr/bin/env perl

use warnings;
use strict;
use Wx;
use wxPerl::Constructors;


package MyFrame;
use base 'Wx::Frame';
use Wx::Event qw(EVT_CHECKBOX);
use base qw(Wx::CheckBox);

sub new {
    my $ref = shift;
    my $self = $ref->SUPER::new( undef,           # parent window
                                 -1,              # ID -1 means any
                                 'wxPerl rules',  # title
                                 [-1, -1],        # default position
                                 [250, 200],      # size
                                 );

    my $panel = Wx::Panel->new( $self,            # parent window
                                -1,               # ID
                                 );
    my $checkbox = wxPerl::CheckBox->new( $panel,'Check me' );

    # register the OnClick method as an handler for the
    # 'button clicked' event. The first argument is a Wx::EvtHandler
    # that receives the event
    
    EVT_CHECKBOX( $checkbox, $checkbox, \&OnCheck );

    return $self;
}

# this method receives as its first parameter the first argument
# passed to the EVT_CHECKBOX function. The second parameter
# always is a Wx::Event subclass
sub OnCheck {
            my ( $b, $event ) = @_;
            print ("checkbox clicked ");
            my $check = $b->GetValue();
            print ($check,"\n");
                         
            if ($check == 1) {
                $b->SetLabel('Checked');
            } else {
                $b->SetLabel('unChecked');
            } 
}

package MyApp;

use base 'Wx::App';

sub OnInit {
    my $frame = MyFrame->new;

    $frame->Show( 1 );
}

package main;

my $app = MyApp->new;
$app->MainLoop;    
