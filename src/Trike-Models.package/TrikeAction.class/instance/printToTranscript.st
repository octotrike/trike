streaming
printToTranscript
	super printToTranscript.
	rule ifNotNil: [
	Transcript show: (rule nameIndented: 2); cr].
