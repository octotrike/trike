My instances act as indices into a TrikeTruthTable.

A Gray code is a particular ordering of a complete set of binary strings with N digits, such that adjacent strings differ in exactly one bit position.  Instances of me also allow ? as a digit.  A ? would match either a 1 or a 0.

Instance variables:

index			A String of $0, $1 and $?, representing an index into a TrikeTruthTable.
truthTable	The TrikeTruthTable I index into.

marked		A temporary variable used only during the simplification process.