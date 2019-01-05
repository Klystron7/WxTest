package MyWxListBox;

use strict;
use Wx qw[:everything];
use base qw(Wx::DemoModules::lib::BaseModule Class::Accessor::Fast);

use Wx qw(:listbox wxNOT_FOUND);
use Wx::Event qw(EVT_LISTBOX EVT_LISTBOX_DCLICK);

__PACKAGE__->mk_accessors( qw(listbox) );

sub styles {
    my( $self ) = @_;

    return ( [ wxLB_SORT, 'Sorted' ],
             [ wxLB_ALWAYS_SB, 'Always show scrollbars' ],
             [ wxLB_HSCROLL, 'Horizontal scrollbar' ],
             [ wxLB_SINGLE, 'Single selection' ],
             [ wxLB_MULTIPLE, 'Multiple selection' ],
             [ wxLB_EXTENDED, 'Extended selection' ],
             );
}

sub commands {
    my( $self ) = @_;

    return ( { label       => 'Select item',
               with_value  => 1,
               action      => sub { $self->listbox->SetSelection( $_[0] ) },
               },
             { label       => 'Select string',
               with_value  => 1,
               action      => sub { $self->listbox
                                      ->SetStringSelection( $_[0] ) },
               },
             { label       => 'Clear',
               action      => sub { $self->listbox->Clear },
               },
             { label       => 'Append',
               with_value  => 1,
               action      => sub { $self->listbox->Append( $_[0] ) },
               },
             { label       => 'Delete selected item',
               action      => \&on_delete_selected,
               },
               );
}

sub create_control {
    my( $self ) = @_;

    my $choices = [ 'This', 'is one of my',
                    'really', 'wonderful', 'examples', ];

    my $listbox = Wx::ListBox->new( $self, -1, [-1, -1],
                                    [-1, -1], $choices, $self->style );
    SetControlClientData( 'listbox', $listbox );

    EVT_LISTBOX( $self, $listbox, \&OnListBox );
    EVT_LISTBOX_DCLICK( $self, $listbox, \&OnListBoxDoubleClick );

    return $self->listbox( $listbox );
}

sub SetControlClientData {
    my( $name, $ctrl ) = @_;

    foreach my $i ( 1 .. $ctrl->GetCount() ) {
        my $text = $ctrl->GetString( $i - 1 );

        $ctrl->SetClientData( $i - 1, "$name client data for $text" );
    }
}

sub OnListBox {
    my( $self, $event ) = @_;

    if( $event->GetInt() == -1 ) {
        Wx::LogMessage( "List box has no selections any more" );
        return;
    }

    Wx::LogMessage( join '', "ListBox Event selection string is '",
                             $event->GetString(), "'" );
    Wx::LogMessage( join '', "ListBox Control selection string is '",
                             $self->listbox->GetStringSelection(), "'" );

    my $cde = $event->GetClientData();
    my $cdl = $self->listbox->GetClientData( $self->listbox->GetSelection() );
    Wx::LogMessage( join '', "ListBox Event client data is '",
                             ( $cde ? $cde : 'none' ) , "'" );
    Wx::LogMessage( join '', "ListBox Control client data is '",
                             ( $cdl ? $cdl : 'none' ) );
}

sub OnListBoxDoubleClick {
    my( $self, $event ) = @_;

    Wx::LogMessage( join '', "ListBox double click string is '",
                             $event->GetString(), "'" ) ;
}

sub on_delete_selected {
    my( $self ) = @_;
    my( $idx );

    if( ( $idx = $self->listbox->GetSelection() ) != wxNOT_FOUND ) {
        $self->listbox->Delete( $idx );
    }
}



sub OnInit

  # Every application has its own OnInit method that will
  # be called when the constructor is called.
{
    my $self  = shift;
    my $frame = MyFrame->new(
        undef,            # Parent window
        -1,               # Window id
        'Hello World',    # Title
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

my $wxobj = MyWxListBox->new();   
$wxobj->MainLoop;

1;
