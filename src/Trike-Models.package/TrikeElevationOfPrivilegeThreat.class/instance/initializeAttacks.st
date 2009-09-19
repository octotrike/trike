initialization
initializeAttacks
	"Install my default attack stubs."
	| stateMachine changeConditions dataFlows |
	stateMachine := TrikeOrAttack named: 'Change system state such that action is allowed'.
	changeConditions := TrikeOrAttack named: 'Take an action in the system which changes the conditions a rule depends on'.
	changeConditions
		addAttack: (TrikeOrAttack named: 'Take an intended action which changes a condition');
		
		addAttack: (TrikeOrAttack named: 'Effect another threat which changes a condition').
	stateMachine addAttack: changeConditions;
		
		addAttack: (TrikeOrAttack named: 'Reverse the action immediately after it occurs').
	dataFlows := TrikeOrAttack named: 'Subvert the DFD elements for this action'.
	dataFlows
		addAttack: (TrikeOrAttack named: 'Create, read, update or delete data on a data flow');
		
		addAttack: (TrikeOrAttack named: 'Create, update or delete data on a data store');
		
		addAttack: (TrikeOrAttack named: 'Cause a process to perform this action');
		
		addAttack: (TrikeOrAttack named: 'Cause a legitimate actor to perform this action').
	self
		addAttack: (TrikeOrAttack named: 'Cause rules to pass when they shouldn''t');
		 addAttack: stateMachine;
		 addAttack: dataFlows