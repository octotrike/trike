streaming
printToTranscript
	Transcript show: 'Name: ', name; cr; cr.
	Transcript show: 'Assets:'; cr.
	assets do: [:asset |
		asset printToTranscript].
	Transcript cr; show: 'Actors: '; cr.
	actors do: [:actor |
		actor printToTranscript].
	Transcript cr; show: 'Intended Actions: '; cr.
	self intendedActions do: [:action |
		action printToTranscript].
	Transcript cr; show: 'Threats and Attacks: '; cr.
	self attacks do: [:attack |
		attack printToTranscript].
	