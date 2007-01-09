initialization
removeAll
	"Remove all of my objects & connections from my pasteUp."
	
	| toRemove |
	pasteUp ifNil: [^#()].
	toRemove := Set new.
	morphs values do: [:array |
		toRemove addAll: array].
	morphs := Dictionary new.
	self pasteUp removeAllMorphsIn: toRemove.
	^toRemove
