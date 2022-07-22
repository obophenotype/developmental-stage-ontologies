#!/usr/bin/perl

my $type;
my $id;
my $name;
my $isARelCount = 0;
my $partOfRelCount = 0;
my $hasPrecededBy = 0;
my @rootsByPartOf = ();
my @termsWithMultipleIsA = ();
my @termsWithNoIsA = ();
my @termsWithNoPrecededBy = ();
my $isObsolete = 0;
while(<>) {
    chomp;
    s/(\r\n|\r)/\n/g;

    if (m@^\[(\S+)\]@) {
        #analyze results for the previous term before moving to the next.
        #It's OK that we don't redo it for the last element, most likely it will be a relationship.
        if (defined($id) && defined($type) && $type eq 'Term' && !$isObsolete) {
            if ($isARelCount == 0) {
                push(@termsWithNoIsA, $id);
            } elsif ($isARelCount > 1) {
                push(@termsWithMultipleIsA, $id);
            }
            if ($partOfRelCount == 0) {
                push(@rootsByPartOf, $id);
            }
            if (!$hasPrecededBy) {
                push(@termsWithNoPrecededBy, $id);
            }
        }
        $type = $1;
        $id = undef;
        $name = undef;
        $isARelCount = 0;
        $partOfRelCount = 0;
        $hasPrecededBy = 0;
        $isObsolete = 0;
    }
    if ($type ne 'Term') {
        next;
    }
    if (m@^id: (\S+)@) {
        $id = $1;
    }
    if (m@^name: (.*)@) {
        $name = $1;
    }
    if (m@^is_a: .*@) {
        $isARelCount++;
    }
    if (m@^relationship: part_of .*@) {
        $partOfRelCount++;
    }
    if (m@^relationship: immediately_preceded_by .*@ ||
        m@^relationship: preceded_by .*@ ||
        m@^relationship: RO:0002087 .*@ ||
        m@^relationship: BFO:0000062 .*@ ||
        m@^relationship: RO:0002086 .*@ ||
        m@^relationship: starts_at_end_of .*@) {
        $hasPrecededBy = 1;
    }
    if (m@^is_obsolete: true.*@) {
        $isObsolete = 1;
    }
}

if (scalar @termsWithNoIsA > 0) {
    print '# Terms with no is_a relation: '."\n";
}
foreach $idToPrint (@termsWithNoIsA) {
    print "$idToPrint\n";
}
if (scalar @termsWithNoIsA > 0) {
    print "\n";
}

if (scalar @termsWithMultipleIsA > 0) {
    print '# Terms with multiple is_a relations: '."\n";
}
foreach $idToPrint (@termsWithMultipleIsA) {
    print "$idToPrint\n";
}   
if (scalar @termsWithMultipleIsA > 0) {
    print "\n";
}

if (scalar @rootsByPartOf > 0) {
    print '# Roots by part_of relations: '."\n";
}
foreach $idToPrint (@rootsByPartOf) {
    print "$idToPrint\n";
}   
if (scalar @rootsByPartOf > 0) {
    print "\n";
}

if (scalar @termsWithNoPrecededBy > 0) {
    print '# Terms with no preceded_by relations: '."\n";
}
foreach $idToPrint (@termsWithNoPrecededBy) {
    print "$idToPrint\n";
}  
if (scalar @termsWithNoPrecededBy > 0) {
    print "\n";
}
