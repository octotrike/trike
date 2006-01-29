initialization
initializeAttacks
	"Install my default attack stubs."
	| stateMachine changeConditions dataFlows |
	stateMachine := TrikeAttack named: 'Change system state such that action is allowed'.
	changeConditions := TrikeAttack named: 'Take an action in the system which changes the conditions a rule depends on'.
	changeConditions
		addAttack: (TrikeAttack named: 'Take an intended action which changes a condition');
		
		addAttack: (TrikeAttack named: 'Effect another threat which changes a condition').
	stateMachine addAttack: changeConditions;
		
		addAttack: (TrikeAttack named: 'Reverse the action immediately after it occurs').
	dataFlows := TrikeAttack named: 'Subvert the DFD elements for this action'.
	dataFlows
		addAttack: (TrikeAttack named: 'Create, read, update or delete data on a data flow');
		
		addAttack: (TrikeAttack named: 'Create, update or delete data on a data store');
		
		addAttack: (TrikeAttack named: 'Cause a process to perform this action');
		
		addAttack: (TrikeAttack named: 'Cause a legitimate actor to perform this action').
	self
		addAttack: (TrikeAttack named: 'Cause rules to pass when they shouldn''t');
		 addAttack: stateMachine;
		 addAttack: dataFlows