#!/usr/bin/perl
use strict;
use warnings;
use utf8;
use Getopt::Long;

# Print short_text, full_text
printf "lol\n";

# Print color, if needed
if ("true") {
    print "#FF0000\n";
    exit 33;
} elsif ("dlspd") {
    print "#FFFC00\n";
}

exit 0;
