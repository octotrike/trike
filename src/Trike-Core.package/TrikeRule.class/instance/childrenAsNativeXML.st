conversion
childrenAsNativeXML
	| childrenElement childElement |
	childrenElement := XMLElement new.
	childrenElement name: 'children'.
	self hasChildren
		ifTrue: [self children
				do: [:child | 
					childElement := child referenceAsNativeXML.
					childrenElement addElement: childElement]].
	^ childrenElement