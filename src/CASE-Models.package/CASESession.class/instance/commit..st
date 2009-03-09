transactions
commit: aBlock 
	[session commit: aBlock] on: MaError do: [
		reannouncementQueue := self newReannouncementQueue. 
		^self].
	"Wait to reannounce until we are all the way out of the transaction."
	self inTransaction ifFalse: [self reannounce].
