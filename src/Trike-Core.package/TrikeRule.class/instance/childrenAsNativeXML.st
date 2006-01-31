conversion
childrenAsNativeXML
	| childrenElement |
	childrenElement := XMLElement new.
	self children
		do: [:child | childrenElement addElement: XMLElement new;
				 name: 'rule';
				 attributeAt: 'reference' put: child id]