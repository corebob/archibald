#!/usr/bin/perl -w
#=======================================================================

package Arch_UI;

use strict;
use warnings;
use Curses::UI;
use Arch_Callbacks;

my $cui;
my %win = ();

my %args = (
    -border       => 1, 
    -titlereverse => 0, 
    -pad          => 1,     
    -ipad         => 1,
);

sub run()
{        
    $cui = Curses::UI->new(-color_support => 1,-clear_on_exit => 1);    

    #=======================================================================
    # UI - Main menu
    #=======================================================================
    
    $win{'Menu_Main'} = $cui->add('Window_Menu_Main', 'Window',
        -title => 'Archibald: Main menu', %args, -bfg => 'red', -tfg => 'green',
        -onFocus => \&Arch_Callbacks::Menu_Main_Focus);
    
    $win{"Menu_Main"}->add(
        'mainmenu', 'Buttonbox',
        -y => 1,
        -vertical => 1,        	
        -buttons  => [
            { 	
                -label => 'Configure keymap',
                -value => 'configure_keymap',
                -onpress => sub { $win{'Configure_Keymap'}->focus }
            },{ 
                -label => 'Configure network',              
                -value => 'configure_network',
                -onpress => sub { $win{'Configure_Network'}->focus }
            },{ 
                -label => 'Prepare hard drive',              
                -value => 'prepare_hard_drive',
                -onpress => sub { $win{'Prep_Hard_Drive'}->focus }
            },{ 
                -label => 'Select installation mirror',              
                -value => 'select_installation_mirror',
                -onpress => sub { $win{'Select_Mirror'}->focus }
            },{ 
                -label => 'Install base system',              
                -value => 'install_base_system',
                -onpress => sub { $win{'Install_System'}->focus }
            },{ 
                -label => 'Configure the new system',              
                -value => 'configure_the_new_system',
                -onpress => sub { $win{'Configure_System'}->focus }
            },{
               -label => 'Log',						
                -value => 'log',
                -onpress => sub { $win{'Log'}->focus }
            },{	
                -label => 'Reboot',              
                -value => 'reboot_system',
                -onpress => sub { $win{'Reboot_System'}->focus }            
            },{ 
                -label => 'Quit',
                -value => 'quit',
                -onpress => sub { $win{'Quit'}->focus }
            }
        ]
    );    
    
    #=======================================================================
    # UI - Configure keymap
    #=======================================================================
    
    $win{'Configure_Keymap'} = $cui->add('Window_Configure_Keymap', 'Window',
        -title => 'Archibald: Configure keymap', %args, -bfg => 'red', -tfg => 'green',
        -onFocus => \&Arch_Callbacks::Configure_Keymap_Focus);
    
    $win{'Configure_Keymap'}->add(
        'info', 'Label',
        -y => 1,
        -width => -1,
        -bold => 1        
    );
    
    $win{'Configure_Keymap'}->add(
        undef, 'Buttonbox',		
        -y => 12,
        -buttons  => [
            { 
                -label => 'Browse keymaps',
                -value => 'browse_keymaps',
                -onpress => \&Arch_Callbacks::Configure_Keymap_Browse
            }
        ]
    );    

    $win{'Configure_Keymap'}->add(
        undef, 'Buttonbox',		
        -y => -1,
        -buttons  => [
            { 
                -label => 'Return to main menu',
                -value => 'return_to_main_menu',
                -onpress => sub { $win{'Menu_Main'}->focus }
            }
        ]
    );
    
    #=======================================================================
    # UI - Configure network
    #=======================================================================
    
    $win{'Configure_Network'} = $cui->add('Window_Configure_Network', 'Window', -bfg => 'red', -tfg => 'green',
        -title => 'Archibald: Configure network', %args,
        -onFocus => \&Arch_Callbacks::Configure_Network_Focus);
    
    $win{'Configure_Network'}->add(
        'info', 'Label',
        -x => 1, -y => 1,
        -width => -1,
        -bold => 1        
    );
    
    $win{'Configure_Network'}->add(
        'interfacelist', 'Radiobuttonbox',
        -x => 1, -y => 5,
        -width => -1, -height => 6
    );
    
    $win{'Configure_Network'}->add(
        undef, 'Buttonbox',		
        -y => 12,
        -buttons  => [
            { 
                -label => 'Enable',
                -value => 'enable',
                -onpress => \&Arch_Callbacks::Configure_Network_UpDown
            },{
                -label => 'Disable',
                -value => 'disable',
                -onpress => \&Arch_Callbacks::Configure_Network_UpDown
            }
        ]
    );
    
    $win{'Configure_Network'}->add(
        undef, 'Buttonbox',	
        -y => -1,        
        -buttons  => [
            { 
                -label => 'Return to main menu',
                -value => 'return_to_main_menu',
                -onpress => sub { $win{'Menu_Main'}->focus }
            }
        ]
    );
 
    #=======================================================================
    # UI - Prepare hard drive
    #=======================================================================
    
    $win{'Prep_Hard_Drive'} = $cui->add('Window_Prep_Hard_Drive', 'Window',
        -title => 'Archibald: Prepare hard drive', %args, -bfg => 'red', -tfg => 'green',
        -onFocus => \&Arch_Callbacks::Prep_Hard_Drive_Focus);
    
    $win{'Prep_Hard_Drive'}->add(
        'info', 'Label',
        -y => 1, -width => -1,
        -bold => 1        
    );    
    
    $win{'Prep_Hard_Drive'}->add(
        undef, 'Buttonbox',		
        -y => -1,
        -buttons  => [
            { 
                -label => 'Return to main menu',
                -value => 'return_to_main_menu',
                -onpress => sub { $win{'Menu_Main'}->focus }
            }
        ]
    );
    
    #=======================================================================
    # UI - Select installation mirror
    #=======================================================================
    
    $win{'Select_Mirror'} = $cui->add('Window_Select_Mirror', 'Window',
        -title => 'Archibald: Select installation mirror', %args, -bfg => 'red', -tfg => 'green',
        -onFocus => \&Arch_Callbacks::Select_Mirror_Focus);
    
    $win{'Select_Mirror'}->add(
        'info', 'Label',
        -y => 1, -width => -1,
        -bold => 1        
    );    
    
    $win{'Select_Mirror'}->add(
        undef, 'Buttonbox',		
        -y => -1,
        -buttons  => [
            { 
                -label => 'Return to main menu',
                -value => 'return_to_main_menu',
                -onpress => sub { $win{'Menu_Main'}->focus }
            }
        ]
    );
    
    #=======================================================================
    # UI - Install base system
    #=======================================================================
    
    $win{'Install_System'} = $cui->add('Window_Install_System', 'Window',
        -title => 'Archibald: Install base system', %args, -bfg => 'red', -tfg => 'green',
        -onFocus => \&Arch_Callbacks::Install_System_Focus);
    
    $win{'Install_System'}->add(
        'info', 'Label',
        -y => 1, -width => -1,
        -bold => 1        
    );    
    
    $win{'Install_System'}->add(
        undef, 'Buttonbox',		
        -y => -1,
        -buttons  => [
            { 
                -label => 'Return to main menu',
                -value => 'return_to_main_menu',
                -onpress => sub { $win{'Menu_Main'}->focus }
            }
        ]
    );
    
    #=======================================================================
    # UI - Configure system
    #=======================================================================
    
    $win{'Configure_System'} = $cui->add('Window_Configure_System', 'Window',
        -title => 'Archibald: Configure the new system', %args, -bfg => 'red', -tfg => 'green',
        -onFocus => \&Arch_Callbacks::Configure_System_Focus);
    
    $win{'Configure_System'}->add(
        'info', 'Label',
        -y => 1, -width => -1,
        -bold => 1        
    );    
    
    $win{'Configure_System'}->add(
        undef, 'Buttonbox',		
        -y => -1,
        -buttons  => [
            { 
                -label => 'Return to main menu',
                -value => 'return_to_main_menu',
                -onpress => sub { $win{'Menu_Main'}->focus }
            }
        ]
    );
    
    #=======================================================================
    # UI - Log
    #=======================================================================
    
    $win{'Log'} = $cui->add('Window_Log', 'Window',
        -title => 'Archibald: Showing recent error messages', %args, -bfg => 'red', -tfg => 'green',
        -onFocus => \&Arch_Callbacks::Log_Focus);
    
    $win{'Log'}->add(
        'editor', 'TextViewer',
        -y => 1, -width => -1, -height => 12,
        -bold => 1,
        -singleline => 0,
        -wrapping => 1,
        -border => 1,
        -vscrollbar => 'right'
    );
    
    $win{'Log'}->add(
        undef, 'Buttonbox',		
        -y => -1,
        -buttons  => [
            { 
                -label => 'Return to main menu',
                -value => 'return_to_main_menu',
                -onpress => sub { $win{'Menu_Main'}->focus }
            }
        ]
    );
    
    #=======================================================================
    # UI - Reboot system
    #=======================================================================
    
    $win{'Reboot_System'} = $cui->add('Window_Reboot_System', 'Window',
        -title => 'Archibald: Reboot system', %args, -bfg => 'red', -tfg => 'green',
        -onFocus => \&Arch_Callbacks::Reboot_System_Focus);
    
    $win{'Reboot_System'}->add(
        'info', 'Label',
        -y => 1, -width => -1,
        -bold => 1        
    );    
    
    $win{'Reboot_System'}->add(
        undef, 'Buttonbox',		
        -y => -1,
        -buttons  => [
            { 
                -label => 'Return to main menu',
                -value => 'return_to_main_menu',
                -onpress => sub { $win{'Menu_Main'}->focus }
            }
        ]
    );
    
    #=======================================================================
    # UI - Quit
    #=======================================================================
    
    $win{'Quit'} = $cui->add('Window_Quit', 'Window',
        -title => 'Archibald: Quit', %args, -bfg => 'red', -tfg => 'green',
        -onFocus => \&Arch_Callbacks::Quit_Focus);
    
    $win{'Quit'}->add(
        'info', 'Label',
        -y => 1, -width => -1,
        -bold => 1        
    );    
    
    $win{'Quit'}->add(
        undef, 'Buttonbox',	
        -y => -1,        
        -buttons  => [
            { 
                -label => 'Yes',
                -value => 'yes',
                -onpress => \&handler_quit
            },{
                -label => 'No',
                -value => 'no',
                -onpress => sub { $win{'Menu_Main'}->focus }
            }
        ]
    );
    
    sub handler_quit()
    {
        $cui->mainloopExit();
        exit(0);
    }
    
    #=======================================================================
    # Driver
    #=======================================================================
    
    # Bind <CTRL+Q> to quit.
    $cui->set_binding( \&handler_quit, "\cQ" );
    
    $win{'Menu_Main'}->focus;
    $cui->mainloop;
}

#=======================================================================
1;