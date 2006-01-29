initialization
resetThreatRisks
	"Reset my global collection of intended actions such that all
	actions are unknown for all actors."
	self attacks
		do: [:attack | attack riskFactor: #Unknown]