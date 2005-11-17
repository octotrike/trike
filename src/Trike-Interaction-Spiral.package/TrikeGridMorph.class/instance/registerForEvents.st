event handling
registerForEvents
	"Register for events from my model."
	
	model ifNil: [^self].
	model 
		when: self rowAddSymbol send: #addRow: to: self;
		when: self rowRemoveSymbol send: #removeRow: to: self.
	self columnAddSymbol ifNotNil: [
		model when: self columnAddSymbol send: #addColumn: to: self].
	self columnRemoveSymbol ifNotNil: [
		model when: self columnRemoveSymbol send: #removeColumn: to: self].
		
	