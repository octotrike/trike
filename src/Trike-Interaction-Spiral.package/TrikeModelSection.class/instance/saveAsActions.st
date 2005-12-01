event handling
saveAsActions
	"Answer an OrderedCollection containing all save as actions  
	my instances support."
	| result |
	result := OrderedCollection new.
	self availableFormats do: [:format |
		result
			add: (GenericAction
					label: format name
					receiver: self
					selector: #saveAs:
					arguments: {format})]