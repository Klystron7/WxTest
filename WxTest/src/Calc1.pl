#!/usr/bin/perl -w -- 
#
# generated by wxGlade 0.9.0b2 on Sun Dec 16 18:27:24 2018
#
# To get wxPerl visit http://www.wxperl.it
#

use Wx qw[:allclasses];
use strict;

# begin wxGlade: dependencies
# end wxGlade

# begin wxGlade: extracode
# end wxGlade

package CalculatorFrame;

use Wx qw[:everything];
use base qw(Wx::Frame);
use strict;

sub new {
    my( $self, $parent, $id, $title, $pos, $size, $style, $name ) = @_;
    $parent = undef              unless defined $parent;
    $id     = -1                 unless defined $id;
    $title  = ""                 unless defined $title;
    $pos    = wxDefaultPosition  unless defined $pos;
    $size   = wxDefaultSize      unless defined $size;
    $name   = ""                 unless defined $name;

    # begin wxGlade: CalculatorFrame::new
    $style = wxDEFAULT_FRAME_STYLE
        unless defined $style;

    $self = $self->SUPER::new( $parent, $id, $title, $pos, $size, $style, $name );
    $self->SetSize(Wx::Size->new(370, 309));
    $self->{panel_1} = Wx::Panel->new($self, wxID_ANY);
    $self->{text_ctrl_1} = Wx::TextCtrl->new($self->{panel_1}, wxID_ANY, "");
    $self->{radiobox_operator} = Wx::RadioBox->new($self->{panel_1}, wxID_ANY, "", wxDefaultPosition, wxDefaultSize, ["+", "-", "*", "/"], 1, wxRA_SPECIFY_ROWS);
    $self->{text_ctrl_2} = Wx::TextCtrl->new($self->{panel_1}, wxID_ANY, "");
    $self->{text_result} = Wx::TextCtrl->new($self->{panel_1}, wxID_ANY, "", wxDefaultPosition, wxDefaultSize, wxTE_MULTILINE|wxTE_READONLY);
    $self->{button_execute} = Wx::Button->new($self->{panel_1}, wxID_ANY, "Execute");
    $self->{button_reset} = Wx::Button->new($self->{panel_1}, wxID_ANY, "Reset");

    $self->__set_properties();
    $self->__do_layout();

    # end wxGlade
    return $self;

}


sub __set_properties {
    my $self = shift;
    # begin wxGlade: CalculatorFrame::__set_properties
    $self->SetTitle("Calculator");
    $self->{radiobox_operator}->SetSelection(0);
    $self->{text_result}->SetBackgroundColour(Wx::Colour->new(212, 208, 200));
    $self->{button_execute}->SetDefault();
    # end wxGlade
}

sub __do_layout {
    my $self = shift;
    # begin wxGlade: CalculatorFrame::__do_layout
    $self->{sizer_1} = Wx::BoxSizer->new(wxVERTICAL);
    $self->{sizer_2} = Wx::BoxSizer->new(wxVERTICAL);
    $self->{sizer_7} = Wx::BoxSizer->new(wxHORIZONTAL);
    $self->{sizer_5} = Wx::BoxSizer->new(wxHORIZONTAL);
    $self->{sizer_4} = Wx::BoxSizer->new(wxHORIZONTAL);
    $self->{sizer_6} = Wx::BoxSizer->new(wxHORIZONTAL);
    $self->{sizer_3} = Wx::BoxSizer->new(wxHORIZONTAL);
    my $label_1 = Wx::StaticText->new($self->{panel_1}, wxID_ANY, "Value 1:");
    $self->{sizer_3}->Add($label_1, 0, wxALIGN_CENTER_VERTICAL, 0);
    $self->{sizer_3}->Add($self->{text_ctrl_1}, 1, 0, 0);
    $self->{sizer_2}->Add($self->{sizer_3}, 0, wxEXPAND, 0);
    my $label_4 = Wx::StaticText->new($self->{panel_1}, wxID_ANY, "Operator:");
    $self->{sizer_6}->Add($label_4, 0, wxALIGN_CENTER_VERTICAL, 0);
    $self->{sizer_6}->Add($self->{radiobox_operator}, 0, 0, 0);
    $self->{sizer_2}->Add($self->{sizer_6}, 0, wxEXPAND, 0);
    my $label_2 = Wx::StaticText->new($self->{panel_1}, wxID_ANY, "Value 2:");
    $self->{sizer_4}->Add($label_2, 0, wxALIGN_CENTER_VERTICAL, 0);
    $self->{sizer_4}->Add($self->{text_ctrl_2}, 1, 0, 0);
    $self->{sizer_2}->Add($self->{sizer_4}, 0, wxEXPAND, 0);
    my $static_line_1 = Wx::StaticLine->new($self->{panel_1}, wxID_ANY);
    $self->{sizer_2}->Add($static_line_1, 0, wxBOTTOM|wxEXPAND|wxTOP, 5);
    my $label_3 = Wx::StaticText->new($self->{panel_1}, wxID_ANY, "Result:");
    $self->{sizer_5}->Add($label_3, 0, 0, 0);
    $self->{sizer_5}->Add($self->{text_result}, 1, wxEXPAND, 0);
    $self->{sizer_2}->Add($self->{sizer_5}, 1, wxEXPAND, 0);
    $self->{sizer_7}->Add($self->{button_execute}, 0, wxALL, 5);
    $self->{sizer_7}->Add($self->{button_reset}, 0, wxALL, 5);
    $self->{sizer_2}->Add($self->{sizer_7}, 0, wxALIGN_CENTER_HORIZONTAL, 0);
    $self->{panel_1}->SetSizer($self->{sizer_2});
    $self->{sizer_1}->Add($self->{panel_1}, 1, wxEXPAND, 0);
    $self->SetSizer($self->{sizer_1});
    $self->Layout();
    # end wxGlade
}

# end of class CalculatorFrame

1;

package MyApp;

use base qw(Wx::App);
use strict;

sub OnInit {
    my( $self ) = shift;

    Wx::InitAllImageHandlers();

    my $frame = CalculatorFrame->new();

    $self->SetTopWindow($frame);
    $frame->Show(1);

    return 1;
}
# end of class MyApp

package main;

unless(caller){
    my $app = MyApp->new();
    $app->MainLoop();
}
