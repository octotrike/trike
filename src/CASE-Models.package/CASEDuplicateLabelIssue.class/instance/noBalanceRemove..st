private
noBalanceRemove: aComponent
	"Remove aComponent from my components.  If this leaves me with only one component, remove it, too."
	| result |
	
	aComponent unsubscribe: self.
	result := super noBalanceRemove: aComponent.
	components size = 1 ifTrue: [
		self remove: components only. 
		self deactivate].
	^result