Logic-Boolean is a simple package for manipulating Boolean expressions.   It requires the Interaction-Actions package.

FEATURES
	
- Construct, compare, simplify, modify and evaluate Boolean expressions. 
- Use the supplied GenericActions to easily build an interface for things end users are likely to want to do.
- Use any type as an atom in an expression.
- Register to receive change notifications.

LIMITATIONS

- BLClauses with cycles have not been tested; infinite loops seem likely.
- Simplification and comparison are sometimes expensive; the conditions in which they are expensive are deterministic but have not been explored.
- The conditions in which parentheses matter when constructing BLExpressions have not been explored.
- Currently BLTruthTables and BLGrayCodes do not support
	- change notifications or
	- editing via GenericActions.
- Some glue is required to edit atoms using GenericActions.
- Currently evaluation is only supported when atoms are blocks with no arguments.

CLASSES

BLExpression				A Boolean expression (abstract class). 
	BLClause				Native (tree) representation of a Boolean expression (abstract class).
		BLAtomicTerm	Leaf node in a Boolean expression.  Atoms are not Boolean expressions (their type is external to this package & is determined by the package user).  
		BLCoordinator	Non-leaf (interior) node in a Boolean expression.  
	BLTruthTable			Alternative representation of a Boolean expression as an array of Boolean outcomes for various combinations (indexed by BLGrayCodes) of Boolean inputs (BLAtomicTerms).  Typically used to simplify or otherwise manipulate a BLClause. 
	BLGrayCode				Indices into BLTruthTables, typically used during simplification.

- Every BLExpression knows who its parents are. Parents may or may not be Boolean expressions.  

USE FROM CODE

Building expressions:
	Either the compiler or the dev tools have some assumptions about and:, or:, and Squeak's Boolean classes, so those messages were unavailable.
	
	a := BLAtomicTerm on: 'A'.
	b := BLAtomicTerm on: 'B'.
	a /\ b.
	a \/ b.
	a negated.
	
	As usual, beware parentheses when constructing compound expressions.
	
Simplifying expressions:
	Use 
		BLExpression>>simplified to get an equivalent, simplified BLExpression with a similar representation (BLClause or BLTruthTable).  This simplified BLExpression may be identical to the original BLExpression.
		BLExpression>>simplify to replace this BLExpression with a simplified expression.  The expression will be replaced for all of its parents.
	
Comparing expressions:
	Two BLAtomicTerms are equivalent when their atoms are equivalent and their negation is the same.
	Two BLExpressions are equivalent according to the rules of Boolean logic.  Parents are not considered.

Evaluating expressions:
	Use
		BLExpression>>value to evaluate the atoms (which must respond to #value) in an expression, combine them appropriately, and answer a regular Squeak Boolean.
	
Change notification:
	BLClauses use the events mechanism defined by Object (e.g. triggerEvent:, when:send:to:).  By default, BLClauses will receive only two events:
	
	#clause
		A BLAtomicTerm will trigger #clause on itself when
			its not variable changes or
			its atom changes.
		Subclasses and other related classes must ensure that any other event which changes the string representation of a BLClause also triggers #clause for that clause.
	
	#children
		A BLCooordinator will trigger #children on itself when children are added or removed.
		Subclasses must preserve this behavior.
	
GenericAction support:
	Use 
		BLClause>>asString to get a human-readable string
		BLClause>>hasChildren to determine whether a clause has subclauses
		BLClause>>editingActions:, clauseEditingActions:  or structureEditingActions: with a particular parent to get an OrderedCollection of GenericActions for editing this clause in the context of that parent 
			clauseEditingActions:		for editing this clause itself
			structureEditingActions:		for manipulating this clause as a child of the supplied parent
			editingActions:				for all editing actions
		BLExpression>>evaluationAction to evaluate the clause
		
	The following clauseEditingActions apply to all BLClauses:

		valueModificationAction
			BLAtomicTerm: value of atom
			BLCoordinator: type of coordinator
		negationAction
		simplificationAction
	
		For BLAtomicTerm>>valueModificationAction to work:
			An atom must register a GenericAction which allows setting the value of the atom.
			An atom must trigger #clause on any BLAtomicTerm which points to it, whenever its string representation changes. 
			
	When parents other than BLCoordinators are used, they must implement the following clauseEditing and structureEditingActions.

	The following clauseEditingActions apply to parents (typically BLCoordinators):

		additionActionNamed: aString
		
	The following clauseEditingActions apply to parents, acting on specific children:

		removalActionOn: child

	The following structureEditingActions apply to parents, acting on specific children:

		(likely useful as menus)
		promotionActionOn: child
		demotionActionOn: child
		reorderingUpActionOn: child
		reorderingDownActionOn: child

		(likely useful for drag & drop)
		adoptionActionOn: child before: nextChild

EXAMPLES

See BLTest and Trike.

LICENSE

For license see https://github.com/sparagi/logic/blob/master/LICENSE.
	
