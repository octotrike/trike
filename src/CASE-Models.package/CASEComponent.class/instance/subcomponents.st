accessing
subcomponents
	"Answer my subcomponents."
	
	| answer |
	answer := IdentitySet new.
	self subcomponentNamespaces do: [:n |
		answer addAll: (components at: n)].
	^answer
