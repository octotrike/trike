accessing
morphFor: anObject 
	"Answer the morph which displays anObject, or nil if none."
	
	| array |
	array := morphs at: anObject uuid ifAbsent: [^nil].
	array ifEmpty: [^nil].
	^array first