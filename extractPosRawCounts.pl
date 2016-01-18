#!/usr/bin/perl

# Maria Stalteri
# 01/12/2014
# extractPosRawCounts.pl

use strict;
use warnings;

# 01/12/2014
# modified from extractEndogenousRawCounts.pl
# extract Pos counts to calc PLNF, positive lane normalization factor

# extract raw counts from the Nanostring .RCC files
# to plot data distribution;
# extract lines starting with Endogenous;
# this is the raw data, without normalization
# or pos and neg controls

# count number of lines matched
my $count = 0;

while (my $line = <>){
    # Data lines start with Endogenous (sample counts),
    # Positive or Negative
    # the Endogenous lines have 4 items, separated by commas
    # Endogenous. gene name, transcript ID, counts
    # print it as a tab-separated file

    # NOTE: file has Windows line endings \r\n
    # 386 lines matched Endogenous with grep
    # 360 lines match my regex
    # gene names with hyphens, 364 lines match
    # some names include lower case
    # a few names have parentheses and spaces and slash
    # that matches everything;

    # changed regex to reflect pattern for lines marked Positive
    if ($line =~ /^(Positive),([\w\(\)\.]+),([\w\.]+),(\d+)/){
        $count++;
        print "$1\t$2\t$3\t$4\n";
    }

}


print STDERR "Number of lines matching Positive: $count\n"; 

    

