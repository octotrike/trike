utility functions
indicesFor: numDigits 
	"Answer a gray code for the number of digits in question."
	numDigits = 0 ifTrue: [^#()].
	numDigits = 1
		ifTrue: [^ #('0' '1' )]
		ifFalse: [| lastCode thisCode index | 
			lastCode := self indicesFor: numDigits - 1.
			thisCode := Array new: lastCode size * 2.
			index := 1.
			lastCode
				do: [:code | 
					thisCode at: index put: '0' , code.
					index := index + 1].
			lastCode reversed
				do: [:code | 
					thisCode at: index put: '1' , code.
					index := index + 1].
			^ thisCode]