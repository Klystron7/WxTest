
use strict;
package MyFrame;    
 
use Wx qw[:everything];
use base qw(Wx::Frame);
use Wx::Event qw(EVT_MENU);

sub new {
    my( $class, $parent ) = @_;
    my $self = $class->SUPER::new( undef, -1, "Wx::BoxSizer",
                                   wxDefaultPosition, wxDefaultSize,
                                   wxDEFAULT_DIALOG_STYLE|wxRESIZE_BORDER );

    # top level sizer
    my $tsz = Wx::BoxSizer->new( wxVERTICAL );
    my $fr = Wx::BoxSizer->new( wxHORIZONTAL );
    # this button is fixed size, with some border
    $fr->Add( Wx::Button->new( $self, -1, 'Button 1' ),
              0, wxALL, 10 );
    # this button has no border
    $fr->Add( Wx::Button->new( $self, -1, 'Button 2' ), 0, 0 );
    # this one has borders just on the top and bottom
    $fr->Add( Wx::Button->new( $self, -1, 'Button 3' ), 0, wxTOP|wxBOTTOM, 5 );
    
#    my $panel = Wx::Panel->new(
#        $fr, -1, wxDefaultPosition, wxDefaultSize,
#        wxTAB_TRAVERSAL|wxBORDER_NONE
#        );
#    

    # first row can grow vertically, and horizontally
    $tsz->Add( $fr, 1, wxGROW );
    # second row is just some space
    $tsz->Add( 10, 10, 0, wxGROW );

    my $sr = Wx::BoxSizer->new( wxHORIZONTAL );
    # these elements compete for the available horizontal space
    $sr->Add( Wx::Button->new( $self, -1, 'Button 1' ), 1, wxALL, 5 );
    $sr->Add( Wx::Button->new( $self, -1, 'Button 2' ), 1, wxGROW|wxALL, 5 );
    # sizers can be arbitrarily nested
    my $nsz = Wx::StaticBoxSizer->new( Wx::StaticBox->new
                                       ( $self, -1, 'Wx::StaticBoxSizer' ),
                                       wxVERTICAL );
    $nsz->Add( Wx::Button->new( $self, -1, 'Button 3' ), 1, wxGROW|wxALL, 5 );
    $nsz->Add( Wx::Button->new( $self, -1, 'Button 4' ), 1, wxGROW|wxALL, 5 );
    $sr->Add( $nsz, 2, wxGROW );

    # add third row
    $tsz->Add( $sr, 1, wxGROW );

    # tell we want automatic layout
    #$panel->SetAutoLayout(1);
    $self->SetAutoLayout( 1 );
    $self->SetSizer( $tsz );
    # size the window optimally and set its minimal size
    $tsz->Fit( $self );
    $tsz->SetSizeHints( $self );

    return $self;
}

package MyWxBoxSizer;

use base qw(Wx::App);

sub OnInit

  # Every application has its own OnInit method that will
  # be called when the constructor is called.
{
    my $self  = shift;
    my $frame = MyFrame->new(
        undef,            # Parent window
        -1,               # Window id
        'MyBoxSizer',    # Title
        [ 1,   1 ],       # position X, Y
        [ 200, 150 ]      # size X, Y
    );
    $self->SetTopWindow($frame);    # Define the toplevel window
    $frame->Show(1);                # Show the frame
    
}

###########################################################
#
# The main program
#
package main;

my $wxobj = MyWxBoxSizer->new();   
$wxobj->MainLoop;

1;