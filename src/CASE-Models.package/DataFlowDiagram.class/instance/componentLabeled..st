accessing
componentLabeled: aString
	"Answer the DFDEntity from my components which is labeled aString, or nil."
	| answer |

	answer _ components select: [:child | child label = aString].
	(answer size > 1) ifTrue: [MalformedDFDException signal].
	^answer anyOne