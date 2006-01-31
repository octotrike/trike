conversion
convertToNativeXML
	| actionElement knownActorsElement risksElement |
	actionElement := XMLElement new.
	actionElement name: 'action'.
	actionElement attributeAt: 'verb' put: self action;
		 attributeAt: 'id' put: self id;
		 attributeAt: 'intended' put: self isIntended.
	actionElement addElement: XMLElement new;
		 name: 'notes';
		 addContent: self notes.
	actionElement addElement: self asset referenceAsNativeXML.
	knownActorsElement := XMLElement new; name: 'knownActors'.
	self knownActors
		do: [:actor | knownActorsElement addElement: actor referenceAsNativeXML].
	actionElement addElement: knownActorsElement.
	actionElement addElement: self rule referenceAsNativeXML.
	risksElement := XMLElement new; name: 'risks'.
	risksElement addElement: XMLElement new;
		 name: 'risk';
		 attributeAt: 'goal' put: 'less';
		 attributeAt: 'value' put: self needsWork.
	risksElement addElement: XMLElement new;
		 name: 'risk';
		 attributeAt: 'goal' put: 'more';
		 attributeAt: 'value' put: self needsWork.
	actionElement addElement: risksElement.
	^ actionElement