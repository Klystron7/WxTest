package Wx::App;

@ISA = qw(Wx::_App);

use strict;

# this allows multiple ->new calls and it is an horrible kludge to allow
# Wx::Perl::SplashFast to work "better"; see also App.xs:Start
sub new {
  my $this;

  my $class = ref( $_[0] ) || $_[0];
  if( ref( $Wx::wxTheApp ) ) {
    bless $Wx::wxTheApp, $class;
    $this = $Wx::wxTheApp;
  } else {
    $this = $_[0]->SUPER::new();
    bless $this, $class;
    $Wx::wxTheApp = $this;
  }

  $this->SetAppName( $_[0] ); # reasonable default for Wx::ConfigBase::Get

  my $ret = Wx::_App::Start( $this, $_[1] || $this->can( 'OnInit' ) );
  Wx::_croak( 'OnInit must return a true return value' ) unless $ret;

  $this;
}

sub OnInit { 0 }

package Wx::SimpleApp;

@Wx::SimpleApp::ISA = qw(Wx::App);

sub OnInit { 1 }

use Wx::Demo;
use Getopt::Long;

my $app    = Wx::App->new;
my $demo   = Wx::Demo->new;

$app->MainLoop;


