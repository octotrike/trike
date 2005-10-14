initialization
initialize
	"Set my initial state."

	| states |
	super initialize.
	self colors: self class statesToColors.
	states := self class states.
	1 to: states size
		do: 
			[:index | 
			| previousState thisState |
			thisState := states at: index.
			previousState := index = 1 
				ifTrue: [states last]
				ifFalse: [states at: index - 1].
			self 
				on: #click
				over: previousState
				send: #currentState:
				to: self
				withValues: (Array with: thisState)]