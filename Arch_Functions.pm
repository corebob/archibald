#!/usr/bin/perl -w
#=======================================================================
package Arch_Functions;

use strict;
use warnings;

sub set_keymap
{
    my $km = shift;
    
    system("loadkeys $km > /dev/null 2>&1");
    
    if($?) {			
        return ($?, 'Unable to load keymap ' . $km);            
    }
    else {
        return ($?, 'Selected keymap ' . $km);            
    }
}

sub enable_interface
{
    my ($iface, $op) = @_;    
    
    `ip link set $iface up > /dev/null 2>&1`;    
    
    if($?) {			
        return ($?, 'Enabling interface ' . $iface . ' failed');            
    }
    else {
        return ($?, 'Interface ' . $iface . ' enabled successfully');            
    }
}

sub disable_interface
{
    my ($iface, $op) = @_;    
    
    `ip link set $iface down > /dev/null 2>&1`;    
    
    if($?) {			
        return ($?, 'Disabling interface ' . $iface . ' failed');            
    }
    else {
        return ($?, 'Interface ' . $iface . ' disabled successfully');            
    }
}
1;