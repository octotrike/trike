event handling
passUpNoAttack: anAttack 
	parents
		do: [:parent | parent triggerEvent: #noAttack: with: anAttack]