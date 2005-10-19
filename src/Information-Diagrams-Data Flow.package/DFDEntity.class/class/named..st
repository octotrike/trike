instance creation
named: label
	"Answer a new instance of me, initialized with label and trustDomain."

	| newInstance |
	
	newInstance _ self new.
	newInstance
		label: label.
	^ newInstance