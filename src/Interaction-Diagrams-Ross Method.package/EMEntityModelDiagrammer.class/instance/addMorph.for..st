accessing
addMorph: aMorph for: anObject
	"Add aMorph for anObject to my pasteUp."
	
	| array key |
	key := anObject uuid.
	array := (morphs at: key ifAbsent: [WeakArray new]) copyWith: aMorph.
	morphs at: key put: array.
	self pasteUp addMorph: aMorph
