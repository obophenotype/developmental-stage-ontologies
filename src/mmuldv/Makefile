OBO=http://purl.obolibrary.org/obo/

mmuldv-uberon.obo: mmuldv.obo uberon-bridge-to-mmuldv.obo
	owltools  --create-ontology uberon/bridge/$@  $<  uberon-bridge-to-mmuldv.obo --merge-support-ontologies  --reasoner elk --merge-species-ontology -s 'Macaca mulata' -t NCBITaxon:9544 -o -f obo --no-check $@

uberon-bridge-to-mmuldv.obo: mmuldv.obo
	../util/make-bridge-axioms.pl NCBITaxon:9544  'rhesus macaque' $< > $@

