event handling
unregisterForThreatEvents
	"Unregister for events from my threat."
	threat
		ifNotNil: [
			threat
				removeActionsWithReceiver: self forEvent: #riskFactor]