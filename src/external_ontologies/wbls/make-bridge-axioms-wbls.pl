#!/usr/bin/perl

my $taxid = shift;
my $taxname = shift;

while(<>) {
    chomp;
    s/(\r\n|\r)/\n/g;
    if (m@^\[(\S+)\]@) {
        $type = $1;
    }
    if (m@id: (\S+)@) {
        $id = $1;
        #print "$id $type\n";
        $typem{$id} = $type;
    }
    if (m@^name: (.*)@) {
        $n{$id} = $1;
    }
    if (m@xref: (UBERON:\S+)@) {
        $x{$id} = $1;
    }
    if (m@is_a: WBls:0000822.*@) {
        $minuteTerms{$id} = $id;
    }
    if (m@relationship: part_of WBls:0000005.*@) {
        $mapping{$id} = 'UBERON:0000108';
    } elsif (m@relationship: part_of WBls:0000010.*@) {
        $mapping{$id} = 'UBERON:0000109';
    } elsif (m@relationship: part_of WBls:0000023.*@) {
        $mapping{$id} = 'UBERON:0004729';
    } elsif (m@relationship: part_of (WBls:\S+) .*@) {
        $mapping{$id} = $1;
    }
}

foreach my $id (keys %minuteTerms) {
    if ($typem{$id} ne 'Term') {
        next;
    }
    if (exists $mapping{$id}) {
        $usedInMapping{$mapping{$id}} = 1;
        print "[Term]\n";
        print "id: $id\n";
        printf('property_value: IAO:0000589 "%s (%s)" xsd:string', $n{$id}, $taxname);
        print "\n";
        print "intersection_of: $mapping{$id}\n";
        print "intersection_of: part_of $taxid\n";
        print "\n";
    }
}
foreach my $id (keys %usedInMapping) {
    print "[Term]\n";
    print "id: $id\n";
    my $isWbls = 'WBls:' eq substr($id, 0, 5);
    if ($isWbls) {
        printf('property_value: IAO:0000589 "%s (%s)" xsd:string', $n{$id}, $taxname);
        print "\n";
    }
    foreach my $idMin (keys %minuteTerms) {
        if ($typem{$idMin} ne 'Term') {
            next;
        }
        if ($mapping{$idMin} eq $id) {
            print "xref: $idMin\n";
        }
    }
    if ($isWbls) {
        print "relationship: only_in_taxon $taxid ! $taxname\n";
    }
    print "\n";
}

foreach my $id (keys %n) {
    if ($typem{$id} ne 'Term' || (exists $minuteTerms{$id} && exists $mapping{$id}) || exists $usedInMapping{$id}) {
        next;
    }
    my $name = $n{$id};
    print "[Term]\n";
    print "id: $id\n";
    printf('property_value: IAO:0000589 "%s (%s)" xsd:string', $name, $taxname);
    print "\n";
    print "relationship: only_in_taxon $taxid ! $taxname\n";
    print "\n";
}

print "[Typedef]\n";
print "id: part_of\n";
print "xref: BFO:0000050\n\n";

print "[Typedef]\n";
print "id: only_in_taxon\n";
print "xref: RO:0002160\n\n";
