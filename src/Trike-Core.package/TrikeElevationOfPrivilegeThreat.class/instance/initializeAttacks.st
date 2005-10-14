initialization
initializeAttacks
	"Install my default attack stubs."

	| stateMachine changeConditions dataFlows |
	stateMachine := TrikeAttack named: 'change system state such that action is allowed'.
	changeConditions := TrikeAttack named: 'take an action in the system which changes the conditions a rule depends on'.
	
	changeConditions
		addAttack: (TrikeAttack named: 'take an intended action which changes a condition');
		addAttack: (TrikeAttack named: 'effect another threat which changes a condition').
	stateMachine
		addAttack: changeConditions;
		addAttack: (TrikeAttack named: 'reverse the action immediately after it occurs').
	dataFlows := TrikeAttack named: 'subvert the DFD elements for this action'.
	dataFlows
		addAttack: (TrikeAttack named: 'create, read, update or delete data on a data flow');
		addAttack: (TrikeAttack named: 'create, update or delete data on a data store');
		addAttack: (TrikeAttack named: 'cause a process to perform this action');
		addAttack: (TrikeAttack named: 'cause a legitimate actor to perform this action').
	self 
		addAttack: (TrikeAttack named: 'cause rules to pass when they shouldn''t');
		addAttack: stateMachine;
		addAttack: dataFlows