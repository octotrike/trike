initialization
initializeAttacks
	"Install my default attack stubs."

	| stateMachine changeConditions dataFlows |
	stateMachine := TrikeAttack named: 'change system state such that action is meaningless or prohibited'.
	changeConditions := TrikeAttack named: 'take an action in the system which changes the conditions a rule depends on'.
	
	changeConditions
		addAttack: (TrikeAttack named: 'take an intended action which changes a condition');
		addAttack: (TrikeAttack named: 'effect another threat which changes a condition').
	stateMachine
		addAttack: changeConditions;
		addAttack: (TrikeAttack named: 'reverse the action immediately after it occurs').
	dataFlows := TrikeAttack named: 'disrupt the DFD elements for this action'.
	dataFlows
		addAttack: (TrikeAttack named: 'prevent endpoints of a data flow from creating or reading data');
		addAttack: (TrikeAttack named: 'create, update or delete data on a data flow');
		addAttack: (TrikeAttack named: 'prevent process from performing its usual function');
		addAttack: (TrikeAttack named: 'prevent legitimate process from crudding data on a data store');
		addAttack: (TrikeAttack named: 'create, update or delete data on a data store');
		addAttack: (TrikeAttack named: 'prevent actor from attempting action').
	self 
		addAttack: (TrikeAttack named: 'prevent rules for action from passing when they should ');
		addAttack: stateMachine;
		addAttack: dataFlows

