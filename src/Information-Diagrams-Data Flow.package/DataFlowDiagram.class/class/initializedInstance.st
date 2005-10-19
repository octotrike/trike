instance creation
initializedInstance
	"Answer a new instance of me, initialized with a generic but valid very high level DFD."

	| process interactor newInstance |

	process _ DataProcessor named: 'Process'.
	interactor _ DataProcessor named: 'Interactor'.
	DataFlow named: 'input' from: interactor to: process.
	DataFlow named: 'output' from: process to: interactor.

	newInstance _ self named: 'context'.
	newInstance
		add: process.

	^newInstance