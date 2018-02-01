#!/usr/bin/perl

my @list = `ls merged*`;

for( my $i = 0; $i < @list; $i++){
	chomp($list[$i]);
	system("awk '!seen[\$0]++' $list[$i] > filt_$list[$i]; rm $list[$i]; cp filt_$list[$i] $list[$i]; rm filt_$list[$i];");
}
