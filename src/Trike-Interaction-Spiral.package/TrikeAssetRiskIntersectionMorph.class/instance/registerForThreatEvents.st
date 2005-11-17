event handling
registerForThreatEvents
	"Register for events from my threat."
	threat
		ifNotNil: [
			threat
				when: #riskFactor send: #currentStateChanged to: self]