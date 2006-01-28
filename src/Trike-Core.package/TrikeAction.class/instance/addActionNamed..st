event handling
addActionNamed: aSymbol 
	"This is a little questionable, but since it is only called from the
	UI, and the only manually editable children of an action are
	rules, we can leave out the type of the new child in this
	method name."
	| nodeClass |
	nodeClass := self baseNodeClass.
	^ GenericActions
		label: 'Add ' , aSymbol asString , ' ' , nodeClass label
		receiver: nodeClass
		selector: #addNodesAction:
		arguments: {self}