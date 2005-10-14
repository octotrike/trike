accessing
toggleAutomaticAssessmentSorting
	"Change whether to automatically sort my assessment tabs."
	automaticAssessmentSorting
		ifTrue: [automaticAssessmentSorting := false]
		ifFalse: [automaticAssessmentSorting := true]