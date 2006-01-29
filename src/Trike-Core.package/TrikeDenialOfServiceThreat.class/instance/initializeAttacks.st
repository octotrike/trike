initialization
initializeAttacks
	"Install my default attack stubs."
	| stateMachine changeConditions dataFlows |
	stateMachine := TrikeAttack named: 'Change system state such that action is meaningless or prohibited'.
	changeConditions := TrikeAttack named: 'Take an action in the system which changes the conditions a rule depends on'.
	changeConditions
		addAttack: (TrikeAttack named: 'Take an intended action which changes a condition');
		
		addAttack: (TrikeAttack named: 'Effect another threat which changes a condition').
	stateMachine addAttack: changeConditions;
		
		addAttack: (TrikeAttack named: 'Reverse the action immediately after it occurs').
	dataFlows := TrikeAttack named: 'Disrupt the DFD elements for this action'.
	dataFlows
		addAttack: (TrikeAttack named: 'Prevent endpoints of a data flow from creating or reading data');
		
		addAttack: (TrikeAttack named: 'Create, update or delete data on a data flow');
		
		addAttack: (TrikeAttack named: 'Prevent process from performing its usual function');
		
		addAttack: (TrikeAttack named: 'Prevent legitimate process from crudding data on a data store');
		
		addAttack: (TrikeAttack named: 'Create, update or delete data on a data store');
		
		addAttack: (TrikeAttack named: 'Prevent actor from attempting action').
	self
		addAttack: (TrikeAttack named: 'Prevent rules for action from passing when they should ');
		 addAttack: stateMachine;
		 addAttack: dataFlows