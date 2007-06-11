initialization
atAllOthersPut: aBoolean 
	"Mark all nil values in my truthTable with aBoolean."
	1
		to: truthTable size
		do: [:index | (truthTable at: index)
				ifNil: [truthTable at: index put: aBoolean]]