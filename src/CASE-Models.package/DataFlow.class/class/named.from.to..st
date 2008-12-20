instance creation
named: label from: sourceDFDEntity to: destinationDFDEntity
	"Answer a new instance of me, initialized with label, sourceDFDEntity, destinationDFDEntity, and an appropriate trustDomain."

	| newInstance |
	
	newInstance _ self new.
	newInstance
		label: label;
		addIn: sourceDFDEntity;
		addOut: destinationDFDEntity.
	^ newInstance