construction
populateRow: rowNumber for: rowComponent
	"Add intersections between whatever component is depicted in each 
	column and rowComponent to rowNumber."
	2
		to: self columnCount
		do: [:column | 
			| columnComponent | 
			columnComponent := self findComponentForColumn: column.
			self
				addIntersectionOf: columnComponent
				and: rowComponent
				at: column @ rowNumber]