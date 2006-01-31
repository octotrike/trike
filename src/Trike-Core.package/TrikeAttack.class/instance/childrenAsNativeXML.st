conversion
childrenAsNativeXML
	| childrenElement |
	childrenElement := XMLElement new.
	childrenElement name: 'children'.
	self hasChildren
		ifTrue: [self children
				do: [:child | childrenElement addElement: child referenceAsNativeXML]].
	^ childrenElement