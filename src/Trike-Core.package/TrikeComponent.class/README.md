My instances are components of a TrikeModel.

Instance variables:

id			A UUID selected when I am initialized.
name		A String analysts use to identify me.
model		The TrikeModel in which I appear. 
notes		A String containing analysts' notes about me.

Dependents of one of my instances will receive the following messages:
		
update: #name	"my name changed"
update: #notes	"my notes changed"