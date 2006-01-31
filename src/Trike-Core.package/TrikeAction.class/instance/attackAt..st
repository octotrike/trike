accessing
attackAt: threatClass 
	"Answer the attack of the given threatClass on me, or nil if there is none."
	^attacks
		detect: [:attack | attack class = threatClass]
		ifNone: [nil]