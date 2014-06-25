#!/usr/bin/perl

my $taxid = shift;
my $taxname = shift;

while(<>) {
    chomp;
    s/(\r\n|\r)/\n/g;
    if (m@id: (\S+)@) {
        $id = $1;
    }
    if (m@^name: (.*)@) {
        $n{$id} = $1;
    }
    if (m@xref: (UBERON:\S+)@) {
        $x{$id} = $1;
    }
}

foreach my $id (keys %x) {
    my $name = $n{$id};
    print "[Term]\n";
    print "id: $id\n";
    printf('property_value: IAO:0000589 "%s (%s)" xsd:string', $name, $taxname);
    print "\n";
    print "intersection_of: $x{$id}\n";
    print "intersection_of: part_of: $taxid\n";
    print "\n";
}

print "[Typedef]\n";
print "id: part_of\n";
print "xref: BFO:0000050\n";
