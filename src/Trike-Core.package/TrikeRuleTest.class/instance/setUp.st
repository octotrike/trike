set up
setUp
	"Prepare my test fixture."
	| model |
	super setUp.
	model := TrikeModel named: 'Rule Test'.
	moonIsFull := TrikeTextRule named: 'The moon is full'.
	professorForgot := TrikeTextRule named: 'The professor forgot to take his hairball remedy'.
	timeMovingForwards := TrikeTextRule named: 'Time is moving forwards'.
	creatureLives := TrikeTextRule named: 'The mythical creature has not been killed'.
	moonIsNotFull := moonIsFull negated.
	student := TrikeActor named: 'Student' in: model.
	wizard := TrikeActor named: 'Wizard' in: model.
	isStudent := TrikeActorRule actor: student.
	isNotStudent := isStudent negated.
	isWizard := TrikeActorRule actor: wizard.
	self clearReceivedEvents