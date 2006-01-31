conversion
childrenAsNativeXML
	| childrenElement |
	childrenElement := XMLElement new.
	self hasChildren
		ifTrue: [self children
				do: [:child | childrenElement addElement: child referenceAsNativeXML]].
^childrenElement