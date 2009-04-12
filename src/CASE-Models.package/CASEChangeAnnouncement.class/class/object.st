private
object
	"Answer the object in my class name." 
	| myName verb startOfObject |
	
	myName := self name asString.
	verb := self verb.
	^verb 
		ifNil: [nil]
		ifNotNil: [
			startOfObject := (myName findString: verb) + verb size.
			myName copyFrom: startOfObject  to: myName size]

