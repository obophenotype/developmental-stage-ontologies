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
}

foreach my $id (keys %n) {
    if ($typem{$id} ne 'Term') {
        next;
    }
    my $name = $n{$id};
    print "[Term]\n";
    print "id: $id\n";
    printf('property_value: IAO:0000589 "%s (%s)" xsd:string', $name, $taxname);
    print "\n";
    if (!$x{$id}) {
        print "relationship: only_in_taxon $taxid ! $taxname\n";
    } else {
        print "intersection_of: $x{$id}\n";
        print "intersection_of: part_of $taxid\n";
    }
    print "\n";
}

foreach my $id (keys %x) {
    print "[Term]\n";
    print "id: $x{$id}\n";
    print "synonym: \"$n{$id}\" BROAD []\n";
    print "xref: $id\n";
    print "\n";
}

print "[Typedef]\n";
print "id: part_of\n";
print "xref: BFO:0000050\n\n";

print "[Typedef]\n";
print "id: only_in_taxon\n";
print "xref: RO:0002160\n\n";
