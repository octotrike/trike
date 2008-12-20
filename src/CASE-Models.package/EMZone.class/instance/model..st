accessing
model: entityModel
	"Set my model."

	model = entityModel ifTrue: [^self].
	model ifNotNil: [
		model removeZone: self].
	model := entityModel.
	self initializeForNewModel.
	model ifNotNil: [
		model addZone: self].