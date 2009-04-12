instance creation
newDiagram
	"Answer a new instance of me, initialized with a generic but valid very high level DFD."
	| process interactor newInstance |

	process := self labeled: 'Process'.
	interactor := self labeled: 'Interactor'.
	DFDFlow labeled: 'input' from: interactor to: process.
	DFDFlow labeled: 'output' from: process to: interactor.

	newInstance := self labeled: 'context'.
	newInstance
		add: process.

	^newInstance