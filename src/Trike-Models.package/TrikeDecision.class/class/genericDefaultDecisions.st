examples
genericDefaultDecisions
	"Answer a generic bunch of decisions Trike can support."

	^{'Objectives'->{
		(self named: 'Set security objectives') planned: true.
		self named: 'Allocate security responsibilities among components'}.
	'Go/No-Go Decision'->{
		self named: 'Whether to purchase or ship'.
		self named: 'Whether to start development'.
		self named: 'Whether to continue development'}.
	'Choice from Alternatives'->{
		self named: 'Choose among different designs'.
		self named: 'Choose among different products'}.
	'Resource Allocation'->{
		self named: 'Set a budget'.
		self named: 'Set a deadline'.
		self named: 'Choose staffing levels'}.
	'Task Planning'->{
		self named: 'Gather data to minimize unknowns'.
		self named: 'Mitigate to maximize impact given resource constraints'.
		self named: 'Mitigate to meet objectives with minimal resources'}}.
