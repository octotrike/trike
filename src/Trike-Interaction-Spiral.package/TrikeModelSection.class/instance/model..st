accessing
model: anAssessment
	"Set my model to anAssessment, make me its dependent, and populate my tabs accordingly."

	model ifNotNil: [model removeDependent: self].
	anAssessment ifNotNil: [anAssessment addDependent: self].
	model :=  anAssessment.

	self update: #model with: anAssessment
	