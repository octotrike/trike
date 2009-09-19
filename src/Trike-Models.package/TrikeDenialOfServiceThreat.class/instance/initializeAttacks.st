initialization
initializeAttacks
	"Install my default attack stubs."
	| stateMachine changeConditions dataFlows |
	stateMachine := TrikeOrAttack named: 'Change system state such that action is meaningless or prohibited'.
	changeConditions := TrikeOrAttack named: 'Take an action in the system which changes the conditions a rule depends on'.
	changeConditions
		addAttack: (TrikeOrAttack named: 'Take an intended action which changes a condition');
		
		addAttack: (TrikeOrAttack named: 'Effect another threat which changes a condition').
	stateMachine addAttack: changeConditions;
		
		addAttack: (TrikeOrAttack named: 'Reverse the action immediately after it occurs').
	dataFlows := TrikeOrAttack named: 'Disrupt the DFD elements for this action'.
	dataFlows
		addAttack: (TrikeOrAttack named: 'Prevent endpoints of a data flow from creating or reading data');
		
		addAttack: (TrikeOrAttack named: 'Create, update or delete data on a data flow');
		
		addAttack: (TrikeOrAttack named: 'Prevent process from performing its usual function');
		
		addAttack: (TrikeOrAttack named: 'Prevent legitimate process from crudding data on a data store');
		
		addAttack: (TrikeOrAttack named: 'Create, update or delete data on a data store');
		
		addAttack: (TrikeOrAttack named: 'Prevent actor from attempting action').
	self
		addAttack: (TrikeOrAttack named: 'Prevent rules for action from passing when they should ');
		 addAttack: stateMachine;
		 addAttack: dataFlows