set up
setUp
	"Prepare my test fixture.  Run before each test* method."
	super setUp.
	a := BLAtomicTerm on: 'A'.
	b := BLAtomicTerm on: 'B'.
	c := BLAtomicTerm on: 'C'.
	d := BLAtomicTerm on: 'D'.
	notA := a negated.
	self clearReceivedEvents