accessing
model: aModel 
	"Set the model I am part of."
	model
		ifNotNil: [model triggerEvent: #noAttack: with: self.
			self removeActionsWithReceiver: model forEvent: #riskFactor].
	super model: aModel.
	model
		ifNotNil: [
			model
				triggerEvent: #anAttack: with: self;
				triggerEvent: #attacks.
			self
				when: #riskFactor
				send: #triggerEvent:
				to: model
				with: #attacks]