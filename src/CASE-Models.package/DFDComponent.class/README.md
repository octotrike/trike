'
	I am an abstract class.  Instances of my concrete subclasses represent entities which appear in data flow diagrams.

	Instance variables:

label
	Typically, a String which identifies or names this instance.  This label must be unique in the parent DataFlowDiagram, if any.

in
	A Collection of instances of one of my subclasses, which connect to this instance.  Instances which appear in in should include this instance in their out instance variable.

out
	Another Collection of instances of one of my subclasses, which this instance connects to.  Instances which appear in out should include this instance in their in instance variable.
	
parent
	The DataFlowDiagram which includes this instance.

	Author: Brenda Larcom <asparagi@hhhh.org>