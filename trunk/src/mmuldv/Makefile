OBO=http://purl.obolibrary.org/obo/

mmuldv-uberon.obo: mmuldv.obo uberon-bridge-to-mmuldv.obo
	owltools  --create-ontology uberon/bridge/$@  $<  uberon-bridge-to-mmuldv.obo --merge-support-ontologies  --reasoner elk --merge-species-ontology -s 'Macaca mulata' -t NCBITaxon:9544 -o -f obo --no-check $@

uberon-bridge-to-mmuldv.obo: mmuldv.obo
	../util/make-bridge-axioms.pl NCBITaxon:9544  'rhesus macaque' $< > $@


old-mmuldv-uberon.obo: mmuldv.obo
	owltools  --create-ontology uberon/bridge/$@  $< $(OBO)/uberon/subsets/life-stages-core.obo uberon-bridge-to-mmuldv.obo --merge-support-ontologies  --reasoner elk --merge-equivalence-sets -s UBERON 10 -s MmulDv 1 -l UBERON 10 -l MmulDv 1 --reasoner elk \
 --merge-species-ontology -s 'Macaca mulata' -t NCBITaxon:9544 \
 --assert-inferred-subclass-axioms --removeRedundant --allowEquivalencies \
 -o -f obo --no-check $@
