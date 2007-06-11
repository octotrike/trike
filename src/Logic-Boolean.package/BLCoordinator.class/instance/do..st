enumeration
do: aBlock
	"Perform a block on myself and then visit all of my children."

	super do: aBlock.
	children do: [:child | child do: aBlock].