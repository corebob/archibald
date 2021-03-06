#!/usr/bin/env perl
#=======================================================================
# main.pl - Main entry point for installer generator
# Copyright (C) 2012  Dag Robøle
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
#=======================================================================

use strict;
use warnings;
use 5.010;
use IO::Handle;
require "./UI.pl";

use strict 'subs';

my $login = ( getpwuid $> );
die "This script must be run as root" if $login ne 'root';

open STDERR, ">stderr.log" or die $!;
STDERR->autoflush(1);

run();	

#=======================================================================
