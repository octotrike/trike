instance creation
simplified
	"Answer a simplified version of myself."
	| result |
	result := super simplified.
	result canHaveChildren not
		ifTrue: [^ result].
	result children size = 1
		ifTrue: [^children only].
	^ result