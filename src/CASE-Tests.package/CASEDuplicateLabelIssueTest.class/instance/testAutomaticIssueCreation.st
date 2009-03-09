running
testAutomaticIssueCreation
	| a i j k q session |
	i := self targetClass labeled: 'cog'.
	j := self targetClass labeled: 'cog'.
	k := self targetClass labeled: 'gear'.
	q := self parentClass labeled: 'system'.
	q add: i as: #subcomponent.
	q add: k as: #subcomponent.
	session := self session.
	session addAll: {i. j. k. q}.
	
	"When a component is asked to add an equivalent but not equal component, a duplicate label issue should activate."
	q add: j as: #subcomponent.
	self should: [j parent = q].
	self should: [q subcomponents includes: j].
	self should: [i activeIssues size = 1].
	self should: [j activeIssues size = 1].
	self should: [i activeIssues only = j activeIssues only].
	a := i activeIssues only.
	self should: [a isKindOf: self targetClass]. 
	self should: [a isActive].
	self should: [a components size = 2].
	self should: [a components includes: i].
	self should: [a components includes: j].
	
	q remove: j as: #subcomponent.
	self shouldnt: [a isActive].
	self should: [i activeIssues isEmpty].
	self should: [j activeIssues isEmpty].

	"Likewise, when a component attempts to change its parent to a model which requires unique component labels and which already contains a component with the same label, a duplicate label issue should activate."
	j parent: q.
	self should: [j parent = q].
	self should: [q subcomponents includes: j].
	self should: [i activeIssues size = 1].
	self should: [j activeIssues size = 1].
	self should: [i activeIssues only = j activeIssues only].
	a := i activeIssues only.
	self should: [a isKindOf: self targetClass]. 
	self should: [a isActive].
	self should: [a components size = 2].
	self should: [a components includes: i].
	self should: [a components includes: j].
	
	j label: 'knob'.
	self shouldnt: [a isActive].
	self should: [a components isEmpty].
	
	"When a component attempts to change its label to be equivalent to another component in the same model and that model does not allow duplicate labels, a duplicate label issue should activate."
	k label: 'cog'.
	self should: [k label = 'cog'].
	self should: [i activeIssues size = 1].
	self should: [k activeIssues size = 1].
	self should: [q activeIssues size = 1].
	self should: [i activeIssues only = k activeIssues only].
	a := i activeIssues only.
	self should: [a isKindOf: self targetClass]. 
	self should: [a isActive].
	self should: [a components size = 2].
	self should: [a components includes: i].
	self should: [a components includes: k].



	


	
	