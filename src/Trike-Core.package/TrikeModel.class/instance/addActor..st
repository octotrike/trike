accessing
addActor: anActor 
	"Add anActor to the Collection of application roles in the system being modeled."

	| |
	actors add: anActor.
	self changed: #anActor with: anActor.
	^anActor