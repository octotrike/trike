testing
isMalformed
	"Answer false if I follow all the below rules for data flows."

	| singleIn singleOut |

	"I have exactly one input and exactly one output."
	singleIn _ in only.
	singleOut _ out only.

	"At least one end of every data flow must be a process."
	^(in isProcess or: [out isProcess]) and: 

	"Neither end of a data flow can be a data flow."
	[in isFlow not and: [out isFlow not]] 

