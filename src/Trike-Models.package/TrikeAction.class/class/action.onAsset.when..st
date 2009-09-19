instance creation
action: actionSymbol onAsset: anAsset when: aRule 
	"Answer a new instance of me which represents actionSymbol
	on anAsset when aRule is met."
	^ self new asset: anAsset;
		 action: actionSymbol;
		 rule: aRule;
		yourself