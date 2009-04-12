transactions
commit: aBlock 
	| result |
	
	[result := session commit: aBlock] on: MaError do: [
		reannouncementQueue := self newReannouncementQueue. 
		^nil].
	"Wait to reannounce until we are all the way out of the transaction."
	self inTransaction ifFalse: [self reannounce].
	^result
