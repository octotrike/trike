set up
setUp
	"Prepare my test fixture."
	super setUp.
	model := TrikeModel initializedInstance.
	moonIsFull := TrikeTextRule named: 'the moon is full'.
	professorForgot := TrikeTextRule named: 'the professor forgot to take his hairball remedy'.
	timeMovingForwards := TrikeTextRule named: 'Time is moving forwards'.
	creatureLives := TrikeTextRule named: 'The mythical creature has not been killed'.
	moonIsNotFull := moonIsFull negated.
	student := TrikeActor named: 'Student' in: model.
	wizard := TrikeActor named: 'Wizard' in: model.
	isStudent := TrikeActorRule actor: student.
	isWizard := TrikeActorRule actor: wizard