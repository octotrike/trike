I test all of the classes in Logic-Boolean.

INSPIRATION

- Properties of Boolean logic documented on Wikipedia (see http://en.wikipedia.org/wiki/Boolean_logic)

LIMITATIONS

- No performance tests.
- No BLClauses with cycles.

INSTANCE VARIABLES

These instance variables are initialized by test setUp, then used by test*.
	
	a, b, c, d, notA:	predefined AtomicTerms used to test compound BLExpressions
	receivedEvents:	OrderedCollection of events received during this test; used to test change notification
