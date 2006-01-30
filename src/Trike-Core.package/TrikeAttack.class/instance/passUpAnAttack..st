event handling
passUpAnAttack: anAttack 
	parents do: [:parent | parent triggerEvent: #anAttack: with: anAttack]