#!/usr/bin/perl
use strict;
while($_ = <>){
    chomp( $_ );
    if( $_ =~ m/\s*(.*\.dll)\s*=>\s*([^\(]*)/i ){
	my $module_name = $1;
	my $path = $2;
	if( $2 !~ m|^/c/Windows|i ){
	    printf "%s\n" , $module_name;
	}
    }
}
