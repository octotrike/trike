drawing
removeAll
	"Remove all of my objects & connections from my pasteUp."
	
	| toRemove |
	pasteUp ifNil: [^#()].
	toRemove := Set new.
	toRemove addAll: connections.
	toRemove addAll: objectMorphs.
	objectMorphs := WeakValueDictionary new.
	connections := WeakValueDictionary new.
	self pasteUp removeAllMorphsIn: toRemove.
	^toRemove
