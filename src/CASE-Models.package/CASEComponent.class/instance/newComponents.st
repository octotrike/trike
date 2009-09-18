initialization
newComponents
	"Answer a new Dictionary prepared to hold Components." 
	
	| answer |
	answer := Dictionary new.
	self namespaces do: [:n |
		answer at: n put: IdentitySet new].
	^answer
	