accessing
model: anAssessment
	"Set my model to anAssessment and populate my tabs accordingly."

	model = anAssessment ifTrue: [^self].
	model ifNotNil: [
		model removeActionsWithReceiver: self forEvent: #name].
	model :=  anAssessment.
	model ifNotNil: [
		model when: #name send: #nameChanged to: self].
	self nameChanged.
	self pages do: [:m | 
		m model: anAssessment]