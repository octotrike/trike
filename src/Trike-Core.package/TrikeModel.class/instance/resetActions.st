initialization
resetActions
	"Reset my global collection of intended actions such that all actions are unknown for all actors."

	self actions do: [:action |
		action reset]