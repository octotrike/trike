event handling
squeakActions
	"Answer an OrderedCollection of GenericActions for
	manipulating Squeak itself."
	| result operator |
	result := OrderedCollection new.
	operator := GenericAction
				label: 'Quit!'
				receiver: SmalltalkImage current
				selector: #snapshot:andQuit:
				arguments: {false. true}.
	operator description: 'Exit Trike without saving anything'.
	result add: operator.
	operator := GenericAction
				label: 'Save and Quit'
				receiver: SmalltalkImage current
				selector: #snapshot:andQuit:
				arguments: {true. true}.
	operator description: 'Save notebook state and exit Trike'.
	result add: operator.
	^ result