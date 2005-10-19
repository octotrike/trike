streaming
nameIndented: indentNum 
	"Answer a text description of myself, indented indentNum
	times using 
	self class tab."
	| result |
	result := ''.
	indentNum
		timesRepeat: [result := result , self class tab].
	result := result , self asString.
	children
		do: [:each | result := result , String cr
						, (each nameIndented: indentNum + 1)].
	^ result