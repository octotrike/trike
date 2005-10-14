construction
populateColumn: columnNumber for: columnComponent 
	"Add intersections between columnComponent and whatever 
	component is depicted in each row to columnNumber."
	2
		to: self rowCount
		do: [:row | 
			| rowComponent | 
			rowComponent := self findComponentForRow: row.
			self
				addIntersectionOf: columnComponent
				and: rowComponent
				at: columnNumber @ row]